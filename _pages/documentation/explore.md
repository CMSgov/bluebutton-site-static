---
layout: documentation
title:  "Blue Button 2.0 API Docs"
date:   2021-06-11 09:21:12 -0500
description: Instructions for understanding and using the CMS Blue Button 2.0 v2/FHIR R4 API.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: documentation
permalink: "/documentation/explore"
sections:
  - Understanding the data
  - Check Out Some Data
  
ctas:
  -
    title: Developer Sandbox
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login
---

<div class="ds-c-alert">
	<div class="ds-c-alert__body">
		<h2 class="ds-c-alert__heading">This is the FHIR R4 (v2) documentation for the Blue Button API.</h2>
		<p class="ds-c-alert__text">
			If needed, <a href="/v1/">documentation for the STU3 (v1) implementation</a> of the Blue Button API is available. 
		</p>
	</div>
</div>

### Understanding the data

#### Overview

The Blue Button API provides claims data for over 60 million Medicare beneficiaries.  The data is provided using the [FHIR standard](http://www.hl7.org/fhir/index.html), and is supplied primarily in three FHIR resources: **Explanation of Benefit** (EOB), **Patient**, and **Coverage**:

-   The [Explanation of Benefit](http://www.hl7.org/fhir/explanationofbenefit.html) resource is the primary vehicle that provides claims data. The EOB resource contains the lines within an episode of care, including where and when the service was performed, the diagnosis codes, the provider who performed the service, and the cost of care. 
-   The [Patient](http://www.hl7.org/fhir/patient.html) resource type is where you get your information about who your beneficiaries are, their demographic information, and updates to their patient identifiers.  
-   The [Coverage](http://www.hl7.org/fhir/coverage.html) resource type provides information about the beneficiaries' insurance coverage, including information about dual coverage.  

The source of the data is the [CMS Chronic Conditions Data Warehouse (CCW)](https://www2.ccwdata.org/web/guest/home).  Over 1300 CCW fields have been mapped into the equivalent data elements in the FHIR standard. The API provides data for the following claim types:

-   Carrier Claims (CARRIER)
-   Durable Medical Equipment (DME)
-   Home Health Agency Claims (HHA)
-   Hospice Claims (HOSPICE)
-   Inpatient Claims (INPATIENT)
-   Outpatient Claims (OUTPATIENT)
-   Prescription Drug Events - part D (PDE)
-   Skilled Nursing Facility Claims (SNF)

[Download sample resources](http://localhost/) in JSON format.

The Blue Button API supplies data that is codified using several different terminology and coding systems, defined by various standards bodies, along with locally defined CMS coding systems 

For Example:

-   [ICD-10](https://www.cms.gov/Medicare/Coding/ICD10)
-   [HCPCS](https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo)
-   [CPT Codes](https://www.cms.gov/Medicare/Fraud-and-Abuse/PhysicianSelfReferral)
-   [National Drug Code Directory](https://www.accessdata.fda.gov/scripts/cder/ndc/)
-   [HL7 v3 Code System ActCode](http://hl7.org/fhir/v3/ActCode/cs.html)
-   [CMS Claim Type](https://bluebutton.cms.gov/resources/codesystem/eob-type/)

[Click here to view a complete list of Blue Button Coding Systems and Identifiers](https://github.com/CMSgov/bluebutton-data-server/blob/master/dev/data-model.md)

The Blue Button API also provides data in FHIR Extensions (custom data elements that are not found in the FHIR standard).

---
