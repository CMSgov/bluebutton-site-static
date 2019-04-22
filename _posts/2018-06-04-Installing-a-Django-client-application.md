---
layout: post
title: Install a Django Client
date:   2018-06-01 09:00:00 -0500
categories: code
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/install-a-django-client.jpg
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

In a previous blog post we covered how to
[install a Node.js client application](https://bluebutton.cms.gov/blog/Installing-a-Nodejs-client-application.html).
In this post we will cover installing a Python3/Django application to interact with the Blue Button 2.0 Sandbox API.

## Pre-requisites

There are some pre-requisites needed to install and run this Blue Button Client (BBC) application on your
local machine:

- Python 3.4 or later (https://www.python.org/downloads/release/python-348/)
- The VirtualEnv utilities (https://virtualenv.pypa.io/en/stable/)
- Git Command Line Utilities (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Download a version of Python3 for your platform from (python.org)[https://python.org].

The VirtualEnv utilities enable you to isolate this installation from the standard version of Python installed
on your machine.

BBC is maintained on Github. You will need the Git Command Line tools
in order to download the code. It has been tested with Py4 and 3.5. If you use Python 3.5 you can
use the "venv" command instead of the virtualenv utilities to create your virtual environment.

## Your Developer Environment

These instructions are based on installing on a MacOS (10.13.4) laptop. The steps involved should be the same
for Linux Workstations. Windows PC configuration, particularly for installing the pre-requisites, may vary.

These instructions assume that you are a developer that is comfortable working in a terminal/command line
environment.

## Create and Activate a Virtual Environment

Create the virtual environment to store libraries and modules needed by BBC:

    mkdir ~/.virtualenv
    python3 -m venv ~/.virtualenv/pd_bbc

Activate the environment with

    source ~/.virtualenv/pd_bbc/bin/activate

## Download the Blue Button Client Code

    mkdir -p ~/developer/pd_bbc
    cd ~/developer/pd_bbc
    git clone https://github.com/CMSgov/bluebutton-sample-client-django.git

## Check out the README.md file

There are detailed instructions for installing the client application in the README.md file in the
root directory of the project.

## Install the Client Application Requirements

    cd ~/developer/pd_bbc/bluebutton-sample-client-django
    pip install bbc/requirements/requirements.txt

## Get Your Sandbox Credentials

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
"My Organization's Claims Analyzer"

Set the Client Type and Authorization Grant fields as follows:
Client Type: "Confidential"
Authorization Grant: "Authorization Code"

The Redirect URIs field is where you can enter multiple URIs separated by a space or on a new line /
carriage return / Enter key.

You will need the path to an endpoint where your application will be listening for a request
from our API to provide you the results of an authorization request.

In the case of the application we are installing the callback path for the redirect_uri is:

    http://localhost:8000/social-auth/complete/oauth2io/

**The above redirect_uri setting is critically important.** If this does not match the IP Address or
domain name and path that your application is responding to you will get an "Error: invalid_request" after
authorizing a user.

Copy the Client ID and Client Secret values. You will need these to setup your application.
Fill out the other fields in the form and click "Save".

## Configure the Settings File

    cd ~/developer/pd_bbc/bluebutton-sample-client-django/bbc
    cp bbc/settings/local_sample.py bbc/settings/local.py
    vi bbc/settings/local.py

update the values for     
    `SOCIAL_AUTH_OAUTH2IO_KEY`
    `SOCIAL_AUTH_OAUTH2IO_SECRET`

Set the value for Client ID in the SOCIAL_AUTH_OAUTH2IO_KEY variable.
Set the value for Client Secret in the SOCIAL_AUTH_OAUTH2IO_SECRET variable.

Save the file.

## Setup the Client Application

    python manage.py makemigrations --settings bbc.settings.local
    python manage.py migrate --settings bbc.settings.local
    python manage.py createsuperuser --settings bbc.settings.local

Enter the name and password for the superuse/admin account.

## Run the Client Application

    python manage.py runserver --settings bbc.settings.local --insecure

## Connect to the Synthetic Data

Open a browser and goto:

    http://localhost:8000

Click the button to login to CMS. When prompted use one of the synthetic beneficiary user names
and passwords and authorize access to your application.

Here is an example synthetic user account: *BBUser10100* with password *PW10100!*.

You should now have a synthetic user account connected to your application and the app
should be displaying a series of links for each type of resource. The screen should look
something like this:

![Sample Django Client App](/assets/img/blog/sample_django_client.png)

If you have feedback on this post. Please drop us a message in the
[Google Developer Group for Blue Button 2.0 API](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api).
