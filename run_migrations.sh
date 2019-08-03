./classrooms/redis-server&
cd classrooms/; celery worker --app=classrooms --loglevel=critical -B&
cd -
python3 classrooms/manage.py makemigrations
python3 classrooms/manage.py migrate
python3 classrooms/manage.py runserver --insecure 0.0.0.0:8000