"""
Django settings for classrooms project.

Generated by 'django-admin startproject' using Django 2.1.7.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os
import datetime
from corsheaders.defaults import *

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'z8^yw$9(6#o@o#p@qy%=nb^qxg0ebribt7ngud#+x0n^d-#md7'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['52.212.87.244', '127.0.0.1', '34.245.178.93', '18.228.172.18', '52.3.226.200', 'www.tellme.school', 'matricula.tellme.school', 'tellme.school']


# Application definition

INSTALLED_APPS = [
    'channels',
    'jet.dashboard',
    'jet',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'block',
    'school',
    'contract.apps.ContractConfig',
    'school_users',
    'corsheaders',
    'data_wizard',
    'data_wizard.sources',
    'django_filters',
]

DATA_WIZARD = {
    'BACKEND': 'data_wizard.backends.threading',
    'LOADER': 'data_wizard.loaders.FileLoader',
    'PERMISSION': 'rest_framework.permissions.IsAdminUser',
}

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'classrooms.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['%s/school/templates/' % (BASE_DIR), '%s/school_users/templates/' % (BASE_DIR), '%s/contract/templates/' % (BASE_DIR), '%s/classrooms/templates/' % (BASE_DIR)],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'classrooms.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'dbmaster',
        'USER': 'dbmasteruser',
        'PASSWORD': '`DsO=)P!+9e[&i`=a?W9(&36`|tKJ8k?',
        'HOST': 'ls-dd6fedb602e2f839b3beb6c05c7a0f619ae20106.cztxoubiiizv.us-east-1.rds.amazonaws.com',
        'PORT': '5432',
    }

    # local config:
    # 'default': {
    #     'ENGINE': 'django.db.backends.postgresql',
    #     'NAME': 'tellme_test',
    #     'USER': 'postgres',
    #     'PASSWORD' : 'postgres',
    #     'HOST': 'localhost',
    #     'PORT': '5433',
    # }
}


# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/Fortaleza'

USE_I18N = True

USE_L10N = True

USE_TZ = False

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'matricula@agendatellme.com.br'
EMAIL_HOST_PASSWORD = 'atwork708'
EMAIL_PORT = 587


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = 'static'
STATICFILES_DIRS = [('js',os.path.join(BASE_DIR, 'static', 'js')), ('css',os.path.join(BASE_DIR, 'static', 'css')), ('fonts',os.path.join(BASE_DIR, 'static', 'fonts')), ('sass',os.path.join(BASE_DIR, 'static', 'sass')), ('img',os.path.join(BASE_DIR, 'static', 'img')), ('webfonts',os.path.join(BASE_DIR, 'static', 'webfonts')), ('datatables',os.path.join(BASE_DIR, 'static', 'datatables'))]
STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(os.path.dirname(BASE_DIR),'media_cdn')

REST_FRAMEWORK = {
    # Use Django's standard `django.contrib.auth` permissions,
    # or allow read-only access for unauthenticated users.
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated'
    ],
    'DEFAULT_RENDERER_CLASSES': (
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
    ),
    'DEFAULT_FILTER_BACKENDS': ('django_filters.rest_framework.DjangoFilterBackend')
}
LOGIN_URL = '/users/login'

CELERY_ACCEPT_CONTENT = ['json']
CELERY_TASK_SERIALIZER = 'json'
CELERY_RESULT_SERIALIZER = 'json'

BROKER_URL='redis://'

JWT_AUTH = {
    'JWT_RESPONSE_PAYLOAD_HANDLER': 'school_users.views.my_jwt_response_handler',
    'JWT_EXPIRATION_DELTA': datetime.timedelta(minutes=900),
    'JWT_ALLOW_REFRESH': True,
    'JWT_REFRESH_EXPIRATION_DELTA': datetime.timedelta(days=30),
}

CORS_ORIGIN_ALLOW_ALL=True
CORS_ALLOW_CREDENTIALS=True

CORS_EXPOSE_HEADERS = ['Access-Control-Allow-Origin']
CORS_ALLOW_HEADERS = default_headers + ('access-control-allow-origin',)

MESSAGE_STORAGE = 'django.contrib.messages.storage.cookie.CookieStorage'

ASGI_APPLICATION = "classrooms.routing"

CHANNEL_LAYERS = {
    'default': {
        'BACKEND': 'channels_redis.core.RedisChannelLayer',
        'CONFIG': {
            "hosts": [('127.0.0.1', 6379)],
        },
    },
}