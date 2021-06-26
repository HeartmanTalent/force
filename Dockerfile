FROM python:3.7-slim

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev

# install dependencies
RUN apt-get update --fix-missing
RUN apt-get -y upgrade 
RUN apt-get -y install  procps
RUN apt-get -y install  python3-dev libffi-dev libpq-dev gcc && pip3 install --upgrade pip
RUN apt-get -y install  netcat

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
COPY ./ /app
WORKDIR /app