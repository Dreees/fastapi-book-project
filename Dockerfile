FROM python:3.12-slim

RUN apt-get update && apt-get install -y nginx

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Replace the main Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Heroku assigns the PORT dynamically; no need to EXPOSE
CMD ["/start.sh"]