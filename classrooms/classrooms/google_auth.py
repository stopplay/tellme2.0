from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import webbrowser, _RedirectWSGIApp, _WSGIRequestHandler, Flow, InstalledAppFlow, wsgiref
from google.auth.transport.requests import Request

class google_auth:
    def __init__(self, user, SCOPES, CLIENT_SECRET_FILE, APPLICATION_NAME):
        self.user = user
        self.SCOPES = SCOPES
        self.CLIENT_SECRET_FILE = CLIENT_SECRET_FILE
        self.APPLICATION_NAME = APPLICATION_NAME
    
    def get_credentials(self, open_browser=True):
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
        if os.path.getsize(credential_path) > 0:
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
                wsgi_app = _RedirectWSGIApp(InstalledAppFlow._DEFAULT_WEB_SUCCESS_MESSAGE)
                local_server = wsgiref.simple_server.make_server(
                    'tellme.stopplay.io', 443, wsgi_app, handler_class=_WSGIRequestHandler)

                flow.redirect_uri = 'https://tellme.stopplay.io/'
                auth_url, _ = flow.authorization_url()

                if open_browser:
                    webbrowser.open(auth_url, new=1, autoraise=True)

                print(InstalledAppFlow._DEFAULT_AUTH_PROMPT_MESSAGE.format(url=auth_url))

                local_server.handle_request()

                # Note: using https here because oauthlib is very picky that
                # OAuth 2.0 should only occur over https.
                authorization_response = wsgi_app.last_request_uri.replace(
                    'http', 'https')
                flow.fetch_token(authorization_response=authorization_response)

                return flow.credentials
                print('Flow run and credentials get')
            # Save the credentials for the next run
            with open(credential_path, 'wb') as token:
                print('Credentials stored in the json')
                pickle.dump(creds, token)
        print('Service based on Credentials created')
        service = build('drive', 'v3', credentials=creds)
        print('Service returned to execute the upload file process')
        return service