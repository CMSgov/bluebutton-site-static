---
layout: post
title: Install an Angular Client App
date:  2018-12-13 6:30 AM -0600
published: true
categories: latest code
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/install-an-angular-client-app.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/install-an-angular-client-app.jpg
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

This is the second in a [series of posts](https://bluebutton.cms.gov/blog/More-Sample-Applications.html) in which we work step-by-step through installing, configuring, and running our new sample applications.

Today we will focus on the Angular client.

Installing and running the client involves six steps:
1. Get the code
2. Prepare your environment
3. Get your sandbox credentials
4. Configure your sample application
5. Install and launch your application
6. Open your browser and access the client application

## 1. Get the Code

You can get the code for the Angular client app here:
[https://github.com/CMSgov/bluebutton-sample-client-angular](https://github.com/CMSgov/bluebutton-sample-client-angular)

Installing the application on your own desktop is a quick and easy process that is well documented in the [README.md](https://github.com/CMSgov/bluebutton-sample-client-angular/blob/master/README.md) file.

For this post, we assume you are installing the application on a MacBook Pro running a current version of MacOS. Therefore, we will be using a unix-style shell for terminal access.

## 2. Prepare Your Environment

Installing the sample client requires the Node Package Manager (npm). The Node Package Manager (npm) is installed with Node.js.

Here are the steps to go through to install this application on MacOS.
For this post, we assume you are comfortable with working in a terminal session on a Linux Server or your Mac.

- Download the Node package
- Run the Node install package

After installing, open a terminal and check the npm version to confirm it is installed.

```bash
npm -v
```

npm is updated frequently. Even if you have just installed Node.js, run an npm update:

```bash
npm install npm@latest -g
```

**For help installing on other platforms, check out: [Installing Node Package Manager](For help installing on other platforms, check out: Installing Node Package Manager).**

After installing Node.js/npm the next step is to create a folder for the client code and pull the latest version of the code from GitHub.

```bash
mkdir ~/Dev
cd ~/Dev
git clone https://github.com/CMSgov/bluebutton-sample-client-angular.git
cd bluebutton-sample-client-angular
```

## 3. Get Your Sandbox Credentials

Anyone can register for an account in the Blue Button 2.0 Developer sandbox. Go to [https://bluebutton.cms.gov](https://bluebutton.cms.gov) and click on the
“Sign up for the Developer Sandbox” link to create an account.

You will receive an email notification that your account has been created.
**Click on the link in the email to validate and activate your account.**
Then you can log in at [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov).

Once you log into your Developer Sandbox account, you can create an application. Click on “[Application Registration](https://sandbox.bluebutton.cms.gov/v1/o/applications/)” and "[Register a New Application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/)". Give your application a descriptive name. For example: “My Organization’s Claims Analyzer.”

Set the Client Type and Authorization Grant fields as follows:

- Client Type: “Confidential”
- Authorization Grant: “Authorization Code”

The Redirect URIs field is where you can enter multiple URIs separated by a space, or on a new line / carriage return / Enter key. You will need the path to an endpoint where your application will be listening for a request from our API to provide you the results of an authorization request.

For the Angular client application, we are installing the callback path for the `redirect_uri` which is: **http://localhost:8082/login**

**The above redirect_uri setting is critically important.** If this does not match the IP address or domain name and path that your application is responding to, you will get an `“Error: invalid_request”` after authorizing a user.

Copy the **Client ID** and **Client Secret** values. You will need these to set up your application. Fill out the other fields in the
form and click “Save.”

## 4. Configure Your Sample Application

Open the `src/app/_services/remoteappinfo.service.ts` file in the editor of your choice.

Look for the following lines in the file:

```ts
'client_id': "<your_client_id>",
'client_secret': "<your_client_secret>",
```

Replace `<yourclientid>` and `<yourclientsecret>` with the Client ID and Client Secret values for the application you registered.

Save the file.

## 5. Install and Launch Your Application

Launching the application is a two-step process:

1. Install (only required the first time)
2. Run the angular code

The commands for this are:

```bash
npm install #(first time only)
```

```bash
npm start
```

## 6. Open Your Browser and Access the Client Application

Now open your browser and go to: `http://localhost:8082/login`

If your application loaded successfully, you will see this screen:

![Angular Login Screen](/assets/img/blog/angular-login.png)

Click on the “Connect to CMS Medicare Blue Button 2.0” button and log into the Blue Button 2.0 sandbox using one of the synthetic beneficiary accounts. For example:

- User: `BBUser12345`
- Password: `PW12345!`

After authenticating and authorizing your application, you should be returned to the Sample App login screen. The next step is to log in to the Angular client app using:

- User: `test`
- Password: `test`

This should load a detail page with information taken from an `ExplanationOfBenefit` resource. See the example below:

![Angular Detail Screen](/assets/img/blog/angular-detail.png)

The sample application provides sample code for the behind-the-scenes tasks involved in interacting with the secure Blue Button 2.0 FHIR-based API, not a slick user interface. We leave that to you as developers.

However, if you are interested in implementing an interface that is accessible for people with disabilities, what is often referred to as “508-compliant,” then check out the [CMS Design System](https://design.cms.gov/). This site offers a set of open source design and front-end development resources for creating Section 508 compliant, responsive, and consistent websites, building on the U.S. Web Design Standards.

As always, we welcome your comments and feedback. Just head over to the Google Support Forum and post a message there.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
