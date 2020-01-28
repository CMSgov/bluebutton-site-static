---
layout: post
title: Giving Beneficiaries More Granular Choice of Data Sharing
date:  2019-11-14 6:30 AM -0600
categories: latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/giving-beneficiaries-more-granular-choice-of-data-sharing.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/giving-beneficiaries-more-granular-choice-of-data-sharing.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

As adoption of the Blue Button 2.0 API (BB2.0 API) grows, the CMS Blue Button team continues to look at ways to improve the API and stay current with evolving standards. A primary goal for CMS with the BB2.0 API is to help beneficiaries make informed choices about the applications they use and the data they share. To enhance the security and privacy posture for Medicare beneficiaries using the BB2.0 API, we are pleased to announce two changes to the API:

1.	A feature enhancement to enable beneficiaries to choose whether they want to share their demographic information with a given application. This change is described in more detail below. 
2.	[Updates to the BB2.0 API Terms of Service, described in more detail here](/blog/ensuring-beneficiary-privacy-and-security-through-new-application-onboarding-requirements.html).

## What does this new choice mean?

Beginning March 31st, 2020, the application authorization process will allow beneficiaries to choose not to share personally identifying demographic information (e.g., name, date of birth) with applications.  

Beneficiary demographic information like name, race, gender, birthday, and address is stored in the patient resource. This change will allow beneficiaries to elect not to share that demographic data. Developers of applications that rely on demographic data for their application will need to collect that information elsewhere in the user flow should the beneficiary not allow it to be shared through Blue Button 2.0.

To allow developers to test this new functionality, CMS will introduce the new choice feature into [sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov) in two phases over the coming months:

- Phase 1: The beneficiary authorization screen will be modified to enable a choice to share beneficiary demographic data.
- Phase 2: Applications will be able to define the scopes they want to request in their application configuration. If they don’t require demographic information, the beneficiary authorization screen will not prompt for a choice to be made. 

At this time, the default setting for demographic data will be for sharing enabled. This may change in the future as we monitor beneficiaries’ choices and feedback.

## What differences will I see in the API?

If a beneficiary chooses to NOT share their demographic information, an application will need to handle the return of a 403 status code from the following API endpoints:

```
/v1/fhir/Patient
```

```
/v1/connect/userinfo
```

## Enabling Apps to request data scopes

Behind the scenes of the Blue Button 2.0 API, we have implemented HL7 FHIR scopes to manage access to beneficiary data. These scopes look like this:

```
patient/Patient.read
```

```
patient/Coverage.read
```

```
patient/ExplanationOfBenefit.read
```

From the OpenID Connect specification we support:

```
profile
```

This gives access to the `/v1/connect/UserInfo` Endpoint.

In phase two, CMS will enable applications to select the scopes they require for their application. If an application does not require the beneficiary demographic information, the `patient/Patient.read` and `profile` scopes can be excluded from the application’s profile.


---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
