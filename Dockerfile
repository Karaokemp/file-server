FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN apt-get install -y megatools

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . /usr/src/app/
ENV FLASK_APP=server.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT ["python3", "-m","flask","run","--host=0.0.0.0"]  
EXPOSE 5000

