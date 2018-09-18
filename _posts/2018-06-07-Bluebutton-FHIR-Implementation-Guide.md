---
layout: post
title: Blue Button 2.0 Implementation Guide
date:   2018-06-07 09:00:00 -0500
categories: latest
permalink: /blog/:title
badge: blog
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
The Blue Button team is continually working to improve the Blue Button 2.0 API and the supporting documentation. When
the API was announced at HIMSS in March 2018 it created a lot of interest. That interest came not just from developers
wanting to connect to the API and work with the data it contains, but also from other organizations around the 
healthcare industry, such as insurers and Medicaid agencies. For the latter category of technologists there is significant 
interest in how The Blue Button team built the Fast Healthcare Interoperability Resource (FHIR) records that hold the 
beneficiaries' data.

## FHIR Implementation Guides

FHIR is as much a community as it is a specification. The community shares information about how a solution has been
built by creating an **Implementation Guide**. The Blue Button Team has created a FHIR Implementation Guide to 
document how we have used FHIR resources in the API.

## Resources and Profiles

When the FHIR community creates FHIR Resources they are designed to be flexible enough to allow them to be used in many
different systems across the world. When it comes to implementing a FHIR Resource, a community such as US Payers, may agree
to a more tightly defined implementation of the **Resource**. This may make particular fields mandatory and may require specific
code sets be used. e.g. ICD-10, SNOMED etc. This tighter definition of FHIR Resources are called **profiles**. Profiles can also 
include extensions (specially coded additional fields and values).  

## Blue Button 2.0 Implementation Guide

A draft of the Blue Button 2.0 Implementation Guide (BB2IG) is now available as part of the 
[Blue Button Developer Documentation](https://bluebutton.cms.gov) site.

We are integrating the Implementation Guide into the documentation. If you want to get a preview of the guide check 
this link: [Blue Button 2.0 Implementation Guide](/assets/ig/index.html).

## What is in the Implementation Guide?

The BB2IG documents structure definitions for the following resources:

<li><a href="/assets/ig/StructureDefinition-bluebutton-patient-claim.html">Blue Button Patient Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-carrier-claim.html">Blue Button Carrier Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-dme-claim.html">Blue Button DME Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-hha-claim.html">Blue Button HHA Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-hospice-claim.html">Blue Button Hospice Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-inpatient-claim.html">Blue Button Inpatient Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-outpatient-claim.html">Blue Button Outpatient Claim Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-pde-claim.html">Blue Button Part D Event Profile</a></li>
<li><a href="/assets/ig/StructureDefinition-bluebutton-snf-claim.html">Blue Button SNF Claim Profile</a></li>

We welcome feedback on this guide. As always head over to the [Google Developer Group for Blue Button 2.0 API](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api) and 
leave us your comments.   

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest

[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
