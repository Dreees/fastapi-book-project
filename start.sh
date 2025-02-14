#!/bin/sh
set -e  


envsubst < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp
mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf


nginx -g "daemon off;" &


uvicorn main:app --host 127.0.0.1 --port 8000
