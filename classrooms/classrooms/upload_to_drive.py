from __future__ import print_function
import httplib2
import os

from apiclient import discovery
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import Flow
from google.auth.transport.requests import Request
from apiclient.http import MediaFileUpload
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
from classrooms import google_auth
import re

# If modifying these scopes, delete your previously saved credentials
# at ~/.credentials/drive-python-quickstart.json
SCOPES = 'https://www.googleapis.com/auth/drive'
CLIENT_SECRET_FILE = os.path.abspath('classrooms/TellMe-Drive.json')
APPLICATION_NAME = 'Drive API Python Quickstart'

def get_or_generate_credentials(user, data = None):
    if not data:
        authInst = google_auth.google_auth(user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
        authorization_url = authInst.get_authorization_url()
        return authorization_url
    else:
        flow = Flow.from_client_secrets_file(
            CLIENT_SECRET_FILE, scopes=SCOPES)
        flow.redirect_uri = 'https://tellme.stopplay.io/contracts/authenticated/'

        # Use the authorization server's response to fetch the OAuth 2.0 tokens.
        print(data)
        data = re.sub('http://', 'https://', data)
        print(data)
        authorization_response = data
        flow.fetch_token(authorization_response=authorization_response)

        # Store credentials in the session.
        # ACTION ITEM: In a production app, you likely want to save these
        #              credentials in a persistent database instead.
        creds = flow.credentials
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
        with open(credential_path, 'wb') as token:
            print('Credentials stored in the json')
            pickle.dump(creds, token)
        return None

def get_or_create_drive_folder(user):
    authInst = google_auth.google_auth(user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
    drive_service = authInst.get_credentials()

    response = drive_service.files().list(q="mimeType = 'application/vnd.google-apps.folder'",
                                            spaces='drive',
                                            fields='nextPageToken, files(id, name)').execute()
    for file in response.get('files', []):
        # Process change
        if file.get('name') == 'TellMe-Contracts':
            return file.get('id')
    file_metadata = {
        'name': 'TellMe-Contracts',
        'mimeType': 'application/vnd.google-apps.folder'
    }
    file = drive_service.files().create(body=file_metadata,
                                        fields='id').execute()
    print ('Folder ID: %s' % file.get('id'))
    return file.get('id')

def upload_drive_file(user, filename, filepath, mimetype):
    folder_id = get_or_create_drive_folder(user)
    authInst = google_auth.google_auth(user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
    drive_service = authInst.get_credentials()
    
    file_metadata = {'name': filename,
                     'parents': [folder_id]
                    }
    media = MediaFileUpload(filepath, mimetype=mimetype)
    file = drive_service.files().create(body=file_metadata,
                                            media_body=media,
                                            fields='id').execute()
    print ('File ID: %s' % file.get('id'))