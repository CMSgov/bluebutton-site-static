---
layout: post
title: Sandbox Users! We are Changing the Patient Identifier
date:  2019-07-02 6:30 AM -0600
categories: latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/sandbox-users-we-are-changing-the-patient-identifier.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/sandbox-users-we-are-changing-the-patient-identifier.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

On July 22 nd , the Blue Button 2.0 team will make a change to apply a minus sign prefix to the Patient Identifier, the FHIR ID, in the patient records in our sandbox environment. This change will ensure that synthetic records are formatted the same way in both the sandbox and production environments.

When we added synthetic beneficiaries and their claims to the production environment last year, we added a minus sign prefix to the FHIR ID to avoid any possibility of a collision between synthetic and real beneficiary records. **Now, we are applying the same minus prefix to the FHIR ID in our sandbox environment.**

We believe this change will be beneficial for developers since test records will be the same in both the sandbox and production environments. However, for some developers, this change may cause issues for your application in certain scenarios where the patient FHIR Identifier is used across more than one communication session with the Blue Button 2.0 API.

## How will this affect my Application?

Your application will only be affected if you have a test user account and your application uses and stores the FHIR ID for use between sessions. If this is the case, then this change will break your application and you will need to modify your user data tables to switch to the new negative prefixed identifier.

All other users should not be impacted. This includes developers with an application already approved for production since we are not making any changes to production data.

## Will you provide reminders in advance of this change?

Yes, since this change has the potential to impact developers who are in active development in our sandbox, we will be posting notices in our Google Support Group on a regular basis as we approach the planned cutover date of July 22nd.

As always, we welcome you feedback. Just head over to the [Google Support Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) and leave your comments.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
