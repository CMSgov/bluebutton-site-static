---
layout: terms
title:  "Production Access User Guide"
date:   2018-02-22 09:21:12 -0500
description: "A guide to help you prepare for and understand our requirements for production access to the Blue Button 2.0 API"
badge: documentation
permalink: /guide/
sections:
- Introduction
- The production access process
- Application development resources and guidelines
- Your privacy policy and terms of service
- Production access request and demo
---
## Introduction
We're pleased that you're considering applying for production access to the CMS Blue Button 2.0 API. Our production access process and [Terms of Service](/terms/){:target="_blank"} are designed to ensure that Medicare enrollees and their data are kept secure, and that enrollees are given the information to make informed decisions when sharing their healthcare data with third-party applications.  

This guide includes:

* An outline of the major steps in the Blue Button 2.0 API [production access process](#the-production-access-process)
* Resources and guidelines for [developing your application](#application-development-resources-and-guidelines)
* Requirements for your [privacy policy and terms of service](#your-privacy-policy-and-terms-of-service)
* Information about [applying for production access and demoing your application](#production-access-request-and-demo) for the Blue Button 2.0 team

## The production access process

The major steps you will take when developing your application and applying for Blue Button 2.0 API production access are as follows:  

1. **Read the Blue Button 2.0 API Terms of Service.**
  * The [Blue Button 2.0 API Terms of Service](/terms/){:target="_blank"} include all official policies for production use of the API. It is essential that you read and understand the Terms of Service before developing your application and applying for production access.
2. **Develop your application in the Blue Button 2.0 developer sandbox.**
  * Refer to our [application development resources and guidelines](#application-development-resources-and-guidelines) for links to essential documentation and tips to help make sure that your app is ready for production approval.
3. **Draft your privacy policy and terms of service.**
  * All organizations applying for production API access must include their [privacy policy and terms of service](#your-privacy-policy-and-terms-of-service) with their application.
4. **Apply for production access and demo your application.**
  * When you are ready to apply for production approval for your application, send an email to [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov). We'll respond with a form requesting basic information about your organization and application, then follow up to schedule your demo.
  * After your demo, and once any concerns with your application, privacy policy, and terms of service have been met, we will schedule the handoff of production credentials.
  * Please read about our [production access request and demo](#production-access-request-and-demo) process for complete information on applying and scheduling your demo.

---

## Application development resources and guidelines

These resources and guidelines will help you develop your application and make sure that the finished app is ready for production approval by the Blue Button 2.0 API team. 

### Documentation and other resources

The following resources are available for your use while developing your application:

* The [Blue Button 2.0 developer sandbox](https://sandbox.bluebutton.cms.gov/){:target="_blank"} is a clone of the production API that provides synthetic sample data for 40,000 Medicare enrollees.
* Our [developer documentation](https://bluebutton.cms.gov/developers/){:target="_blank"} provides all the technical information you will need to develop your application in the sandbox.
* Get started exploring the API and making requests with the [sandbox test client](https://sandbox.bluebutton.cms.gov/testclient/){:target="_blank"}, [Swagger documentation](https://sandbox.bluebutton.cms.gov/docs/openapi){:target="_blank"}, and a pre-configured [Postman collection](/developers/#4-test-the-api-with-postman-or-curl){:target="_blank"}.
* Start building your app with our Node and Python [SDKs and sample apps](https://bluebutton.cms.gov/developers/#4-next-steps){:target="_blank"}.
* You can reach out to the Blue Button 2.0 team with any questions via the [Blue Button 2.0 API Google Group](https://groups.google.com/g/Developer-group-for-cms-blue-button-api){:target="_blank"} or by emailing [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov).

### User interface guidelines

#### Presenting your privacy policy and terms of service

Your application should present your privacy policy and terms of service in a way that is clearly accessible for the user. It should also allow the enrollee to actively opt in to the privacy policy and terms of service, instead of defaulting to agreement.

#### Keeping the user informed

Your privacy policy and terms of service are important for keeping enrollees informed about how their data will be used and shared. However, many users will click through and authorize access to their medical information without reading them completely. For this reason, your in-app messaging should also clearly describe how user data will be collected, used, and shared.

For example, If an enrollee's data is about to be shared, you could use a message, modal, or the general UI to clearly and concisely convey what is about to happen, why it is about to happen, and give the enrollee the ability to choose to move forward or not. Short contextual messages like this are far easier for users to digest and understand than the same information as presented in your privacy policy.

Create your application with this in mind: "A Medicare enrollee should never be surprised to learn how their data is being used." Your application should always collect, use, and disclose health information in ways that are consistent with user expectation and consent.

#### Giving the user control

Remember that Medicare enrollees will be sharing very sensitive personally identifiable information (PII) and protected health information (PHI) with your application. Giving enrollees the ability to take action on information presented in the UI ensures that they have complete and thoughtful control over their healthcare data. Users should also be given opportunities to opt into or revoke service, request that their data be securely and completely deleted, or otherwise control access to and retention of their data.

### Security and privacy

While developing your application, please comply with all applicable laws and industry best practices to minimize the risk of unauthorized access, use, destruction, annotation, or disclosure of Medicare enrollees' PII and PHI. If applicable to your organization and/or use case, your application's handling of PII and PHI  must also be in compliance with HIPAA regulations.

### Referring to Blue Button data

If your application allows connections to several data sources and users must search or pick from a list, please use "Medicare" as the name of the Blue Button 2.0 data source. Do not use "Blue Button," "CMS Blue Button," "Medicare.gov," or any other terminology. 

---

## Your privacy policy and terms of service

We require that organizations applying for production access to the Blue Button 2.0 API have the following documents publicly available for users to see and read:

* Privacy policy
* Terms of service

**It is vital that these documents are easy for users to read and understand.** We understand that these are legal documents, but please keep your ultimate audience in mind when reviewing your privacy policy and terms of service. Medicare enrollees, like all people, need to know that they will be protected and want to know exactly how their data will be used. 

### Privacy policy

Your privacy policy must clearly demonstrate to Medicare enrollees how you use, store, and potentially share their healthcare data. When you are applying for production access, you will need to attest that your privacy policy covers all of the requirements listed in the [Blue Button 2.0 API Terms of Service](/terms/){:target="_blank"}, so be sure you have read it and checked your privacy policy against them. 

### Privacy policy checklist

The following checklist will help you make sure that your privacy policy is complete and ready for approval by the Blue Button 2.0 API team.  

In terms that Medicare enrollees will understand, your privacy policy should specify your company's:

* Data collection practice
* User consent practice
* Data disclosure practice
* Data access practice
* Security practice
* Retention/deletion practice

Your privacy policy should be:

* Based on industry best practices
* Prominent and publicly accessible
* Easy to read, especially from the perspective of a Medicare enrollee. We encourage you to use readability checking software to estimate the reading level of your privacy policy.

Your privacy policy should detail and address:

* How your application collects and shares data:
  * If and how data is shared
  * What data is shared, and with whom
  * If data is shared with third parties, whether that is on a one-time basis, or persistently collected
  * If data is persistently collected, over what time frame it is collected for
* Any use and sharing of de-identified, anonymized or pseudonymized data
  * Some data, even if it has been anonymized, can still be used to identify people with specific medical conditions or other personal attributes. Your privacy policy should explain these risks, if applicable.
* What happens to a user's data if they revoke access to it. Do you continue to retain and use their data, or is their data securely deleted?
* Your application's policy regarding dormant or closed accounts
* How you will notify users if your app's privacy policy is updated
  * Notifications should tell the user what has changed and allow them to update their privacy settings or opt out of the service.
* If third-party vendors that you work with commit to data protection requirements that are consistent with the law and your expectations, based on the sensitivity of the personal information they will receive from you or collect on your behalf
* How you will notify users if you suffer a security or data breach, and if you will inform them of any steps they can take to protect their data in this event. The FTC's [Health Breach Notification Rule](https://www.ftc.gov/legal-library/browse/rules/health-breach-notification-rule){:target="_blank"} specifies requirements for notifying consumers following a breach involving personal health records.
* How enrollees will be notified if your company is sold and the use of their data could change

### Privacy notice

In addition to your privacy policy, you may also consider creating a separate, publicly hosted *privacy notice*. A privacy notice is an accurate, plain-language summary of the terms in your privacy policy. 

We suggest using the Office of the National Coordinator for Health Information Technology (ONC)'s [Model Privacy Notice (MPN)](https://www.healthit.gov/topic/privacy-security-and-hipaa/model-privacy-notice-mpn){:target="_blank"} template when developing your privacy notice.

### Terms of service

Your terms of service may in no way contradict, negate, or detract from the protections detailed in your privacy policy.

### Changes to your privacy policy and terms of service

Prior to rolling out any changes to your privacy policy or terms of service, you must submit drafts of the new documents and draft notification to enrollees by emailing [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov). The Blue Button 2.0 API team will review your documents and respond with feedback or approval within five business days. You may not roll out the new documents or notify enrollees of changes until you receive approval from CMS.

---

## Production access request and demo

### Production access request

When you are ready to apply for production access, send an email to [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov). The team will reply with a link to the Blue Button 2.0 production access form. We typically respond to requests within 24 business hours.

The production access form will request your privacy policy and terms of service, along with some basic information about your organization and application:

* The name of your organization
* The name of your application
* Your application's use case for Medicare enrollees
* Your application's redirect URI
* A point of contact for your organization

Fill out and submit the production access form, attaching PDF versions of your terms of service and privacy policy.

### Application demo

After you submit the production access form, we will follow up to schedule a 1-hour demo over Zoom. The demo meeting is an opportunity for you to showcase your application to the Blue Button 2.0 API team. 

You should be prepared to demonstrate a substantially complete view of the journey enrollees take using your app, including these aspects: 

* User account creation 
* User authorization to share Medicare data
* How the application displays enrollees' data
* How enrollees' data is used 
* If applicable, how the app allows enrollees to share their data with others (e.g., providers or caregivers)

You should also be ready to discuss your privacy policy and terms of service, and any security-related questions or other concerns that the Blue Button 2.0 API team may have about your application.

After the demo, the Blue Button 2.0 API team will review your application, privacy policy, and terms of service, and determine if you are ready for production access. We may follow up with you after the demo about concerns that must be addressed before issuing production credentials. In some cases, we may ask to schedule an additional demo.

### Production credentials

Once you have met any concerns raised by the team and your application is approved, we will send a link to the Blue Button 2.0 post-approval form. This form includes information about how you want your app listed in the [Medicare connected apps directory](https://www.medicare.gov/manage-your-health/medicares-blue-button-blue-button-20/blue-button-apps){:target="_blank"}. After you submit the post-approval form, we will schedule the handoff of production API credentials.
