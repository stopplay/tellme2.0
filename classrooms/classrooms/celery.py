import os

from celery import Celery
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'classrooms.settings') #1

app = Celery('classrooms') #2
app.config_from_object('classrooms.celeryconfig') #3
app.autodiscover_tasks() #4

app.conf.beat_schedule = {
    'update_material_orders_from_maple_bear': {
        'task': 'contract.tasks.update_material_orders_from_maple_bear',
        'schedule': crontab(minute="*/30")
    },
    'set_expired_daily': {
        'task': 'contract.tasks.set_expired_daily',
        'schedule': crontab(hour=0, minute=0)
    },
    'set_active_daily': {
        'task': 'contract.tasks.set_active_daily',
        'schedule': crontab(hour=0, minute=0)
    },
    'import_all_sponte_users': {
        'task': 'school.tasks.import_all_sponte_users',
        'schedule': crontab(hour=0, minute=0)
    }
}