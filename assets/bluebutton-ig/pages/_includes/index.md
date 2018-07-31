## {{site.data.fhir.igName}} Implementation Guide
{:.no_toc}

{% include_relative _includes/ci-publish-box.html %}


<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

## Introduction

Blue Button 2.0 from CMS is an API that contains four years of Medicare Part A, B and D data for 53 million Medicare beneficiaries.
This data reveals a variety of information about a beneficiary's health, including type of Medicare coverage, drug prescriptions, primary care treatment and cost. Beneficiaries also have full
control over how their data can be used and by whom, with identity and authorization controlled by MyMedicare.gov.
The Centers for Medicare and Medicaid Services (CMS) Blue Button API enables Medicare beneficiaries to connect their Medicare claims data to the applications, services, and research programs they
trust.

The CMS Blue Button API:

* Enables a developer to register a beneficiary-facing application
* Enables a beneficiary to grant an application access to four years of their Part A, B, and D claims data
* Uses the [HL7 FHIR] standard for beneficiary data and the [OAuth 2.0] standard for beneficiary authorization

For more information see the [CMS Blue Button 2.0]

## FHIR Data Model

We have mapped over 1,300 fields from the CMS claims data warehouse into FHIR. These fields are surfaced across the Patient, Coverage and Explanation of Benefits FHIR resources.
The Blue Button API FHIR data model leverages coding systems specific to Medicare billing forms and/or the Chronic Conditions Warehouse, FHIR and Industry Coding Systems.

For Example:

* [National Drug Code Directory]
* [HL7 v3 Code System ActCode]
* [ICD-10]

[View the full list of Blue Button API FHIR Data Model Coding Systems and Identifiers]

## Blue Button Profiles

The list of Blue Button Profiles is shown below. Each profile defines the minimum mandatory elements, extensions and terminology requirements that MUST be present. For each profile requirements
and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with
references to appropriate terminologies and examples. In addition each profile has a "Quick Start" section which is intended as an implementer friendly overview of the required search and read
operations.

{% include_relative _includes/list-ballot-profiles.xhtml %}

[HL7 FHIR]:https://www.hl7.org/fhir/
[OAuth 2.0]:https://oauth.net/2/
[CMS Blue Button 2.0]:https://bluebutton.cms.gov/
[National Drug Code Directory]:https://www.accessdata.fda.gov/scripts/cder/ndc/
[HL7 v3 Code System ActCode]:http://hl7.org/fhir/v3/ActCode/cs.html
[ICD-10]:http://hl7.org/fhir/terminologies-systems.html#http://hl7.html
[View the full list of Blue Button API FHIR Data Model Coding Systems and Identifiers]:https://github.com/CMSgov/bluebutton-data-server/blob/master/dev/data-model.md
[logical view]:http://hl7.org/fhir/formats.html#table
