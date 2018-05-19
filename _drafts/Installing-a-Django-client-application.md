---
layout: post_with_category
title: Install a Django Client
date:   2018-05-01 23:00:00 -0600
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
In the previous blog post we covered how to install a Node.js client application. In this post we 
will cover installing a Python3/Django application to interact with the Blue Button 2.0 Sandbox API.

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

## Install the Client Application Requirements

    cd ~/developer/pd_bbc/bluebutton-sample-client-django
    pip install bbc/requirements/requirements.txt
    
## Get Your Sandbox Credentials



## Configure the Settings File 

    cd ~/developer/pd_bbc/bluebutton-sample-client-django/bbc
    
    
## Setup the Client Application

    python manage.py createsuperuser 
    
Enter the name and password for the superuse/admin account.
Then setup the database

    python manage.py makemigrations

## Run the Client Application

    python manage.py runserver --insecure

## Connect to the Synthetic Data






