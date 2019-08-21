FROM python:3.6-stretch
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

RUN apt-get -y install gcc g++

ADD get-pip.py get-pip.py
RUN python3 get-pip.py
RUN mkdir /usr/src/app/classrooms
ADD classrooms/requirements.txt /usr/src/app/classrooms
RUN pip3 install Cython
RUN pip3 install -r classrooms/requirements.txt
ADD ./classrooms /usr/src/app/classrooms
COPY util.py /usr/local/lib/python3.6/site-packages/wq/io/util.py
COPY run_migrations.sh /usr/src/app/run_migrations.sh
#RUN python3 classrooms/manage.py makemigrations
#RUN python3 classrooms/manage.py migrate