from __future__ import absolute_import
from django.contrib.auth.models import User
from rest_framework import serializers
from celery import shared_task
from classrooms.celery import app
from django.core.mail import EmailMessage
from .models import *
from .serializers import ContractSerializer
import json
from school_users.models import *
from block.models import *
from classrooms import settings
import os
from django.template.loader import render_to_string
from school.models import *
from contract.models import *
from school.utils import get_sku_by_slm_url
from contract.utils import MagentoSoap, generate_slm_link
from django.db.models import Q
from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
import pdb
from django.core.files.base import ContentFile, File

wsdl = 'http://maplebearmkt2.widehomolog.biz/api/v2_soap?wsdl=1'
username = 'tell-me'
apiKey = 'tell-me@0619'

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
    
    try:
        not_purchased_slm_contracts = Contract.objects.filter(purchased_slm=False)
        
        soap = MagentoSoap(wsdl, username, apiKey)
    
        soap.start_batch_operations()
    
        print('Contracts to process:', len(not_purchased_slm_contracts))
        counter = 0
        for contract_not_purchased_slm in not_purchased_slm_contracts:
            counter += 1
            if contract_not_purchased_slm.chain != None:
                
                contract_student_id = contract_not_purchased_slm.student_id
                contract_chain_id = contract_not_purchased_slm.chain.id
                try:
                    class_linked_to_contract = Class.objects.get(students__student_id__exact=contract_student_id)
                except Exception as e:
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
    except Exception as e:
        print(e)
        pass


@app.task #1
def schedule_email(contract, typeof=None, whosend=None, domain=None):
    try:
        if typeof == 'json':
            if contract['first_auth_signe']:
                first_parent_id = list(contract['first_auth_signe'].values())[0]
                contract['first_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
            if contract['second_auth_signe']:
                second_parent_id = list(contract['second_auth_signe'].values())[0]
                contract['second_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
            if contract['student_auth_signe']:
                student_id = list(contract['student_auth_signe'].values())[0]
                contract['student_auth_signe'] = Student.objects.get(student_id=student_id)
            if contract['first_witness_signe']:
                first_witness_id = list(contract['first_witness_signe'].values())[0]
                contract['first_witness_signe'] = Witness.objects.get(witness_id=first_witness_id)
            if contract['second_witness_signe']:
                second_witness_id = list(contract['second_witness_signe'].values())[0]
                contract['second_witness_signe'] = Witness.objects.get(witness_id=second_witness_id)
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
        school = School.objects.get(chains__id__exact = contract.chain.id)
        try:
            classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]), class_unit=contract.chain.name.split('-')[-3], enrollment_class_year=contract.chain.name.split('-')[-4])
        except Exception as e:
            try:
                classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]))
            except Exception as e:
                try:
                    classe = school.classes.get(class_name=contract.chain.name.split('-')[-1])
                except Exception as e:
                    try:
                        classe = school.classes.get(class_name__icontains=contract.chain.name.split('-')[-1])
                    except Exception as e:
                        classe = school.classes.get(students__student_id__exact=contract.student_id)
        if contract.first_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.first_auth_signe,
                'contract': contract,
                'school': school,
                'class': classe,
                'domain':domain,
            })
            to_email = contract.first_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email], attachments=attachments
            )
            email.send()
        if contract.second_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.second_auth_signe,
                'contract': contract,
                'school': school,
                'class': classe,
                'domain':domain,
            })
            to_email = contract.second_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email], attachments=attachments
            )
            email.send()
        if contract.student_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.student_auth_signe,
                'contract': contract,
                'school': school,
                'class': classe,
                'domain':domain,
            })
            to_email = contract.student_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email], attachments=attachments
            )
            email.send()
        if contract.first_witness_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.first_witness_signe,
                'contract': contract,
                'school': school,
                'class': classe,
                'domain':domain,
            })
            to_email = contract.first_witness_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email], attachments=attachments
            )
            email.send()
        if contract.second_witness_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.second_witness_signe,
                'contract': contract,
                'school': school,
                'class': classe,
                'domain':domain,
            })
            to_email = contract.second_witness_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email], attachments=attachments
            )
            email.send()
        if whosend == 'admin':
            if contract.counter_signe:
                mail_subject = 'Contrato a ser assinado'
                message = render_to_string('contract/sendcontract.html', {
                    'user': contract.counter_signe,
                    'contract': contract,
                    'school': school,
                    'class': classe,
                    'domain':domain,
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
    except Exception as e:
        print(str(e))

@app.task #1
def schedule_email_without_attachment(contract, typeof=None, whosend=None, domain=None):
    try:
        if typeof == 'json':
            if contract['first_auth_signe']:
                first_parent_id = list(contract['first_auth_signe'].values())[0]
                contract['first_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
            if contract['second_auth_signe']:
                second_parent_id = list(contract['second_auth_signe'].values())[0]
                contract['second_auth_signe'] = Parent.objects.get(parent_id=first_parent_id)
            if contract['student_auth_signe']:
                student_id = list(contract['student_auth_signe'].values())[0]
                contract['student_auth_signe'] = Student.objects.get(student_id=student_id)
            if contract['first_witness_signe']:
                first_witness_id = list(contract['first_witness_signe'].values())[0]
                contract['first_witness_signe'] = Witness.objects.get(witness_id=first_witness_id)
            if contract['second_witness_signe']:
                second_witness_id = list(contract['second_witness_signe'].values())[0]
                contract['second_witness_signe'] = Witness.objects.get(witness_id=second_witness_id)
            counter_signe_id = list(list(contract['counter_signe'].values())[0].values())[0]
            contract['counter_signe'] = Head.objects.get(profile=User.objects.get(id=counter_signe_id))
            chain_id = list(contract['chain'].values())[0]
            contract['chain'] = Chain.objects.get(id=chain_id)
            contract = Contract(**contract)
            contract.pdf.name = contract.pdf.name.split('/')[1]
            contract.pdf.name = os.path.join(os.path.dirname(settings.BASE_DIR),'media_cdn', contract.pdf.name)
        school = School.objects.get(chains__id__exact = contract.chain.id)
        try:
            classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]), class_unit=contract.chain.name.split('-')[-3], enrollment_class_year=contract.chain.name.split('-')[-4])
        except Exception as e:
            try:
                classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]))
            except Exception as e:
                try:
                    classe = school.classes.get(class_name=contract.chain.name.split('-')[-1])
                except Exception as e:
                    try:
                        classe = school.classes.get(class_name__icontains=contract.chain.name.split('-')[-1])
                    except Exception as e:
                        classe = school.classes.get(students__student_id__exact=contract.student_id)
        if contract.first_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.first_auth_signe,
                'contract': contract,
                'school': school,
                'class':classe,
                'domain':domain,
            })
            to_email = contract.first_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
        if contract.second_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.second_auth_signe,
                'contract': contract,
                'school': school,
                'class':classe,
                'domain':domain,
            })
            to_email = contract.second_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
        if contract.student_auth_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.student_auth_signe,
                'contract': contract,
                'school': school,
                'class':classe,
                'domain':domain,
            })
            to_email = contract.student_auth_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
        if contract.first_witness_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.first_witness_signe,
                'contract': contract,
                'school': school,
                'class':classe,
                'domain':domain,
            })
            to_email = contract.first_witness_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
        if contract.second_witness_signe:
            mail_subject = 'Contrato a ser assinado'
            message = render_to_string('contract/sendcontract.html', {
                'user': contract.second_witness_signe,
                'contract': contract,
                'school': school,
                'class':classe,
                'domain':domain,
            })
            to_email = contract.second_witness_signe.profile.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
        if whosend == 'admin':
            if contract.counter_signe:
                mail_subject = 'Contrato a ser assinado'
                message = render_to_string('contract/sendcontract.html', {
                    'user': contract.counter_signe,
                    'contract': contract,
                    'school': school,
                    'class':classe,
                    'domain':domain,
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
    except Exception as e:
        print(str(e))

def send_data(data_serialized):
    room_group_name = 'notifications'
    layer = get_channel_layer()
    try:
        async_to_sync(layer.group_send)(
            room_group_name,
            {
                'type': 'chat_message',
                'message': data_serialized.data
            }
        )
    except Exception as e:
        async_to_sync(layer.group_send)(
            room_group_name,
            {
                'type': 'chat_message',
                'message': {'contract_id':data_serialized, 'status':'deleted'}
            }
        )

@app.task #1
def create_contract(contract, chain_id, wish, wish_today, student_id, head_id, sent_date, sent_time, domain, who_sent, pdf_url):
    chain = Chain.objects.get(id=chain_id)
    pdf_file = open(pdf_url, "rb")
    contract = Contract(**contract, chain=chain)
    try:
        student = Student.objects.get(student_id=student_id)
    except:
        return 'Estudante não enviado'
    head = None
    if Head.objects.filter(head_id = head_id).count()>=1:
        head = Head.objects.get(head_id = head_id)
    else:
        return 'Você não selecionou nenhum diretor'
    if contract.pdf.size > 2097152:
        return 'Por favor mantenha o tamanho do arquivo de contrato enviado abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.pdf.size))
    if contract.terms_of_contract:
        if contract.terms_of_contract.size > 2097152:
            return 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (1) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract.size))
        if not contract.terms_of_contract.name.endswith('.pdf'):
            return 'Por favor insira o arquivo de termos aditivos de contrato (1) no tipo correto que é PDF'
        if 'í' in contract.terms_of_contract.name or 'Í' in contract.terms_of_contract.name or 'ì' in contract.terms_of_contract.name or 'Ì' in contract.terms_of_contract.name or 'î' in contract.terms_of_contract.name or 'Î' in contract.terms_of_contract.name or 'ú' in contract.terms_of_contract.name or 'Ú' in contract.terms_of_contract.name or 'ù' in contract.terms_of_contract.name or 'Ù' in contract.terms_of_contract.name or 'û' in contract.terms_of_contract.name or 'Û' in contract.terms_of_contract.name or 'ó' in contract.terms_of_contract.name or 'Ó' in contract.terms_of_contract.name or 'ò' in contract.terms_of_contract.name or 'Ò' in contract.terms_of_contract.name or 'ô' in contract.terms_of_contract.name or 'Ô' in contract.terms_of_contract.name or 'õ' in contract.terms_of_contract.name or 'Õ' in contract.terms_of_contract.name or 'é' in contract.terms_of_contract.name or 'É' in contract.terms_of_contract.name or 'è' in contract.terms_of_contract.name or 'È' in contract.terms_of_contract.name or 'ê' in contract.terms_of_contract.name or 'Ê' in contract.terms_of_contract.name or 'á' in contract.terms_of_contract.name or 'Á' in contract.terms_of_contract.name or 'à' in contract.terms_of_contract.name or 'À' in contract.terms_of_contract.name or 'ã' in contract.terms_of_contract.name or 'Ã' in contract.terms_of_contract.name or 'â' in contract.terms_of_contract.name or 'Â' in contract.terms_of_contract.name or 'ç' in contract.terms_of_contract.name or 'Ç' in contract.terms_of_contract.name:
            return 'O arquivo de termos aditivos de contrato (1) foi enviado com algum dos seguintes caracteres no nome em maiúsculo ou minúsculo: ã, á, à, â, é, è, ê, í, ì, î, õ, ó, ò, ô, ú, ù, û, ç. Remova esses caracteres e envie novamente o arquivo.'
    if contract.terms_of_contract_2:
        if contract.terms_of_contract_2.size > 2097152:
            return 'Por favor mantenha o tamanho do arquivo de termos aditivos de contrato (2) abaixo de {}. Tamanho atual {}.'.format(filesizeformat(2097152), filesizeformat(contract.terms_of_contract_2.size))
        if not contract.terms_of_contract_2.name.endswith('.pdf'):
            return 'Por favor insira o arquivo de termos aditivos de contrato (2) no tipo correto que é PDF'
        if 'í' in contract.terms_of_contract_2.name or 'Í' in contract.terms_of_contract_2.name or 'ì' in contract.terms_of_contract_2.name or 'Ì' in contract.terms_of_contract_2.name or 'î' in contract.terms_of_contract_2.name or 'Î' in contract.terms_of_contract_2.name or 'ú' in contract.terms_of_contract_2.name or 'Ú' in contract.terms_of_contract_2.name or 'ù' in contract.terms_of_contract_2.name or 'Ù' in contract.terms_of_contract_2.name or 'û' in contract.terms_of_contract_2.name or 'Û' in contract.terms_of_contract_2.name or 'ó' in contract.terms_of_contract_2.name or 'Ó' in contract.terms_of_contract_2.name or 'ò' in contract.terms_of_contract_2.name or 'Ò' in contract.terms_of_contract_2.name or 'ô' in contract.terms_of_contract_2.name or 'Ô' in contract.terms_of_contract_2.name or 'õ' in contract.terms_of_contract_2.name or 'Õ' in contract.terms_of_contract_2.name or 'é' in contract.terms_of_contract_2.name or 'É' in contract.terms_of_contract_2.name or 'è' in contract.terms_of_contract_2.name or 'È' in contract.terms_of_contract_2.name or 'ê' in contract.terms_of_contract_2.name or 'Ê' in contract.terms_of_contract_2.name or 'á' in contract.terms_of_contract_2.name or 'Á' in contract.terms_of_contract_2.name or 'à' in contract.terms_of_contract_2.name or 'À' in contract.terms_of_contract_2.name or 'ã' in contract.terms_of_contract_2.name or 'Ã' in contract.terms_of_contract_2.name or 'â' in contract.terms_of_contract_2.name or 'Â' in contract.terms_of_contract_2.name or 'ç' in contract.terms_of_contract_2.name or 'Ç' in contract.terms_of_contract_2.name:
            return 'O arquivo de termos aditivos de contrato (2) foi enviado com algum dos seguintes caracteres no nome em maiúsculo ou minúsculo: ã, á, à, â, é, è, ê, í, ì, î, õ, ó, ò, ô, ú, ù, û, ç. Remova esses caracteres e envie novamente o arquivo.'
        if not contract.pdf.name.endswith('.pdf'):
            return 'Por favor insira o arquivo de contrato no tipo correto que é PDF'
        if 'í' in contract.pdf.name or 'Í' in contract.pdf.name or 'ì' in contract.pdf.name or 'Ì' in contract.pdf.name or 'î' in contract.pdf.name or 'Î' in contract.pdf.name or 'ú' in contract.pdf.name or 'Ú' in contract.pdf.name or 'ù' in contract.pdf.name or 'Ù' in contract.pdf.name or 'û' in contract.pdf.name or 'Û' in contract.pdf.name or 'ó' in contract.pdf.name or 'Ó' in contract.pdf.name or 'ò' in contract.pdf.name or 'Ò' in contract.pdf.name or 'ô' in contract.pdf.name or 'Ô' in contract.pdf.name or 'õ' in contract.pdf.name or 'Õ' in contract.pdf.name or 'é' in contract.pdf.name or 'É' in contract.pdf.name or 'è' in contract.pdf.name or 'È' in contract.pdf.name or 'ê' in contract.pdf.name or 'Ê' in contract.pdf.name or 'á' in contract.pdf.name or 'Á' in contract.pdf.name or 'à' in contract.pdf.name or 'À' in contract.pdf.name or 'ã' in contract.pdf.name or 'Ã' in contract.pdf.name or 'â' in contract.pdf.name or 'Â' in contract.pdf.name or 'ç' in contract.pdf.name or 'Ç' in contract.pdf.name:
            return 'O arquivo de contrato foi enviado com algum dos seguintes caracteres no nome em maiúsculo ou minúsculo: ã, á, à, â, é, è, ê, í, ì, î, õ, ó, ò, ô, ú, ù, û, ç. Remova esses caracteres e envie novamente o arquivo.'
    school = School.objects.get(chains__id__exact=contract.chain.id)
    try:
        classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]), class_unit=contract.chain.name.split('-')[-3], enrollment_class_year=contract.chain.name.split('-')[-4])
    except Exception as e:
        try:
            classe = school.classes.get(Q(class_name__icontains=contract.chain.name.split('-')[-1]) & Q(class_name__icontains=contract.chain.name.split('-')[-2]))
        except Exception as e:
            try:
                classe = school.classes.get(class_name=contract.chain.name.split('-')[-1])
            except Exception as e:
                try:
                    classe = school.classes.get(class_name__icontains=contract.chain.name.split('-')[-1])
                except Exception as e:
                    classe = school.classes.get(students__student_id__exact=student.student_id)
    try:
        contract.slm = generate_slm_link(school, student)['url']
    except Exception as e:
        contract.slm = classe.slm
    contract.name = student.name+' - '+contract.chain.name
    contract.counter_signe = head
    if school.first_witness and school.second_witness:
        contract.first_witness_signe = school.first_witness
        contract.second_witness_signe = school.second_witness
    if student.needs_parent:
        if student.first_parent and student.second_parent:
            contract.first_auth_signe = student.first_parent
            contract.second_auth_signe = student.second_parent
            if student.third_parent:
                contract.third_auth_signe = student.third_parent
            contract.student_name = student.name
            contract.student_id = student.student_id
            if wish == 'sim':
                if wish_today == 'sim':
                    contract.save()
                    contract_rest = ContractSerializer(contract)
                    send_data(contract_rest)
                    # schedule_email(contract, 'normal', who_sent, domain)
                elif wish_today == 'não':
                    if sent_date and sent_time:
                        contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                        contract.save()
                        contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                        contract_rest = ContractSerializer(contract)
                        send_data(contract_rest)
                        # schedule_email.apply_async((contract_rest.data, 'json', 'who_sent, domain), eta=contract.sent_date)
                    else:
                        return 'Você não informou a data em que o contrato será enviado!'
            else:
                if wish_today == 'sim':
                    contract.save()
                    contract_rest = ContractSerializer(contract)
                    send_data(contract_rest)
                    # schedule_email_without_attachment(contract,'normal', who_sent, domain)
                elif wish_today == 'não':
                    if sent_date and sent_time:
                        contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                        contract.save()
                        contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                        contract_rest = ContractSerializer(contract)
                        send_data(contract_rest)
                        # schedule_email.apply_async((contract_rest.data, 'json', who_sent, domain), eta=contract.sent_date)
                    else:
                        return 'Você não informou a data em que o contrato será enviado!'
            return 'Contrato criado com sucesso!'
    else:
        contract.student_auth_signe = student
        contract.student_name = student.name
        contract.student_id = student.student_id
        if wish == 'sim':
            if wish_today == 'sim':
                contract.save()
                contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                contract_rest = ContractSerializer(contract)
                send_data(contract_rest)
                # schedule_email(contract, 'normal', 'admin', domain)
            elif wish_today == 'não':
                if sent_date and sent_time:
                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                    contract.save()
                    contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                    contract_rest = ContractSerializer(contract)
                    send_data(contract_rest)
                    # schedule_email.apply_async((contract_rest.data, 'json', who_sent, domain), eta=contract.sent_date)
                else:
                    return 'Você não informou a data em que o contrato será enviado!'
        else:
            if wish_today == 'sim':
                contract.save()
                contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                contract_rest = ContractSerializer(contract)
                send_data(contract_rest)
                # schedule_email_without_attachment(contract,'normal', who_sent, domain)
            elif wish_today == 'não':
                if sent_date and sent_time:
                    contract.sent_date = datetime.datetime(int(date.split('-')[0]), int(date.split('-')[1]), int(date.split('-')[2]), int(time.split(':')[0]), int(time.split(':')[1]), 00)
                    contract.save()
                    contract.pdf.save('{}-{}.pdf'.format(contract.name, contract.contract_id), File(pdf_file))
                    contract_rest = ContractSerializer(contract)
                    send_data(contract_rest)
                    # schedule_email.apply_async((contract_rest.data, 'json', who_sent, domain), eta=contract.sent_date)
                else:
                    return 'Você não informou a data em que o contrato será enviado!'
        return 'Contrato criado com sucesso!'