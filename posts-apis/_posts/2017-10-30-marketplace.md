---
layout: post
title:  "Marketplace API"
date:   2017-10-30 09:21:12 -0500
description: Develop applications with health insurance plans, providers, and coverage information for issuers on the exchange, using the API that powers HealthCare.gov.
landing-page: live
permalink: marketplace-api/
gradient: "cherry-tangerine-background"
subnav-link-gradient: "cherry-tangerine-link"
badge: api
sections:
  - Overview
  - Getting started
  - Use cases
  - Support
ctas:
  -
    title: View the documentation
    link: https://marketplaceapicms.docs.apiary.io/#reference/geography/get-a-state-by-abbreviation
---

## Overview

The Marketplace API delivers data that helps users find and evaluate health care insurance plans, providers, and coverage information on the marketplace. It is used by [HealthCare.gov](https://www.healthcare.gov/) and other third party services.

#### Data types available through the Marketplace API include:
- Affordable Care Act (ACA) plan benefit and rating data from issuers on the exchange
- Doctor, facility, and drug coverage for ACA plans
- Out-of-pocket-cost utilization data as calculated on behalf of CMS
- Medicaid and the Children’s Health Insurance Program (CHIP) eligibility estimate data

#### Why would I use this API?
Rather than loading from a static data source (like PUF or QHP Landscape files), applications that use the Marketplace API can get live changes as soon as they are available on [HealthCare.gov](https://www.healthcare.gov/). This will allow you to keep your plan data up to date and in sync with the Marketplace, ensuring your users are making the most up-to-date choice for them.

Please note: the Marketplace API is designed to support live access by front-end applications, and is not designed to be scraped or for the whole data set to be extracted.

#### Who can use the Marketplace API?
API keys for the Marketplace API are currently available to CMS partners who participate in the Issuer Technical Workgroup. CMS expects to make API keys more widely available in 2018.

#### How do I get access to the Marketplace API?
You must be a CMS partner in the Issuer Technical Workgroup to request access. You can request access here: [Marketplace API Key Request](https://cmsgov.forms.fm/marketplace-api-api-key-request)

---

## Getting started

Documentation for Marketplace API is available on Apiary:  
[Marketplace API Documentation](http://docs.marketplaceapicms.apiary.io/)

---

## Use cases

#### Powering [HealthCare.gov](https://www.healthcare.gov/)
The Marketplace API drives the [Window Shop](www.healthcare.gov/see-plans) and Plan Compare products on [HealthCare.gov](https://www.healthcare.gov/). Window Shop allows users to preview plans and prices before starting the application and enrollment process, while Plan Compare is where users will select the final plan they’d like to enroll in. These products allow users to see which plans are available to them based on their location and household makeup, view which of these plans cover their specific providers and drugs, and calculates their estimated total yearly costs based on their estimated health care use levels.

#### Third Party Adoption
Direct Enrollment partners like [ACA Express](https://www.acaexpress.com/) and [eHealth](https://www.ehealthinsurance.com/) use the Marketplace API to power their health insurance enrollment applications.


#### You can use Marketplace API to:
- [Get eligibility estimates](https://marketplaceapicms.docs.apiary.io/reference/household-eligibility/get-estimates/get-estimates)
- [Determine estimated out-of-pocket costs based on health care utilization levels](https://marketplaceapicms.docs.apiary.io/reference/household-eligibility/out-of-pocket-cost-estimate/out-of-pocket-cost-estimate)
- View which marketplace plans cover specific [providers](https://marketplaceapicms.docs.apiary.io/reference/drug-&-provider-coverage/get-a-list-of-whether-a-set-of-providers-are-covered-by-given-plans/get-a-list-of-whether-a-set-of-providers-are-covered-by-given-plans) and [drugs](https://marketplaceapicms.docs.apiary.io/reference/drug-&-provider-coverage/get-a-list-of-whether-drugs-are-covered-by-plans/get-a-list-of-whether-drugs-are-covered-by-plans)
- [View and compare details of marketplace plans](https://marketplaceapicms.docs.apiary.io/reference/plans/get-plans/get-plans)
- [Enter a current plan ID to see the crosswalked plan for the upcoming year and compare](https://marketplaceapicms.docs.apiary.io/reference/plans/crosswalk/crosswalk)

---

## Support

Send any support requests or questions to:  
<marketplace-api@cms-provider-directory.uservoice.com>
