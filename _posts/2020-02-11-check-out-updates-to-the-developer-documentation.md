---
layout: post
title: ­Check Out Updates to the Developer Documentation
date:  2020-02-11 6:00 AM -0600
categories: latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/check-out-updates-to-the-developer-documentation.jpg
hero-thumb: /assets/img/blog/hero-images/check-out-updates-to-the-developer-documentation.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

Recently there has been an increase in questions on the [Blue Button 2.0 Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) about a ‘500 error’ when using the [Test Client](https://sandbox.bluebutton.cms.gov/testclient/).

A few changes have been made to help you avoid this issue when starting to use the Blue Button 2.0 API.

Here are the changes that have been implemented:
  - Added a warning to the [Test Client](https://sandbox.bluebutton.cms.gov/testclient/)
  - Updated the “[Try the API](https://bluebutton.cms.gov/developers/#try-the-api)” section of our Developer Documentation

## Changes to the Test Client

The [Test Client](https://sandbox.bluebutton.cms.gov/testclient/) was originally developed to enable simple testing of our secure Sandbox API. But if you are logged into your developer sandbox account and go through the authorization flow in the Test Client, you will get a 500 error. In order to reduce confusion and make testing easier, we’ve added a warning message and a logout link to the [Test Client](https://sandbox.bluebutton.cms.gov/testclient/).

## Changes to the “Try the API” documentation

While diagnosing the 500 error on the [Test Client](https://sandbox.bluebutton.cms.gov/testclient/), we discovered that our documentation for first-time users of the Blue Button 2.0 API was unclear and needed improvement.

Instructions for users of the popular Postman developer tool have been provided in step 3 of the “[Try the API](https://bluebutton.cms.gov/developers/#try-the-api)” section of the documentation. These instructions are also easy to follow for developers who prefer to use the Insomnia app on Mac OS.

In the “[Try the API](https://bluebutton.cms.gov/developers/#try-the-api)” section, we have highlighted the [Medicare.gov](http://medicare.gov/) synthetic beneficiary user IDs and passwords in each section where you might need to use them to authenticate.

The documentation also reflects the switch to using a minus sign prefix to the FHIR Patient IDs for the Blue Button 2.0 synthetic records. When we added the synthetic beneficiaries and their claims to the production environment, we added a minus sign prefix to the FHIR ID to avoid any possibility of a collision between synthetic and real beneficiary records.

Check out the documentation and let us know if there are other improvements we can make. As always, we welcome your feedback via the [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api).

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
