---
layout: post
title: Install a Spring Boot Client App
date:  2018-08-30 6:30 AM -0600
categories: latest code
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/install-a-springboot-client-app.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/install-a-springboot-client-app.jpg
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

As we prepared for our first Blue Button 2.0 Developer Conference we wanted to add to our
portfolio of sample client applications.  
Check out our new sample applications.
The links to the GitHub repositories are in an earlier blog post here:
[https://bluebutton.cms.gov/blog/More-Sample-Applications.html](https://bluebutton.cms.gov/blog/More-Sample-Applications.html)

As promised in that post, this is the first of a series of posts where we work step-by-step
through installing and configuring each sample application.

Today we will focus on the Spring Boot client.

You can get the code for the Spring Boot client app here:
https://github.com/CMSgov/bluebutton-sample-client-spring-boot

Installing the application on your own desktop is a quick and easy process and is well
documented in the [readme.md](https://github.com/CMSgov/bluebutton-sample-client-spring-boot/blob/master/readme.md) file.

For the purposes of this article I am installing the application on a MacBook Pro running
a current version of MacOS. We will therefore be using a unix-style shell for terminal access.

## Prepare your environment
Installing the sample client requires Apache Maven and Java to be installed.

The sample client requires the Java JDK version 1.8. Check out this page to download Java:
[Java SE Development Kit 8 - Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

If Maven is not already installed on your machine go to
[Maven – Installing Apache Maven](https://maven.apache.org/install.html).
Get the download and follow the installation instructions to set the
**JAVA_HOME** and **PATH** Environment variables.

You can check if Maven is installed by entering the following command:

``` bash
mvn --version
```
If Maven is installed you should see something similar to the following output:
``` bash
Apache Maven 3.3.1 (cab6659f9874fa96462afef40fcf6bc033d58c1c; 2015-03-13T16:10:27-04:00)
Maven home: /usr/local/apache-maven-3.3.1
Java version: 1.7.0_60, vendor: Oracle Corporation
Java home: /Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "mac os x", version: "10.13.6", arch: "x86_64", family: "mac"
```
The actual output will vary depending on software versions and Operating System Versions
you have installed on your machine.

## Get HAPI-FHIR
Let's start by opening up a terminal session and navigating to a folder where we want
to install our the code we need. e.g. ~/Dev

This sample app depends on the  [HAPI FHIR](https://github.com/jamesagnew/hapi-fhir) project.
You can checkout and build this project from a repository on GitHub, as follows:

``` bash
cd ~/Dev
git clone https://github.com/HHSIDEAlab/hapi-fhir.git hhsidealab-hapi-fhir.git
cd hhsidealab-hapi-fhir.git
mvn clean install -DskipITs=true -DskipTests=true
```

Now would be a good time to replenish your coffee...
Building the HAPI-FHIR project is a 48 step compilation process and the time taken will
depend on the download speed for your internet connection.  
On my machine this took a little under 20 minutes to complete.

## Get the sample application code
With the HAPI-FHIR project built we can now proceed with the install of the sample
application:

``` bash
cd ~/Dev
git clone https://github.com/CMSgov/bluebutton-sample-client-spring-boot.git
# switch to the folder containing the sample app
cd bluebutton-sample-client-spring-boot
```

## Get Your Sandbox Credentials
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
path for the redirect_uri is: **http://localhost:8080/login**

**The above redirect_uri setting is critically important.** If this does not match
the IP Address or domain name and path that your application is responding to you
will get an “Error: invalid_request” after authorizing a user.
Copy the **Client ID** and **Client Secret** values.
You will need these to setup your application. Fill out the other fields in the
form and click “**Save**”.

## Configuring your application
Open the *src/main/resources/application.yml* file in the editor of your choice.
Look for the following lines in the file:
```
      clientId: <YOUR CLIENT ID>
      clientSecret: <YOUR CLIENT SECRET>
```

Replace <YOUR CLIENT ID> and <YOUR CLIENT SECRET> with the Client ID and Client Secret
values for the application you registered.
Save the file.

## Load the Spring Boot application
Launching the application is a two-step process:
	1. Install (only required the first time)
	2. Run the java code
The commands for this are:

``` bash
mvn clean install
```

If the install is successful you will see a message that looks something like this:
``` bash
[INFO] -------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] -------------------------------------------------------------
[INFO] Total time: 22.602 s
[INFO] Finished at: 2018-08-30T11:47:00-04:00
[INFO] -------------------------------------------------------------
```

Now we need to launch the .jar file with Java:
``` bash
java -jar target/bluebutton-sample-client-spring-boot-0.0.1-SNAPSHOT.jar
```

Now open your browser and go to:
**http://localhost:8080**
If your application loaded successfully you will see a screen like this:
![Spring-Boot Launch Screen](/assets/img/blog/spring-boot-home-launch.png)

You can now login using one of the synthetic beneficiary accounts in the Blue Button 2.0
Sandbox environment. For example:

* User: **BBUser12345**
* Password: **PW12345!**

After Authenticating and authorizing your application you should be returned to
the Sample App with a series of buttons like these:
![Spring-Boot Home Screen](/assets/img/blog/spring-boot-home.png)

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
