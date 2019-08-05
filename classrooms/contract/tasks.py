from __future__ import absolute_import
from django.contrib.auth.models import User
from rest_framework import serializers
from celery import shared_task
from classrooms.celery import app
from django.core.mail import EmailMessage
from .models import *
import json
from school_users.models import *
from block.models import *
from classrooms import settings
import os
from django.template.loader import render_to_string
from school.models import *
from contract.models import *
from school.utils import get_sku_by_slm_url
from contract.utils import MagentoSoap

wsdl = 'http://maplebearmkt2.widehomolog.biz/api/v2_soap?wsdl=1'
username = 'tell-me'
apiKey = 'tell-me@0619'
soap = MagentoSoap(wsdl, username, apiKey)

def update_sku_of_slm_material_of_class(class_linked_to_contract):
    sku = class_linked_to_contract.sku

    if not sku:
        slm = class_linked_to_contract.slm

        if not slm:
            return sku

        sku = get_sku_by_slm_url(slm)
        if not sku:
            return sku

        class_linked_to_contract.sku = sku
        class_linked_to_contract.save()
    return sku

@app.task
def update_material_orders_from_maple_bear():
    
    not_purchased_slm_contracts = Contract.objects.filter(purchased_slm=False)

    soap.start_batch_operations()

    print('Contracts to process:', len(not_purchased_slm_contracts))
    counter = 0
    for contract_not_purchased_slm in not_purchased_slm_contracts:
        counter += 1
        if contract_not_purchased_slm.chain != None:
            
            contract_chain_id = contract_not_purchased_slm.chain.id
            class_linked_to_contract = Class.objects.get(class_id=contract_chain_id)

            if class_linked_to_contract == None: 
                continue

            sku = update_sku_of_slm_material_of_class(class_linked_to_contract)
            if not sku: 
                continue

            contract_created_entry_date = str(contract_not_purchased_slm.created_at.date())

            print('==================================================')
            print('Processing:', counter)
            print('class_linked_to_contract:', class_linked_to_contract)
            print('student', student)
            print('sku:', sku)
            print('contract_created_entry_date:', contract_created_entry_date)

            try:
                first_parent = contract_not_purchased_slm.first_auth_signe
                first_parent_maple_bear_email = first_parent.maple_bear_email
                if first_parent_maple_bear_email:
                    print('first_parent:', first_parent)
                    print('first_parent_maple_bear_email:', first_parent_maple_bear_email)
                    # first_parent_has_purchased_slm = soap.has_customer_purchased_product_after_date(first_parent_maple_bear_email, sku, contract_created_entry_date)
                    first_parent_has_purchased_slm = soap.has_customer_purchased_product(first_parent_maple_bear_email, sku)
                    print('first_parent_has_purchased_slm:', first_parent_has_purchased_slm)
                    if first_parent_has_purchased_slm:
                        contract_not_purchased_slm.purchased_slm = True
                        contract_not_purchased_slm.save()
                        print('saved purchased slm')
                        continue
            except:
                pass

            try:
                second_parent = contract_not_purchased_slm.second_auth_signe
                second_parent_maple_bear_email = second_parent.maple_bear_email
                if second_parent_maple_bear_email:
                    print('second_parent:', second_parent)
                    print('second_parent_maple_bear_email:', second_parent_maple_bear_email)
                    # second_parent_has_purchased_slm = soap.has_customer_purchased_product_after_date(second_parent_maple_bear_email, sku, contract_created_entry_date)
                    second_parent_has_purchased_slm = soap.has_customer_purchased_product(second_parent_maple_bear_email, sku)
                    print('second_parent_has_purchased_slm:', second_parent_has_purchased_slm)
                    if second_parent_has_purchased_slm:
                        contract_not_purchased_slm.purchased_slm = True
                        contract_not_purchased_slm.save()
                        print('saved purchased slm')
                        continue
            except:
                pass

            try:
                student = contract_not_purchased_slm.student_auth_signe
                student_maple_bear_email = student.maple_bear_email
                if student_maple_bear_email:
                    print('student:', student)
                    print('student_maple_bear_email:', student_maple_bear_email)
                    student_has_purchased_slm = soap.has_customer_purchased_product(student_maple_bear_email, sku)
                    print('student_has_purchased_slm:', student_has_purchased_slm)
                    if student_has_purchased_slm:
                        contract_not_purchased_slm.purchased_slm = True
                        contract_not_purchased_slm.save()
                        print('saved purchased slm')
                        continue
            except:
                pass

    soap.end_batch_operations()

@app.task #1
def schedule_email(contract, typeof=None):
    if typeof == 'json':
        first_parent_id = list(contract['first_auth_signe'].values())[0]
        contract['first_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
        second_parent_id = list(contract['second_auth_signe'].values())[0]
        contract['second_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
        counter_signe_id = list(list(contract['counter_signe'].values())[0].values())[0]
        contract['counter_signe'] = Head.objects.get(profile=User.objects.get(id=counter_signe_id))
        chain_id = list(contract['chain'].values())[0]
        contract['chain'] = Chain.objects.get(id=chain_id)
        contract = Contract(**contract)
        contract.pdf.name = contract.pdf.name.split('/')[1]
        contract.pdf.name = os.path.join(os.path.dirname(settings.BASE_DIR),'media_cdn', contract.pdf.name)
    attachments = []
    content = contract.pdf.read()
    attachment = (contract.pdf.name, content, 'application/pdf')
    attachments.append(attachment)
    if contract.first_auth_signe:
        mail_subject = 'Contract to be signed'
        school = School.objects.get(chains__id__exact = contract.chain.id)
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.first_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.first_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email], attachments=attachments
        )
        email.send()
    if contract.second_auth_signe:
        mail_subject = 'Contract to be signed'
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.second_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.second_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email], attachments=attachments
        )
        email.send()
    if contract.student_auth_signe:
        mail_subject = 'Contract to be signed'
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.student_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.student_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email], attachments=attachments
        )
        email.send()
    mail_subject = 'Contract to be signed'
    message = render_to_string('contract/sendcontract.html', {
        'user': contract.second_auth_signe,
        'contract': contract,
        'school': school
    })
    to_email = contract.counter_signe.profile.email
    email = EmailMessage(
        mail_subject, message, to=[to_email], attachments=attachments
    )
    email.send()
    contract.email_sent = True
    if typeof == 'json':
        contract.save(update_fields=['email_sent'])
    elif typeof == 'normal':
        contract.save()

@app.task #1
def schedule_email_without_attachment(contract, typeof=None):
    if typeof == 'json':
        first_parent_id = list(contract['first_auth_signe'].values())[0]
        contract['first_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
        second_parent_id = list(contract['second_auth_signe'].values())[0]
        contract['second_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
        counter_signe_id = list(list(contract['counter_signe'].values())[0].values())[0]
        contract['counter_signe'] = Head.objects.get(profile=User.objects.get(id=counter_signe_id))
        chain_id = list(contract['chain'].values())[0]
        contract['chain'] = Chain.objects.get(id=chain_id)
        contract = Contract(**contract)
        contract.pdf.name = contract.pdf.name.split('/')[1]
        contract.pdf.name = os.path.join(os.path.dirname(settings.BASE_DIR),'media_cdn', contract.pdf.name)
    school = School.objects.get(chains__id__exact = contract.chain.id)
    if contract.first_auth_signe:
        mail_subject = 'Contract to be signed'
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.first_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.first_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        email.send()
    if contract.second_auth_signe:
        mail_subject = 'Contract to be signed'
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.second_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.second_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        email.send()
    if contract.student_auth_signe:
        mail_subject = 'Contract to be signed'
        message = render_to_string('contract/sendcontract.html', {
            'user': contract.student_auth_signe,
            'contract': contract,
            'school': school
        })
        to_email = contract.student_auth_signe.profile.email
        email = EmailMessage(
            mail_subject, message, to=[to_email]
        )
        email.send()
    mail_subject = 'Contract to be signed'
    message = render_to_string('contract/sendcontract.html', {
        'user': contract.first_auth_signe,
        'contract': contract,
        'school': school
    })
    to_email = contract.counter_signe.profile.email
    email = EmailMessage(
        mail_subject, message, to=[to_email]
    )
    email.send()
    contract.email_sent = True
    if typeof == 'json':
        contract.save(update_fields=['email_sent'])
    elif typeof == 'normal':
        contract.save()