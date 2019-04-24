---
layout: post
title: Install a Node.js Application
date:   2018-04-01 23:00:00 -0600
categories: code latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/install-a-nodejs-application.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/install-a-nodejs-application.jpg
ctas:
  -
    title: Home
    link: /
  -
    title: Sign up for the Developer Sandbox
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/create
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

As we prepared to launch our Production Blue Button 2.0 API we wanted to test the API
from the perspective of a third-party client application.

You can get the code for our sample client app here:

<a href="https://github.com/CMSgov/bluebutton-sample-client-nodejs.git" target="_blank">GitHub - CMSgov/bluebutton-sample-client-nodejs</a>
https://github.com/CMSgov/bluebutton-sample-client-nodejs

Installing the application on your own desktop is a quick and easy process and is well documented in the
<a href="https://github.com/CMSgov/bluebutton-sample-client-nodejs/blob/master/README.md" target="_blank">README</a> file.

In order to run an application you will need Node.js and the node package manager (npm) installed.
When you install Node.js you will get npm installed.

## Red Hat Enterprise Linux
Here are the steps to go through to install this application on a Red Hat Enterprise Linux 7.x server running in AWS.
In this post we are assuming you are comfortable with working in a terminal session on a Linux Server.

After establishing a virtual server, ssh to the server and
```
sudo /bin/bash
yum install -y nodejs npm
node -v
npm -v
```
**For help installing on other platforms check out:**
<a href="https://nodejs.org/en/download/package-manager/" target="_blank">Installing Node.js via package manager</a>.

After installing Node.js the next step is to create a folder for the client code and pull the latest version of that from GitHub.

```
cd /var
mkdir /var/nodejs
cd /var/nodejs
git clone https://github.com/ekivemark/bluebutton-sample-client-nodejs.git
cd bluebutton-sample-client-nodejs/
```

The next step is to configure the serverAuth file. This file holds the Client ID and Client Secret
that is associated with your application in the Blue Button 2.0 API.  
It also contains the URL for the API.

## Connect to the Blue Button 2.0 Developer Sandbox

Anyone can register for an account in the Blue Button 2.0 Developer Sandbox. Go to
<a href="https://bluebutton.cms.gov" target="_blank">https://bluebutton.cms.gov</a>
and click on the "Sign up for the Developer Sandbox" link to create an account.

You will receive an email notification that your account has been created.
**Click on the link in the email to validate and activate your account**.
Then you can log in at   
<a href="https://sandbox.bluebutton.cms.gov" target="_blank">https://sandbox.bluebutton.cms.gov</a>.

Once you log in to your Developer sandbox account you can create an application.  
Click on "[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)" and
[register a new application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/).

Give your application a descriptive name. For example:
"My Organization's  Claims Analyzer"

Set the Client Type and Authorization Grant fields as follows:
Client Type: "Confidential"
Authorization Grant: "Authorization Code"

The Redirect URIs field is where you can enter multiple URIs separated by a space or on a new line /
carriage return / Enter key.

You will need the path to an endpoint where your application will be listening for a request
from our API to provide you the results of an authorization request.

In the case of the application we are installing the callback path for the redirect_uri is:

- */redirect*

If you want to run your client application communicating with the sandbox environment from your local
desktop running on the default Node.js port you would use a redirect_uri of:

- http://localhost:8001/redirect

**The above redirect_uri setting is critically important.** If this does not match the IP Address or
domain name and path that your server is responding to you will get an "Error: invalid_request" after
authorizing a user.

If you are running the application from a server you will want the external IP address or URL of the
server application. For example:

- http://10.252.252.252/redirect
- http://client.example.com/redirect

*Note: use an appropriate ip address. The example above is for an internal network (10.x.x.x).*

Copy the Client ID and Client Secret values. You will need these to setup your application.
Fill out the other fields in the form and click "Save".

Take the Client Id and Client Secret and add them to the respective fields in serverAuth.js file.

If you are connecting to the Sandbox API the **tokenHost** Blue Button API Endpoint is:

- https://sandbox.bluebutton.cms.gov

For the Blue Button production API the Endpoint will be:

- https://api.bluebutton.cms.gov

edit serverAuth.js:

```
vi serverAuth.js
```

Because serverAuth.js needs to be customized for each implementation it is not included in the Repository.
You can copy the block of text below into a new serverAuth.js file, Replacing the items wrapped in "<>"
with the relevant data you took from your application registration. For example, if your application
Client ID was *ABCDEF12345* you would replace "<enter client id here>" with "ABCDEF12345".

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

Save the file.

After updating serverAuth.js  you can run the application:

```
node app.js -t http://localhost -p 8001
```

## Get a Beneficiary Record

After launching the application you can connect to the sandbox and use a synthetic beneficiary record.
For example, try the following credentials:

- Username: BBUser12345 /
- Password: PW12345!

## I am not returned to the app after authorizing

A frequent issue that is encountered is receiving the following error after authenticating and authorizing
with a synthetic beneficiary account:

```
Error: invalid_request
```

The most frequent cause of this error is that the redirect or callback URI for your application on
https://sandbox.bluebutton.cms.gov does not match the url endpoint the server is available on.

## Production Access requires a secure connection

If you are running your application against the Blue Button 2.0 Production API there are some additional
steps that need to be taken because the redirect_uri needs to use a secured connection, i.e. *https://*

In order to configure to run against the Production API the following additional steps are necessary:

- Install a web server to act as a proxy - we suggest nginx since it is relatively straightforward to configure
- Use a TLS Certificate - We suggest Let's Encrypt since it makes the process of acquiring a certificate free and easy
- Configure the web server to act as a proxy for the application
- Launch the application with a tunnel parameter

This is beyond the scope of this post. If there is interest expressed in the
<a href="https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api" target="_blank" >Google Group</a>
we might make that a subject of a future blog post.


**WE DO NOT RECOMMEND RUNNING THIS APPLICATION IN PRODUCTION**. This application is provided on an "as-is" basis
to help developers become familiar with the Blue Button 2.0 API.

The node application we have used here is a sample application. It is not meant for production use.
Therefore, we recommend that a server-based implementation is only started up for test purposes only.
