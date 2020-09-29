from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import Flow
from google.auth.transport.requests import Request

class google_auth:
    def __init__(self, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME):
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
        return authorization_url
    
    def get_credentials(self):
        creds = None
        # The file token.pickle stores the user's access and refresh tokens, and is
        # created automatically when the authorization flow completes for the first
        # time.
        print ('Start Getting Credentials')
        cwd_dir = os.getcwd()
        print ('CWD_dir get')
        credential_dir = os.path.join(cwd_dir, '.credentials')
        print ('Credentials dir Get')
        if not os.path.exists(credential_dir):
            print ('Credentials dir doesn\'t existss, create that')
            os.makedirs(credential_dir)
        print ('Credentials path Get based in the current user in the session')
        credential_path = os.path.join(credential_dir,
                                    self.user.username + '.json')
        if os.path.exists(credential_path) and os.path.getsize(credential_path) > 0:
            with open(credential_path, 'rb') as token:
                print ('Credentials path already exists and is fullfilled, so store credentials')
                creds = pickle.load(token)
        # If there are no (valid) credentials available, let the user log in.
        print ('Credentials doesn\'t exists or creds not valid, so create new credentials')
        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                print ('Credentials not valid, so Refresh it')
                creds.refresh(Request())
            else:
                print ('Credentials doesn\'t exists so do a new ')
                flow = Flow.from_client_secrets_file(
                self.CLIENT_SECRET_FILE, self.SCOPES)
                print('InstalledAppFlow instance created to run the flow')
                flow.redirect_uri = 'https://tellme.stopplay.io/contracts/authenticated/'
                authorization_url, state = flow.authorization_url(
                    # Enable offline access so that you can refresh an access token without
                    # re-prompting the user for permission. Recommended for web server apps.
                    access_type='offline',
                    # Enable incremental authorization. Recommended as a best practice.
                    include_granted_scopes='true')
                return authorization_url
                print('Flow run and credentials get')
            # Save the credentials for the next run
            with open(credential_path, 'wb') as token:
                print('Credentials stored in the json')
                pickle.dump(creds, token)
        print('Service based on Credentials created')
        service = build('drive', 'v3', credentials=creds)
        print('Service returned to execute the upload file process')
        return service