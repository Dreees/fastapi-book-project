FROM python:3.12-slim


RUN apt-get update && apt-get install -y nginx gettext-base


WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .


COPY nginx.conf /etc/nginx/nginx.conf


COPY start.sh /start.sh
RUN chmod +x /start.sh


CMD ["/start.sh"]
