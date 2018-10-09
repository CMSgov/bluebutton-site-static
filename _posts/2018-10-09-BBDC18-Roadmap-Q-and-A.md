---
layout: post
title: BBDC18 Roadmap Q&A
date:  2018-10-09 10:30 AM -0600
categories: latest general
permalink: /blog/:title
badge: blog
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
# Roadmap Q&A
Over the past several weeks the Blue Button 2.0 team had been reviewing 
feedback from our developer community about new features you would like 
to be added to the API.
 
To address your comments more globally, we intend to add your feedback 
and our answers to a new Q&A section of our documentation site at 
https://bluebutton.cms.gov. In the meantime, rather than wait on the 
addition of a Q&A section to our site we wanted to give you the latest 
information as soon as possible.

In this blog post we will answer questions raised thus far.

## Q: Will test accounts be added to the Production API so I don't have to bug my In-laws to help me with testing?
**A: Yes**.  We are adding a pool of synthetic beneficiaries and their claims from the 
sandbox environment to our production API. This means that when your app is approved 
for production access you can use the synthetic beneficiary accounts to validate your 
app in production. Stay tuned, this will be announced in a future blog post.

## Q: Will we add Medicaid data to the Blue Button 2.0 API? 
**A:**  At this time we have no plans to add Medicaid data to the Blue Button 2.0 API.
 
## Q: Blue Button currently only includes the National Drug Code for a drug. Will descriptions be added to explain these codes?
**A: Yes**.  We are in the process of adding drug code descriptions to the Blue Button 2.0 API.

## Q: Will descriptions for HCPC and CPT be added to the Blue Button 2.0 API?
**A: Yes**.  We are in the process of adding NDC code descriptions to the 
Blue Button 2.0 API.  These descriptions will be located in each FHIR 
Coding element’s “display” field and will include the drug’s proprietary
name and its substance name.

## Q: Will descriptions for other coding systems be added to the Blue Button 2.0 API?
**A: Yes**.  Once we complete work on adding the National Drug Code we plan 
to move on to add brief human-readable descriptions for some of the other 
coding systems used in the Blue Button API’s claims data. This includes: 
ICD diagnosis and procedure codes, HCPCS Level I and Level II codes, 
and perhaps others.

## Q: How can provenance of data transferred by the Blue Button API be assured?
**A:**  The Blue Button Team is committed to building a Developer-friendly, standards-based API. 
As such we would like to see a common industry-solution to data provenance.  
There are some examples that could be followed. The Veterans Administration in 
conjunction with the US Post Office did some work to apply a checksum to data received. 
This type of method could be considered for wider adoption. 

As always, we value your [feedback](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) 
on our Google Group support forum as we continue working to improve the Blue Button 2.0 API.  

If you have questions, or comments, let us know.


---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
