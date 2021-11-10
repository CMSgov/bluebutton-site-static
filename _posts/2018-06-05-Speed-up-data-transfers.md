---
layout: post
title: Speed up data transfers
date:   2018-06-05 09:19 PM -0600
categories: code
permalink: /blog/:title
published: false
badge: blog
hero-image: /assets/img/blog/hero-images/speed-up-data-transfers.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/speed-up-data-transfers.jpg
sections:
  - Earlier Blog Posts
  - Latest
  - General
  - Code
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

The Blue Button 2.0 Team continues to look at performance improvements for the Blue Button 2.0 API. The
ExplanationOfBenefit resource can involve a large amount of data being transferred. To improve performance
in this area we are introducing the ability to apply gzip compression.

The following content types can be enabled for compression:

- text/html
- text/plain
- application/json
- application/fhir+json

The minimum payload size we will gzip is 1 kilobyte.

## Compression is switched off by default

In order to see the benefit of gzip compression, the client must send the **Accept-Encoding: gzip** header as part of
their request. Otherwise, the server will respond with the unmodified content type and encoding.

## Example Header

The header items to activate gzip compression should include the following:

     Content-Type: application/fhir+json
     Accept-Encoding: gzip

## An Opt-in enhancement

The change is an opt-in enhancement and will not create any backward compatibility issues. Developers can choose to
implement, or not.

The change has been implemented in Release r17 that went live on 2018-06-05.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest

[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
