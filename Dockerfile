FROM python:3
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . /usr/src/app/
ENV FLASK_APP=server.py
ENTRYPOINT ["python3", "-m","flask","run"]  

EXPOSE 5000
