# syntax=docker/dockerfile:1

FROM python:3.6-buster

ENV APP_PATH /app

COPY ./requirements.txt requirements.txt

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y git make gcc g++
RUN apt-get install -y gfortran
RUN apt-get clean

RUN pip3 install numpy==1.11.3
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade notebook

# Port
EXPOSE 9999

CMD ["jupyter","notebook", "--port", "9999", "--ip", "0.0.0.0", "--allow-root"]