FROM python:3.6-stretch
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

RUN apt-get -y install gcc g++

ADD get-pip.py get-pip.py
RUN python3 get-pip.py
RUN mkdir classrooms
ADD classrooms/requirements.txt /usr/src/app/classrooms
RUN pip3 install Cython
RUN pip3 install -r classrooms/requirements.txt
ADD ./classrooms /usr/src/app
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate