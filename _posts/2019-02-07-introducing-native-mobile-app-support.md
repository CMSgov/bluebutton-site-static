---
layout: post
title: Introducing Native Mobile App Support
date:  2019-02-07 6:30 AM -0600
categories: latest code
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/introducing-native-mobile-app-support.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/introducing-native-mobile-app-support.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

## Introducing Native Mobile App Support

We are excited to announce a new feature for the Blue Button 2.0 API: Native Mobile App Support.

## A Standards-based API

The Blue Button 2.0 API has always embraced being a developer-friendly, standards-based API. We are excited to support a new capability that has been released in the OAuth 2.0 specification, [RFC 8252 - OAuth 2.0 for Native Apps](https://tools.ietf.org/html/rfc8252). It is an authentication flow utilizing [RFC 7636 - Proof Key for Code Exchange by OAuth Public Clients](https://tools.ietf.org/html/rfc7636) (better known as [PKCE](https://tools.ietf.org/html/rfc7636) or “Pixie”) in conjunction with custom URI schemes to handle OAuth 2.0 redirects.

## Implementing Native Mobile App Support in Your App

When you register an application with the Blue Button 2.0 API, you can enter a custom URI scheme as part of your `redirect_uri`. We recommend the use of a reverse DNS for your custom URI scheme.  

Let’s use an example from the mobile app the Blue Button 2.0 engineering team created to test this new feature.

Since we own the domain: `bluebutton.cms.gov`

We created a reverse DNS custom URI:
``` bash
gov.cms.bluebutton.oauthtester
```

We then added the path to our callback handler in our mobile app:
``` bash
/oauth2redirect/example-provider
```

When we put the entire `redirect_uri` together we have:
``` bash
gov.cms.bluebutton.oauthtester://oauth2redirect/example-provider
```

This is the value we enter in the `redirect_uri` field in the application form on [https://sandbox.bluebutton.cms.gov/](https://sandbox.bluebutton.cms.gov/).

## Why Use the Native Mobile App Support Feature?

Our Blue Button 2.0 developer community members are inventive. We have already seen some of you create mobile apps. Those apps invariably had to implement some type of proxy server that could handle a secure redirect over https/SSL and then push a notification to the mobile device that initiated the connection.

Native Mobile App Support enables the entire token exchange process that is required as a prerequisite to accessing the data in the Blue Button 2.0 API to take place on the mobile device. Most importantly, the inclusion of [PKCE](https://tools.ietf.org/html/rfc7636) guards against a “man-in-the-middle” attack during the token exchange process.

For mobile app developers this allows integration with the Blue Button 2.0 API to happen entirely on the mobile device without any dependency on an intermediary server. The mobile app can be completely self-contained.

## How to Get Started with Native Mobile App Support

Find documentation on Native Mobile App Support in the [Blue Button documentation](https://bluebutton.cms.gov/developers/#nativeMobileApp).

A coding example of an OAuth 2.0 and PKCE flow is available here: [Authorization Code with PKCE Flow - OAuth 2.0 Playground](https://www.oauth.com/playground/authorization-code-with-pkce.html)

The Blue Button 2.0 engineering team has also created a sample Android application. You can review or fork the code here: [https://github.com/CMSgov/bluebutton-sample-client-android](https://github.com/CMSgov/bluebutton-sample-client-android)

We are excited to release this new capability and look forward to seeing the exciting things you create. You can share what you’re working on and any feedback you have on the [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api).


---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
