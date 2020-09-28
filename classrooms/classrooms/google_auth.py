from __future__ import print_function
import httplib2
import os

from apiclient import discovery
from oauth2client import client
from oauth2client import tools
from oauth2client.file import Storage
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

try:
    import argparse
    flags = tools.argparser.parse_args([])
    flags.auth_host_name = 'https://tellme.stopplay.io/'
    flags.auth_host_port = [443]
except ImportError:
    flags = None

class google_auth:
    def __init__(self, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME):
        self.user = user
        self.SCOPES = SCOPES
        self.CLIENT_SECRET_FILE = CLIENT_SECRET_FILE
        self.APPLICATION_NAME = APPLICATION_NAME
    
    def get_credentials(self):
        """Gets valid user credentials from storage.
        If nothing has been stored, or if the stored credentials are invalid,
        the OAuth2 flow is completed to obtain the new credentials.
        Returns:
            Credentials, the obtained credential.
        """
        cwd_dir = os.getcwd()
        credential_dir = os.path.join(cwd_dir, '.credentials')
        if not os.path.exists(credential_dir):
            os.makedirs(credential_dir)
        credential_path = os.path.join(credential_dir,
                                    self.user.username + '.json')
        try:
            f = open(credential_path, 'r')
        except:
            f = open(credential_path, 'a+')
        f.close()

        store = Storage(credential_path)
        credentials = store.get()
        if not credentials or credentials.invalid:
            flow = client.flow_from_clientsecrets(self.CLIENT_SECRET_FILE, self.SCOPES)
            flow.user_agent = self.APPLICATION_NAME
            if flags:
                credentials = tools.run_flow(flow, store, flags)
            else: # Needed only for compatibility with Python 2.6
                credentials = tools.run_flow(flow, store)
            print('Storing credentials to ' + credential_path)
        return credentials