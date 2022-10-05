---
layout: terms
title:  "Production Access User Guide"
date:   2018-02-22 09:21:12 -0500
description: "A guide to help you prepare for and understand our requirements for production access to the Blue Button 2.0 API"
badge: documentation
permalink: /guide/
sections:
- Understanding the Blue Button 2.0 API Mission
- Our Requirements for Production Access
- What does this process look like?
---
<div id="understanding-the-blue-button-2-0-api-mission"></div>
## Understanding the Blue Button 2.0 API Mission

We're pleased that you're considering applying for production access to the CMS Blue Button 2.0 API. There is a broad and growing community of third-party companies, organizations, and developers building exciting applications that empower Medicare beneficiaries with their personal health information. Our mission is to provide a developer-friendly, standards-based API that enables developers to create these amazing resources for our beneficiaries.

Another core element of our mission is making sure that Medicare beneficiaries (and their data) are protected. Our production access process and terms of service are designed to ensure that the beneficiary feels secure and that they are given the information to make informed decisions when using the Blue Button 2.0 API to share their healthcare data with third-party applications. Before you apply for production access, it is vital that you have read and understand the Blue Button 2.0 API terms of service.

This guide will help make sure you understand the requirements outlined in our terms of service, but you should always treat the terms of service as our official policy.

<a classs="ds-c-button ds-c-button--solid" href="{{ site.baseurl }}/terms/">Read Our Terms of Service</a>

## Our Requirements for Production Access

Before you apply for production access, it might be helpful for you to better understand our requirements and why they are important. Every part of this process comes from our mission to make sure Medicare beneficiaries are informed and protected. So - let's dive in!

### General Information/Questions

We'll need to know some basic information about your organization and your application. To continue delivering the best service possible to developers, it helps us to have information including (but not limited to):

- Details on your plan for timeline/release of your application
- The number of Medicare beneficiaries you plan to provide services to
- How you will market you application to Medicare beneficiaries
- Contact information for your team

Some of this information is useful to ensure an efficient roll-out of your application, but we also like to make sure that organizations are carefully marketing to Medicare beneficiaries.

### Required Resources

We require that organizations applying for production access have the following documents publicly available for users to see and read:

- Privacy Policy
- Terms of Service

We'll walk through each of these specific documents, but in general, **it is vital that these documents are easy to read and understand**. We understand that these are legal documents, and language can get complicated, but we ask that you keep your ultimate audience in mind when reviewing your privacy policy and terms of service. Medicare beneficiaries, like all people, need to know that they will be protected and want to know definitively how their data will be used. When you apply for production access, please verify the reading level of these documents to ensure that you made them as clear and readable as possible.

In cases where it may be difficult to write or update your privacy policy to be more readable, you could create a separate publicly hosted document we refer to as a Privacy Notice. A privacy notice is simply an accurate summary of the terms in your privacy policy that could be hosted and displayed prominently together.

### What We Expect From Your Privacy Policy

In general, we are looking for your privacy policy to clearly demonstrate to Medicare beneficiaries how you use, store, and potentially share their healthcare data. When you are applying for production access, you will need to attest that your privacy policy covers all of the requirements listed in the [Blue Button 2.0 API terms of service](/terms/), so be sure you have read it and checked your privacy policy against those requirements.

Here are other topics/items we'll need to see indicated in your privacy policy:

- Does your privacy policy detail if and how data is shared? What data is shared?  Is data "anonymized" or "de-identified" before it is shared? Are you communicating that clearly to users in terms they will understand?
- Give the users the full picture: if they revoke access to their data, do you continue to store their data or do you delete it?
- Do you understand that, prior to rolling out changes to your Privacy Policy or Terms of Service, you must submit drafts of the new documents and draft notification to beneficiaries by emailing [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov)? The CMS team will review your documents and respond with feedback or approval within five business days. You may not roll out the new documents or notify beneficiaries of changes until you receive approval from CMS.
- What happens if your company is sold and the use of user's data could change in a material way? Are beneficiaries and CMS notified?
  - Note: We understand that when your company is being purchased, you may have very little power over these decisions. The responsibility of informing users about material changes to the way their data is used belongs to the acquiring company. We would, however, like to see some indication of this in your privacy policy to ensure that the burden is not on the beneficiary find that out on their own.
- If your application works with third-party vendors, do your third-party vendors commit to data protection requirements that are consistent with the law and your expectations based on the sensitivity of the personal information they will receive from you or collect on your behalf?
- What happens if you suffer a security or data breach? How will you notify your users? Will you inform them of steps they can take to protect their data, if possible? Is this information clearly stated in your privacy policy?

This gives you an idea of what we are looking for in a privacy policy: that Medicare beneficiaries are prioritized, protected, and informed. Be sure to refer to our terms of service for all requirements.

### What We Expect From Your Terms of Service

While the privacy policy should be designed to protect and inform your users, your terms of service is likely designed to protect your organization from a legal perspective. The main thing that we want to see with your terms of service is that it in no way contradicts, negates or detracts from the protections detailed in your privacy policy.

### Keeping the Beneficiary Informed About Privacy

We put a lot of emphasis on your privacy policy and terms of service because they help ensure that beneficiaries (and their data) stay protected. But we also know that **privacy policies are not enough on their own**. The simple fact is that many users will click through and authorize access to their medical information without reading the complete privacy policy and terms of service. For this reason, **it is essential that you try to deliver information and context to Medicare beneficiaries in the application itself**.

For example, If a beneficiary's data is about to be shared, you could use a message, modal, or the general UI to clearly and concisely convey what is about to happen, why it is about to happen, and give the beneficiary the ability to choose to move forward or not. Short contextual messages like this are also far easier for users to digest and understand. Additionally, giving the user the ability to take action on the information ensures they have complete and thoughtful control over their healthcare data.

We like to think of it like this: "A Medicare beneficiary should never be surprised to learn how their data is being used." Create your application with that in mind. Are you taking the content of the privacy policy and presenting it to users in the application itself? Are you letting them know when their data is being shared? Are you giving them information and choice?

### User Interface and Security Practices

It is important that we understand how a Medicare beneficiary will actually interact with your application. Since Medicare beneficiaries are sharing incredibly sensitive information, we want to make sure that they are given opportunities to opt-in to service or revoke service, request that their data be deleted, etc. Please be sure to [refer to the Production Access Checklist](/checklist/) for a full list of requirements.

Here are some examples of the kinds of questions we'd like to see you answer:

- Does your user interface present the terms of service and privacy policy in a way that is clearly accessible for the user? How?
- Does the UI of your app allow the beneficiary to actively opt-in to the terms of service and privacy policy, instead of defaulting to agreement?

And similarly from the security perspective:

- Are you using industry best-practices to store and retain healthcare information? 
- How will you protect this identifiable health information?

## What does this process look like?

### 1. Review the Production Access Checklist

After you've read the [Blue Button 2.0 API Terms of Service](/terms/), take a moment to look over our [Production Access Checklist](/checklist/). Going over this document will help ensure that your application is ready for approval.

### 2. Email Our Team

Once you feel like you are ready for approval, you can send an email to [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov). Once we receive your email, we’ll schedule a brief demonstration of your application to the BB2.0 API team to introduce ourselves and better understand a beneficiary's user journey using your application. 

### 3. Application Demo

The demo meeting is an opportunity for you to showcase your application to the Blue Button 2.0 Team. We need to see a predominately completed view of the journey beneficiaries take using your application. What does account creation look like? How do they initiate the OAuth flow? How do you display their data after they've shared it? How is their data used? If there is a feature within the app that allows the user to share their data with others (i.e., a provider), show how that is executed.

### 4. Final Steps

After the in-person demo, if necessary, we will follow up with your team to address any final concerns before issuing production credentials.
