---
layout: post_with_category
title: Install a Ruby on Rails Client App
date:  2018-09-10 6:30 AM -0600
categories: latest code
permalink: /blog/:title
badge: blog
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
## Installing a Client App using Docker
As we prepared for our inaugural Blue Button 2.0 Developer Conference we wanted to add to our 
portfolio of sample client applications.  
Check out our new sample applications. 
The links to the GitHub repositories are in an earlier blog post here: 
[https://bluebutton.cms.gov/blog/More-Sample-Applications.html](https://bluebutton.cms.gov/blog/More-Sample-Applications.html)

As promised in that post, this is the third of a series of posts where we work step-by-step 
through installing and configuring each sample application.

Today we will focus on the Ruby on Rails client. This post is slightly different from the
previous posts because it takes you through installing the Ruby on Rails app in a 
Docker Container.

You can get the code for the Ruby on Rails client app here:
https://github.com/CMSgov/bluebutton-sample-client-rails

Installing the application on your own desktop is a quick and easy process and is well 
documented in the [README.md](https://github.com/CMSgov/bluebutton-sample-client-rails/blob/master/README.md) file.

However, the installation does have a series of prerequisites:
    - Docker 
    - Docker-compose
    - Virtualbox
    
For the purposes of this article I am installing the application on a MacBook Pro running 
a current version of MacOS. We will therefore be using a unix-style shell for terminal access. 

The steps we will go through are:
1. Get your Blue Button sandbox credentials
2. Prepare your environment
3. Get the ruby on rails code from Github
4. Configure the application credentials
5. Launch the virtual machine
6. Open your web browser and access the client application

## 1. Get Your Sandbox Credentials
Anyone can register for an account in the Blue Button 2.0 Developer Sandbox. 
Go to  [https://bluebutton.cms.gov](https://bluebutton.cms.gov/)  and click on the 
“Sign up for the Developer Sandbox” link to create an account.
You will receive an email notification that your account has been created. 
**Click on the link in the email to validate and activate your account**. 
Then you can log in at  [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov/).

Once you log in to your Developer sandbox account you can create an application.
Click on “[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)” 
and  [register a new application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/) .
Give your application a descriptive name. For example: “My Organization’s Claims Analyzer”
Set the Client Type and Authorization Grant fields as follows: 

Client Type: “Confidential” 
Authorization Grant: “Authorization Code”

The Redirect URIs field is where you can enter multiple URIs separated by a space or 
on a new line / carriage return / Enter key.
You will need the path to an endpoint where your application will be listening 
for a request from our API to provide you the results of an authorization request.
In the case of the Spring Boot client application we are installing the callback 
path for the redirect_uri is: **http://localhost:3000/bluebutton/callback**

**The above redirect_uri setting is critically important.** If this does not match 
the IP Address or domain name and path that your application is responding to you 
will get an “Error: invalid_request” after authorizing a user.
Copy the **Client ID** and **Client Secret** values. 
You will need these to setup your application. Fill out the other fields in the 
form and click “**Save**”.

## 2. Prepare your environment
Installing the sample client requires Docker, Docker-compose and VirtualBox. 
VirtualBox enables linux virtual machines to be run on your machine.

Here are the steps to go through to install this application on MacOS. 
In this post we are assuming you are comfortable with working in a terminal session 
on a Linux Server or your Mac.

- Download and install the [Docker](https://store.docker.com/search?type=edition&offering=community) package.
  (On MacOS and Windows Docker and Docker-Compose are bundled in one package)

## 3. Get the ruby on rails code from Github
After installing Docker the next step is to create a folder for the client code and pull 
the latest version of the code from GitHub.


``` bash
mkdir ~/Dev
cd ~/Dev
git clone https://github.com/CMSgov/bluebutton-sample-client-rails.git
cd bluebutton-sample-client-rails
```

## 4. Configure the application credentials
Copy a sample configuration file and then edit the file:
``` bash
cp config/local_env_sample.yml config/local_env.yml
```
Open the *config/local_env.yml* file in the editor of your choice.

update the following entries in the development section of *config/local_env.yml* with 
your application's client id and secret: 

``` bash
    BB_CLIENT_ID: "<enter client id here>"
    BB_CLIENT_SECRET: "<enter client secret here>"
```

Replace <your_client_id> and <your_client_secret> with the Client ID and Client Secret 
values for the application you registered.

Save the file.

## 5. Launch the virtual machine

Make sure Docker is running. Go to the terminal window you should still 
have open and make sure you are in the top level directory for the sample client code:

``` bash
cd ~/Dev/bluebutton-sample-client-rails
docker-compose up
``` 

When you build the docker image for the first time it will run through an 8 step build
process. This can take a about 5 minutes. Time to make a cup of tea...

The process will be complete when you see messages that look something like this:

``` bash
Creating bluebutton-sample-client-rails_web_1 ... done
Attaching to bluebutton-sample-client-rails_web_1
``` 

## 6. Open your web browser and access the client application
Open your browser and go to:
**http://localhost:3000**

If your application loaded successfully you will see a screen like this:

![Rails Home Screen](/assets/img/blog/rails-home.png)

Click on the "Click here to authorize!" link and login to the 
Blue Button 2.0 sandbox using one of the synthetic beneficiary accounts. 
For example:

* User: **BBUser12345**
* Password: **PW12345!**

After Authenticating and authorizing your application you should be returned to 
the Sample App information screen. 

![Angular Info Screen](/assets/img/blog/rails-info.png)

From this page you can click on links to various Blue Button 2.0 resources such as:
- Patient
- Coverage
- ExplanationOfBenefit

The sample application is intended to provide sample code for the behind-the-scenes tasks 
involved in interacting with the secure Blue Button 2.0 FHIR-based API. 
The emphasis was *not* on creating a slick user interface. 
We leave that to you as developers. However, if you are interested in 
implementing an interface that is accessible for people with disabilities, 
what is often referred to as "508-compliant", then check out the 
Open Source CMS Design System ( [https://design.cms.gov](https://design.cms.gov) ). 
It is an equivalent to Twitter's Bootstrap that provides User Interface resources 
for creating 508-compliant web sites.

As always, we welcome your comments and feedback. Just head over to the 
[Google Support Forum](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api) 
and post a message there.


---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
