---
layout: post
title: Introducing Native Mobile App Support
date:  2018-12-24 6:30 AM -0600
categories: latest code news
permalink: /blog/:title
badge: blog
status: draft
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
# Introducing Native Mobile App Support
Smartphones and tablets are everywhere.  We recognize that a significant number of our developers in the Blue Button 2.0 Community are interested in creating native Mobile applications  that run on either iOS or Android. 

We are therefore excited to announce a new feature for the Blue Button 2.0 API: Native Mobile Application Support.

## A Standards-based API
The Blue Button 2.0 API has always embraced being a developer-friendly, standards-based API. When a new capability in the OAuth2.0 specification  was released we were excited to support it.  The new specification  is [RFC 8252 - OAuth 2.0 for Native Apps](https://tools.ietf.org/html/rfc8252) an authentication flow utilizing  [RFC7636 -Proof Key for Code Exchange by OAuth Public Clients](https://tools.ietf.org/html/rfc7636) ,(better known as PKCE ‘Pixie”)  in conjunction with  custom URI schemes to handle OAuth2 redirects.

## Implementing Mobile App Support in your app
When you register an application with the Blue Button 2.0 API you can enter a custom URI scheme as part of your redirect_uri.

We recommend the use of a reverse dns for your custom URI scheme.  Let’s use an example from the mobile app the Blue Button 2.0 Engineering team created to enable us to test this new feature.

Since we own the domain: bluebutton.cms.gov
We created a reverse dns custom uri: gov.cms.bluebutton.oauthtester

We then added in the path to our callback handler in our mobile app: /oauth2redirect/example-provider

When we put the entire redirect_uri together we have:  gov.cms.bluebutton.oauthtester://oauth2redirect/example-provider

This is the value we enter in the redirect_uri field in the application form on https://sandbox.bluebutton.cms.gov.

## Why use the Mobile App Support feature?
Our Blue Button 2.0 developer community are inventive. We have already seen some of you create mobile apps. Those apps invariably had to implement some type of proxy server that could handle a secure redirect over https/SSL and then push a notification to the mobile device that initiated the connection.  Native Mobile App support enables the entire token exchange process that is required as a prerequisite to accessing the data in the Blue Button API  to take place on the mobile device. Most importantly the inclusion of PKCE guards against a “man-in-the-middle” attack during the token exchange process.

For mobile app developers this allows integration with the Blue Button 2.0 API to happen entirely on the mobile device without any dependency on an intermediary server. The mobile app can be completely self-contained.

## How to get started with Mobile App support
The documentation for Native Mobile App support is available at [Blue Button API Docs - Mobile App Support](https://bluebutton.cms.gov/developers/#mobile-app-support).

A coding example of an OAuth 2.0 and PKCE flow is available here: [Authorization Code with PKCE Flow - OAuth 2.0 Playground](https://www.oauth.com/playground/authorization-code-with-pkce.html)

The Blue Button engineering team has also created a sample Android application. Ou can review or fork the code here:
[bluebutton-sample-client-android/README.md at master · dtisza1/bluebutton-sample-client-android · GitHub](https://github.com/dtisza1/bluebutton-sample-client-android/blob/master/README.md)

We are excited to release this new capability and look forward to seeing the exciting things you create.  As always, we welcome your feedback - just head over to the [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) and leave us feedback.

