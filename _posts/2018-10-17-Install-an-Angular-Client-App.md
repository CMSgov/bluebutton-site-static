---
layout: post
title: Install an Angular Client App
date:  2018-10-17 6:30 AM -0600
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
# Install an Angular client application
Check out our new sample applications. 
The links to the GitHub repositories are in an earlier blog post here: 
[https://bluebutton.cms.gov/blog/More-Sample-Applications.html](https://bluebutton.cms.gov/blog/More-Sample-Applications.html)

As promised in that post, this is the second in a series of posts where we work 
step-by-step through installing and configuring each sample application.

Today we will focus on the Angular client.

Installing and running the client involves 6 steps:
1. Get the code
2. Prepare your environment
3. Get your sandbox credentials
4. Configure your sample application
5. Install and launch the application
6. Open your browser and access the client application

## 1. Get the code
You can get the code for the Angular client app here:
https://github.com/CMSgov/bluebutton-sample-client-angular

Installing the application on your own desktop is a quick and easy process and is well 
documented in the [README.md](https://github.com/CMSgov/bluebutton-sample-client-angular/blob/master/README.md) file.

For the purposes of this article I am installing the application on a MacBook Pro running 
a current version of MacOS. We will therefore be using a unix-style shell for terminal access. 

## 2. Prepare your environment
Installing the sample client requires the Node Package Manager (npm). The node package 
manager (npm) is installed with node.js.

Here are the steps to go through to install this application on MacOS. 
In this post we are assuming you are comfortable with working in a terminal session 
on a Linux Server or your Mac.

- Download the Node package
- Run the node install package

After installing, open a terminal and check the npm version to confirm it is installed.

``` bash
npm -v
```

npm is updated frequently. Even if you have just installed node.js run an npm update:

``` bash
npm install npm@latest -g
```

**For help installing on other platforms check out:** 
<a href="https://www.npmjs.com/get-npm" target="_blank">Installing node package manager</a>.

After installing Node.js/npm the next step is to create a folder for the client code and pull 
the latest version of the code from GitHub.


``` bash
mkdir ~/Dev
cd ~/Dev
git clone https://github.com/CMSgov/bluebutton-sample-client-angular.git
cd bluebutton-sample-client-angular
```

## 3. Get Your Sandbox Credentials
Anyone can register for an account in the Blue Button 2.0 Developer sandbox. 
Go to  [https://bluebutton.cms.gov](https://bluebutton.cms.gov/) and click on the 
“Sign up for the Developer Sandbox” link to create an account.
You will receive an email notification that your account has been created. 
**Click on the link in the email to validate and activate your account**. 
Then you can log in at  [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov/).

Once you log in to your Developer sandbox account you can create an application.
Click on “[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)” 
and [register a new application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/).
Give your application a descriptive name. For example: “My Organization’s Claims Analyzer”
Set the Client Type and Authorization Grant fields as follows: 

Client Type: “Confidential” 
Authorization Grant: “Authorization Code”

The Redirect URIs field is where you can enter multiple URIs separated by a space or 
on a new line / carriage return / Enter key.
You will need the path to an endpoint where your application will be listening 
for a request from our API to provide you the results of an authorization request.
In the case of the Spring Boot client application we are installing the callback 
path for the redirect_uri is: **http://localhost:8082/login**

**The above redirect_uri setting is critically important.** If this does not match 
the IP Address or domain name and path that your application is responding to you 
will get an “Error: invalid_request” after authorizing a user.
Copy the **Client ID** and **Client Secret** values. 
You will need these to setup your application. Fill out the other fields in the 
form and click “**Save**”.

## 4. Configuring your application
Open the *src/app/_services/remoteappinfo.service.ts* file in the editor of your choice.
Look for the following lines in the file:
```
       'client_id': "<your_client_id>",
       'client_secret': "<your_client_secret>",
```

Replace <your_client_id> and <your_client_secret> with the Client ID and Client Secret 
values for the application you registered.

Save the file.

## 5. Install and launch your application
Launching the application is a two-step process:
	1. Install (only required the first time)
	2. Run the angular code
The commands for this are:

``` bash
    npm install (first time only)
    npm start
```

## 6. Open your browser and and access the client application
Now open your browser and go to:
**http://localhost:8082/login**

If your application loaded successfully you will see a screen like this:

![Angular Login Screen](/assets/img/blog/angular-login.png)

Click on the "Connect to CMS Medicare Blue Button 2.0" button and login to the 
Blue Button 2.0 sandbox using one of the synthetic beneficiary accounts. 
For example:

* User: **BBUser12345**
* Password: **PW12345!**

After Authenticating and authorizing your application you should be returned to 
the Sample App login screen. The next step is to login to the Angular client app using:
* User: **test**
* Password: **test**

The should load a detail page with information taken from an ExplanationOfBenefit
resource.

![Angular Detail Screen](/assets/img/blog/angular-detail.png)

The sample application is intended to provide sample code for the behind-the-scenes tasks 
involved in interacting with the secure Blue Button 2.0 FHIR-based API. 
The emphasis was *not* on creating a slick user interface. 
We leave that to you as developers. However, if you are interested in 
implementing an interface that is accessible for people with disabilities, 
what is often referred to as "508-compliant", then check out the 
CMS Design System ( [https://design.cms.gov](https://design.cms.gov) ). 
It is a set of open source design and front-end development resources 
for creating Section 508 compliant, responsive, and consistent websites, 
building on the U.S. Web Design Standards.

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
