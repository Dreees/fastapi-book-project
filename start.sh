#!/bin/sh
set -e  


apt-get update && apt-get install -y gettext-base

envsubst '\$PORT' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp
mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf

nginx -g "daemon off;" &

uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}


wait -n
