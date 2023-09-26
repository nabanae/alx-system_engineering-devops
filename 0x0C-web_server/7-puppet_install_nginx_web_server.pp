#!/usr/bin/env bash
# configure an nginx server to have a custom 404 page that contains the string 'Ceci n'est pas une page'

apt-get -y update
apt-get -y install nginx
ufw allow 'Nginx HTTP'
echo 'Hello World!' > /var/www/html/index.nginx-debian.html
sed -i '/listen 80 default_server;/a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default
echo "Ceci n'est pas une page" > /usr/share/nginx/html/custom_404.html
sed -i '/server_name _;/a error_page 404 /custom_404.html;\nlocation = /custom_404.html {\nroot /usr/share/nginx/html;\ninternal;\n}' /etc/nginx/sites-available/default
service nginx start
