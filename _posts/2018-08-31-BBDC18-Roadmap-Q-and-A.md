---
layout: post_with_category
title: BBDC18 Roadmap Q&A
date:  2018-08-30 10:30 AM -0600
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
On August 13th the inaugural Blue Button Developer Conference took place at the White House
Eisenhower Executive Office Building (EEOB). One of the sessions was a Roadmap session 
where the Blue Button 2.0 Team laid-out some of 
the near term objectives for improvements to the Blue Button 2.0 API.  
However, the more important part of the session was an opportunity to hear from our 
developer community about the features that you all would like to see in the API.

<img src="/assets/img/blog/bbdc18.png" alt="#BBDC18" width="100%" />

Our plan is to add the feedback and our answers to a new Q&A section of our documentation 
site at [https://bluebutton.cms.gov](https://bluebutton.cms.gov). In the meantime, 
rather than wait on the addition of a Q&A section to our site we wanted to give you 
the latest information as soon as possible.

In this blog post we will answer many of the questions raised at the Blue Button Developer 
Conference Roadmap session.

## Q: Will test accounts be added to the Production API so I don't have to bug my In-laws to help me with testing?
A: Yes - We are adding a pool of synthetic beneficiaries and their claims from the 
sandbox environment to our production API. This means that when your app is approved 
for production access you can use the synthetic beneficiary accounts to validate your 
app in production. Stay tuned, this will be announced in a future blog post.

## Q: Will we add Medicaid data to the Blue Button 2.0 API? 
A: At this time we have no plans to add Medicaid data to the Blue Button 2.0 API. 
Medicaid programs are managed at the state level and the Blue Button 2.0 API requires a 
beneficiary to be able to authenticate in order to authorize sharing of their data. 
Medicaid, as a state administered program would require that state agency to 
provide the authentication service to enable beneficiaries to control the sharing of their 
data.

## Q: Will Drug Codes include descriptions?
A: Yes -  We are in the process of adding drug code descriptions to the Blue Button 2.0 API.

## Q: Will descriptions for HCPC and CPT be added to the Blue Button 2.0 API?
A: Yes - After adding National Drug Code descriptions we plan to move on to add descriptions 
for diagnosis and other codes, namely HCPC and CPT codes.

## Q: How can provenance of data transferred by the Blue Button API be assured?
A: The Blue Button Team is committed to building a Developer-friendly, standards-based API. 
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
