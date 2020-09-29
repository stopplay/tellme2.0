from __future__ import print_function
import httplib2
import os

from apiclient import discovery
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage
from apiclient.http import MediaFileUpload
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
from classrooms import google_auth

# If modifying these scopes, delete your previously saved credentials
# at ~/.credentials/drive-python-quickstart.json
SCOPES = 'https://www.googleapis.com/auth/drive'
CLIENT_SECRET_FILE = os.path.abspath('classrooms/TellMe-Drive.json')
APPLICATION_NAME = 'Drive API Python Quickstart'

def get_or_create_drive_folder(user):
    authInst = google_auth.google_auth(user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME)
    drive_service = authInst.get_credentials()
    if not isinstance(drive_service, google.oauth2.credentials.Credentials):
        return drive_service

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