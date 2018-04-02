---
layout: post
title: Installing a node.js client application
date:   2018-04-01 23:00:00 -0600
categories: general latest blog
ctas:
  - 
    title: Home
    link: /
  -
    title: Comments via Google Group
    link: https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api
---
# Installing a Node.js client application
As we prepared to launch our [Production Blue Button 2.0 API](https://bluebutton.cms.gov) we wanted to test the API from the perspective of a third-party client application.  I therefore set about implementing one of our sample clients, in this case an Node.js application developed by a colleague, Brian Glover. You can get the code here:

[GitHub - CMSgov/bluebutton-sample-client-nodejs](https://github.com/CMSgov/bluebutton-sample-client-nodejs.git)
https://github.com/CMSgov/bluebutton-sample-client-nodejs

Installing the application on your own desktop is a quick and easy process and is well documented in the [README](https://github.com/CMSgov/bluebutton-sample-client-nodejs/blob/master/README.md) file.

In oder to run an application you will need node and the node package manager (npm) installed. If you install node you will get npm installed.

## Red Hat Enterprise Linux
What I am going to document now are the steps I went through to install this application on a Red Hat Enterprise Linux 7.x server running in AWS.

After establishing a virtual server, ssh to the server and 
```
sudo /bin/bash
yum install -y nodejs
node -v
npm -v
```
For help to install on other platforms check out: [Installing Node.js via package manager | Node.js](https://nodejs.org/en/download/package-manager/)

After installing node the next step is to create a folder for the client code and pull the latest version of the client code from github.

```
cd /var
mkdir /var/nodejs
cd /var/nodejs
git clone https://github.com/ekivemark/bluebutton-sample-client-nodejs.git
cd bluebutton-sample-client-nodejs/
```
 
The next step is to configure the serverAuth file. This file holds the client id and client secret that is associated with your application in the Blue Button 2.0 API.  It also contains the url for the API.

## Connect to the Blue Button 2.0 Developer Sandbox
Anyone can register for an account in the Blue Button 2.0 Developer Sandbox. Go to http://bluebutton.cms.gov and click on the "Sign up for the Developer Sandbox" link to create an account. 

You should receive an email notification that your account has been created. Click on the link in the email to validate and activate your account. Then you can login at https://sandbox.bluebutton.cms.gov.

Once you login to your Developer sandbox account you can create an Application.  Click on "[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)" and [register a new application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/).

Give your Application a descriptive name. For example
"***My Organization's  Claims Analyzer***"
Client Type: **Confidential**
Authorization Grant: **Authorization Code**
The Redirect URIs field is where you can enter multiple URIs separated by a space or on a new line.
You will need the path to an endpoint where your application will be listening for a request from our API to provide you the results of an authorization request.

In the case of this node.js client application the path for the redirect_uri is: */redirect*.

If you want to run your client application communicating to the sandbox environment from your local desktop running on the default port that a node.js  application uses you can use a redirect_uri of:
*http://localhost:8001/redirect*
If you are running the application from a server you will want the external ip address or url of the server application. For example:
*http://10.252.252.252/redirect*
*http://client.example.com/redirect*

Copy the Client id and Client secret values. You will need these to setup your application.
fill out other fields in the form and click "Save".

Take the Client Id and Client secret and add them to the respective fields in serverAuth.js.

If you are connecting to the Sandbox API the **tokenHost** Blue Button API Endpoint is:
*https://sandbox.bluebutton.cms.gov*
For the Blue Button production API the Endpoint will be:
*https://api.bluebutton.cms.gov*.

edit serverAuth.js:

vi serverAuth.js

```
// BlueButton Registered Application Credentials
const credentials = {
    // Blue Button API sandbox Credentials
	 client: {
	     id: '<enter client id here>',
	     secret: '<enter client secret here>',
	 },
    auth: {
        tokenHost: '<Blue Button API Endpoint>',
        authorizePath: '/v1/o/authorize/',
        tokenPath: '/v1/o/token/'
    }
};
exports.credentials = credentials;
```

After updating serverAuth.js  you can run the application:
```
node app.js
```

If you are running the application against the Blue Button 2.0 Production API there are some additional steps that need to be taken because the redirect_uri needs to use a secured connection. ie. *https://*

In order to configure to run against the Production API I needed to accomplish the following additional steps:

	- Install nginx
	- use Lets Encrypt to issue an SSL certificate for the server 
	- Configure nginx to act as a proxy for the node application 
	- Launch the node application with a tunnel parameter

### Install nginx
[Install | NGINX](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)

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
 Apache already installed on my test server I used Apache to acquire the Lets Encrypt certificates

```
cd /root/letsencrypt
./acme.sh  --issue  \
           -d consumer.bluebutton.cms.fhirservice.net  \
           --apache
mkdir -p /etc/httpd/certs/ssl/letsencrypt
```

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

Let's edit the /etc/nginx/nginx.conf:
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
    server_name consumer.bluebutton.cms.fhirservice.net;
    server_tokens off;

    access_log /var/log/nginx/ssl_access.log;    
    error_log /var/log/nginx/ssl_error.log;

    add_header   Strict-Transport-Security "max-age=31536000; includeSubdomains; preload";
    add_header   X-Content-Type-Options nosniff;
    add_header   X-Frame-Options DENY;
    ssl on;
    # This is where we copied the Lets Encrypt cert and key to
    ssl_certificate /etc/ssl/certs/letsencrypt/consumer.bluebutton.cms.fhirservice.net-cert.pem;  
    ssl_certificate_key /etc/ssl/certs/letsencrypt/consumer.bluebutton.cms.fhirservice.net-key.pem;


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
      proxy_redirect http://application https://consumer.bluebutton.cms.fhirservice.net; 
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

launch the app with the "tunnel" parameter that is the public url for the server:

```
node app.js -t https://consumer.bluebutton.cms.fhirservice.net
```
	-


#bluebutton/blog