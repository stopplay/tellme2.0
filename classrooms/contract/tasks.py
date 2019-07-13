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
    mail_subject = 'Contract to be signed'
    message = render_to_string('contract/sendcontract.html', {
        'user': contract.first_auth_signe,
        'contract': contract,
        'school': school
    })
    to_email = contract.second_auth_signe.profile.email
    email = EmailMessage(
        mail_subject, message, to=[to_email], attachments=attachments
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
    mail_subject = 'Contract to be signed'
    message = render_to_string('contract/sendcontract.html', {
        'user': contract.first_auth_signe,
        'contract': contract,
        'school': school
    })
    to_email = contract.second_auth_signe.profile.email
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