FROM python:3.12-slim

RUN apt-get update && apt-get install -y nginx

WORKDIR /app


COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY . .

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80


CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000


