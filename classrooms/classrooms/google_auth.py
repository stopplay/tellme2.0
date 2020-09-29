from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import Flow
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials

class google_auth:
    def __init__(self, request, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME):
        self.request = request
        self.user = user
        self.SCOPES = SCOPES
        self.CLIENT_SECRET_FILE = CLIENT_SECRET_FILE
        self.APPLICATION_NAME = APPLICATION_NAME

    def get_authorization_url(self):
        flow = Flow.from_client_secrets_file(
            self.CLIENT_SECRET_FILE, self.SCOPES)
        flow.redirect_uri = 'https://tellme.stopplay.io/contracts/authenticated/'
        authorization_url, state = flow.authorization_url(
            # Enable offline access so that you can refresh an access token without
            # re-prompting the user for permission. Recommended for web server apps.
            access_type='offline',
            # Enable incremental authorization. Recommended as a best practice.
            include_granted_scopes='true')
        self.request.session['state'] = state
        return authorization_url
    
    def get_credentials(self):
        # The file token.pickle stores the user's access and refresh tokens, and is
        # created automatically when the authorization flow completes for the first
        # time.
        print (self.request.session['credentials'])
        credentials = Credentials(
      **self.request.session['credentials'])
        service = build('drive', 'v3', credentials=credentials)
        return service