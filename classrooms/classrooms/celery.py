import os

from celery import Celery
from . import settings
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'classrooms.settings') #1

app = Celery('classrooms') #2
app.config_from_object('classrooms.settings') #3
app.autodiscover_tasks() #4


# app.conf.beat_schedule = {
#     'get_all_leagues_and_seasons': {
#         'task': 'fixtures.tasks.getleaguesandseasons',
#         'schedule': crontab(minute=0,hour=0),  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'get_all_fixtures': {
#         'task': 'fixtures.tasks.getfixtures',
#         'schedule': crontab(minute=0,hour=0),  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'get_all_prematchbets': {
#         'task': 'fixtures.tasks.getprematchoddsdaily',
#         'schedule': crontab(minute=0,hour=9),  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'suspend_bets_daily': {
#         'task': 'fixtures.tasks.suspendbetsdaily',
#         'schedule': crontab(minute=0,hour=0),  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'get_inplay_odds': {
#         'task': 'fixtures.tasks.getinplayodds',
#         'schedule': 2.0,  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'clean_unecessary_data': {
#         'task': 'fixtures.tasks.cleanallunecessarydata',
#         'schedule': crontab(minute=0,hour=2),  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'suspend_bets_each_min': {
#         'task': 'fixtures.tasks.suspendbets',
#         'schedule': 60.0,  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
#     'get_and_update_win':{
#         'task': 'fixtures.tasks.getandupdatewin',
#         'schedule': 60.0,  # change to `crontab(minute=0, hour=0)` if you want it to run daily at midnight
#     },
# }