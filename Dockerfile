FROM python:3.7-alpine
MAINTAINER Keviv

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
copy ./app /app

# Create a user to run the app
RUN adduser -D user
USER user
