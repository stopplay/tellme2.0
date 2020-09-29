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

def credentials_to_dict(credentials):
  return {'token': credentials.token,
          'refresh_token': credentials.refresh_token,
          'token_uri': credentials.token_uri,
          'client_id': credentials.client_id,
          'client_secret': credentials.client_secret,
          'scopes': credentials.scopes}

def get_or_generate_credentials(request, user, data = None):
    if not data:
        authInst = google_auth.google_auth(request, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
        authorization_url = authInst.get_authorization_url()
        return authorization_url
    else:
        flow = Flow.from_client_secrets_file(
            CLIENT_SECRET_FILE, scopes=SCOPES, state=request.session['state'])
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
        request.session['credentials'] = credentials_to_dict(creds)
        return None

def get_or_create_drive_folder(request, user):
    authInst = google_auth.google_auth(request, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
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

def upload_drive_file(request, user, filename, filepath, mimetype):
    folder_id = get_or_create_drive_folder(request, user)
    authInst = google_auth.google_auth(request, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
    drive_service = authInst.get_credentials()
    
    file_metadata = {'name': filename,
                     'parents': [folder_id]
                    }
    media = MediaFileUpload(filepath, mimetype=mimetype)
    file = drive_service.files().create(body=file_metadata,
                                            media_body=media,
                                            fields='id').execute()
    print ('File ID: %s' % file.get('id'))