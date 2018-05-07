---
layout: post_with_category
title: Configure nginx with SSL
date:   2018-05-15 23:00:00 -0600
categories: code latest
permalink: /blog/:title
badge: blog
ctas:
  - 
    title: Home
    link: /
  -
    title: Sign up for the Developer Sandbox
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/create
---

### Install nginx

<a href="https://www.nginx.com/resources/wiki/start/topics/tutorials/install/" target="_blank">Install nginx</a>.

### Get an SSL Certificate from Lets Encrypt

The first step is to download and install acme.sh 
```
mkdir /root/letsencrypt
cd /root
git clone  https://github.com/neilpang/acme.sh \ 
   /root/letsencrypt
cd /root/letsencrypt
./acme.sh --install
mkdir -p  /etc/ssl/certs/letsencrypt
```

Acme.sh has an apache install option. 
```
yum install httpd
sudo service httpd start
curl http://localhost     # to check apache is running
```
 Apache was already installed on the test server. We used Apache to acquire the Let's Encrypt certificates.
 
 Run the certificate issuing command, replacing the items in (and including) "<>" with your own values:

```
cd /root/letsencrypt
./acme.sh  --issue  \
           -d <your_external_server_name>  \
           --apache
mkdir -p /etc/httpd/certs/ssl/letsencrypt
```

Nginx is simpler to configure so we stop Apache and install nginx and transfer the SSL certificates to 
the nginx configuration.
 
```
sudo service httpd stop   # stop apache
yum install nginx   # install nginx
cd /etc/nginx
mkdir -p  /etc/ssl/certs/letsencrypt
cp /etc/httpd/certs/ssl/letsencrypt/* /etc/ssl/certs/letsencrypt/
# start nginx
service nginx start
```
In this configuration we will run nginx and the client application on the same server. 

Edit the /etc/nginx/nginx.conf, replacing the items in (and including) "<>" with your own values:

```
user nginx nginx;
worker_processes 2;
error_log /var/log/nginx/error.log;
worker_rlimit_nofile 8192;

events {
  worker_connections 4096;
}

# connect nginx to the node app running on the same machine
http {
  upstream application {
    # this is where we point to our node app
    server 127.0.0.1:8001;
  }

  server {
    listen 80;
    return 301 https://$host$request_uri;
  }  

  server {
    listen 443;
    # set the server name to what you defined in dns 
    server_name <your_external_server_name>;
    server_tokens off;

    access_log /var/log/nginx/ssl_access.log;    
    error_log /var/log/nginx/ssl_error.log;

    add_header   Strict-Transport-Security "max-age=31536000; includeSubdomains; preload";
    add_header   X-Content-Type-Options nosniff;
    add_header   X-Frame-Options DENY;
    ssl on;
    # This is where we copied the Lets Encrypt cert and key to
    ssl_certificate /etc/ssl/certs/letsencrypt/<your_external_server_name>-cert.pem;  
    ssl_certificate_key /etc/ssl/certs/letsencrypt/<your_external_server_name>-key.pem;


    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers   on;
    ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
    # ssl_ciphers  "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH !RC4";
    # ssl_ecdh_curve secp384r1;
    ssl_session_tickets off;

    location / {
      proxy_set_header Host $host;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Real-IP $remote_addr;
      # proxy_set_header X-Forwarded-Proto https;
      proxy_set_header X-Forwarded-Proto $scheme;
      # proxy_redirect off;
      proxy_read_timeout  90;
      # point proxy_redirect from your dns entry
      proxy_redirect http://application https://<your_external_server_name>; 
      # proxy_redirect http://application 
      proxy_pass http://application;
    }
    error_page 500 502 503 504 /custom_50x.html;
    # This error page will display if the app is not running
    location = /custom_50x.html {
            root /var/www/nginx/html;
            internal;
    }
  }
}
```

Launch the app with the "tunnel" parameter that is the public URL for the server:

```
node app.js -t https://<your_external_server_name>
```

The node application we have used here is a sample application. It is not meant for production use. 
Therefore, we recommend that a server-based implementation is only started up for test purposes only. 

