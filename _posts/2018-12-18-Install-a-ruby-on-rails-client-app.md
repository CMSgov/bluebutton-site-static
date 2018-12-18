---
layout: post
title: Install a Ruby on Rails Client App
date:  2018-12-18 6:30 AM -0600
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

We’ve added to our portfolio of sample client applications. This is the third in a [series of posts](https://bluebutton.cms.gov/blog/More-Sample-Applications.html) in which we work step-by-step through installing, configuring, and running our new sample applications.

Today we will focus on the Ruby on Rails client. This post is slightly different from the previous posts because it takes you through installing the Ruby on Rails app in a Docker Container.

You can get the code for the Ruby on Rails client app here:
[https://github.com/CMSgov/bluebutton-sample-client-rails](https://github.com/CMSgov/bluebutton-sample-client-rails)

Installing the application on your own desktop is a quick and easy process and is well documented in the [README.md](https://github.com/CMSgov/bluebutton-sample-client-rails/blob/master/README.md) file.

However, the installation does have a series of prerequisites: Docker, Docker-compose, and Virtualbox.

For this post, we assume you are installing the application on a MacBook Pro running a current version of MacOS. Therefore, we will be using a unix-style shell for terminal access.

The steps we will go through are:
1. Get your Blue Button Developer Sandbox credentials
2. Prepare your environment
3. Get the Ruby on Rails code from GitHub
4. Configure the application credentials
5. Launch the virtual machine
6. Open your web browser and access the client application

## 1. Get Your Sandbox Credentials
Anyone can register for an account in the Blue Button 2.0 Developer Sandbox. Go to [https://bluebutton.cms.gov](https://bluebutton.cms.gov) and click on the “Sign up for the Developer Sandbox” link to create an account. You will receive an email notification that your account has been created. Click on the link in the email to validate and activate your account. Then you can log in at [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov).

Once you log into your Developer Sandbox account, you can create an application. Click on “[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)” and "[Register a New Application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/)". Give your application a descriptive name. For example: “My Organization’s Claims Analyzer.”

Set the Client Type and Authorization Grant fields as follows:
- Client Type: “Confidential”
- Authorization Grant: “Authorization Code”

The Redirect URIs field is where you can enter multiple URIs separated by a space, or on a new line / carriage return / Enter key. You will need the path to an endpoint where your application will be listening for a request from our API to provide you the results of an authorization request.
For the Ruby on Rails client application we are installing, the callback path for the `redirect_uri` is: `http://localhost:3000/bluebutton/callback`

**The above `redirect_uri` setting is critically important.** If this does not match the IP address or domain name and path that your application is responding to, you will get an “Error: invalid_request” after authorizing a user.

Copy the **Client ID** and **Client Secret** values. You will need these to set up your application. Fill out the other fields in the form and click “**Save**.”

## 2. Prepare your environment

Installing the sample client requires Docker, Docker-compose, and VirtualBox. VirtualBox enables Linux virtual machines to be run on your machine.

This blog post is based on installing on MacOS. We assume you are comfortable with working in a terminal session on a Linux Server or your Mac.

The first step is to download and install the [Docker](https://store.docker.com/search?type=edition&offering=community) package (on MacOS and Windows Docker and Docker-Compose are bundled in one package).

## 3. Get the Ruby on Rails Code from GitHub

After installing Docker, the next step is to create a folder for the client code and pull the latest version of the code from GitHub.



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
Open the `config/local_env.yml` file in the editor of your choice.

update the following entries in the development section of `config/local_env.yml` with your application's client id and secret:

``` bash
    BB_CLIENT_ID: "<enter client id here>"
    BB_CLIENT_SECRET: "<enter client secret here>"
```

Replace `<your_client_id>` and `<your_client_secret>` with the Client ID and Client Secret values for the application you registered.

Save the file.

## 5. Launch the Virtual Machine

Make sure Docker is running. Go to the terminal window (still open) and make sure you are in the top-level directory for the sample client code:

``` bash
cd ~/Dev/bluebutton-sample-client-rails
docker-compose up
```

When you build the Docker image for the first time, it will run through an eight-step build process. This can take about 5 minutes. Time to make a cup of tea…

The process will be complete when you see messages that look something like this:

``` bash
Creating bluebutton-sample-client-rails_web_1 ... done
Attaching to bluebutton-sample-client-rails_web_1
```

## 6. Open your Web Browser and Access the Client Application

Open your browser and go to: `http://localhost:3000`

If your application loaded successfully, you will see this screen:

![Rails Home Screen](/assets/img/blog/rails-home.png)

Click on the “Click here to authorize!” link and log into the Blue Button 2.0 sandbox using one of the synthetic beneficiary accounts. For example:

User: BBUser12345
Password: PW12345!

* User: **BBUser12345**
* Password: **PW12345!**

After authenticating and authorizing your application, you should be returned to the Sample App information screen. See the example below:

![Angular Info Screen](/assets/img/blog/rails-info.png)

From this page you can click on links to various Blue Button 2.0 resources such as:
- Patient
- Coverage
- ExplanationOfBenefit


The sample application provides sample code for the behind-the-scenes tasks involved in interacting with the secure Blue Button 2.0 FHIR-based API, not a slick user interface. We leave that to you as developers.

However, if you are interested in implementing an interface that is accessible for people with disabilities, what is often referred to as “508-compliant,” then check out the [CMS Design System](https://www.design.cms.gov). This site offers a set of open source design and front-end development resources for creating Section 508 compliant, responsive, and consistent websites, building on the U.S. Web Design Standards.

As always, we welcome your comments and feedback. Just head over to the
[Google Support Forum](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api) and post a message there.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
