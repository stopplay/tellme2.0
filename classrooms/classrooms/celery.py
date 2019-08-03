import os

from celery import Celery
from . import settings
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'classrooms.settings') #1

app = Celery('classrooms') #2
app.config_from_object('classrooms.settings') #3
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS) #4

app.conf.beat_schedule = {
    'update_material_orders_from_maple_bear': {
        'task': 'contract.tasks.update_material_orders_from_maple_bear',
        'schedule': crontab(minute=0,hour="*/2") # Executes every 2 hours
    }
}