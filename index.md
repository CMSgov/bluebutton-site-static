---
layout: home
title:  "Blue Button 2.0"
date:   2017-10-30 09:21:12 -0500
description: A developer-friendly, standards-based API that enables Medicare beneficiaries to connect their claims data to the applications, services and research programs they trust.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: api
sections:
  - Overview
  - Getting started
  - Value and Use Cases
  - Support
ctas:
  -
    title: View the documentation
    link: /developers
  -
    title: Sign up for the Developer Sandbox
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/create
  -
    title: Register an application
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login

---

<!-- <div>
	<a class="bb-c-card default-card" href="{{ site.baseurl }}/blog/ensuring-beneficiary-privacy-and-security-through-new-application-onboarding-requirements.html">
		<div class="card-title">
			We've got exciting updates to share.
		</div>
		<div class="card-image" style="background-image: url('/assets/img/home/terms-announcement-graphic.svg')">
		</div>
		<div class="card-description">
			We’ve made some updates to our production access process and Terms of Service. These updates are designed to make our process more clear and understandable, while also doing more to ensure Medicare beneficiaries are protected.
		</div>
	</a>
</div> -->

<div class="ds-c-alert ds-c-alert--warn">
    <div class="ds-c-alert__body">
      <h3 class="ds-c-alert__heading">Important Announcement</h3>
      <p class="ds-c-alert__text">
			We have disabled access to the Blue Button 2.0 API temporarily while we investigate a technical issue. A limited number of people who use Blue Button 2.0 apps might have had their private Medicare information shared with the wrong user or app. You can <a href="{{ site.baseurl }}/blog/bbapi-update.html">find more information on the technical issue here</a>. CMS will be reaching out to all applications with production access to Blue Button 2.0 individually with more information. 
			<br />
			<br />
			CMS will be sending a letter to all affected Medicare beneficiaries with more information and actions to take. Medicare beneficiaries can also call CMS at 1-800-MEDICARE to learn more.
      </p>
    </div>
  </div>
 
## Overview

Blue Button 2.0 from CMS is an API that contains four years of Medicare Part A, B and D data for 53 million Medicare beneficiaries.

This data reveals a variety of information about a beneficiary’s health, including type of Medicare coverage, drug prescriptions, primary care treatment and cost. Beneficiaries also have full control over how their data can be used and by whom, with identity and authorization controlled by MyMedicare.gov.

Blue Button 2.0 uses the [HL7 FHIR standard](https://www.hl7.org/fhir/) for beneficiary data and the [OAuth 2.0 standard](https://oauth.net/2/) for beneficiary authorization.

---

## Getting started

You can get started on building your integration with the Blue Button API by following these steps:

- [Read the Developer Docs](/developers)
- [Join the Developer Sandbox](https://sandbox.bluebutton.cms.gov/v1/accounts/create)
- [Register Your Application](https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login)
- [Request Production API Access](https://bluebutton.cms.gov/developers/#production-api-access)
- [Ask a Question](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api)

---

## Value and Use Cases

Developers integrate with the Blue Button API adding value for beneficiaries, providers, care organizations, researchers and many more across Healthcare and Life Sciences to:

**_Reduce patient burden_**

A research organization can pre-populate a medication lists for a patient during clinical trial enrollment.

**_Streamline information about different kinds of care over time_**

A primary care physician can access information on other patient care (e.g. related to behavioral health) to better inform treatment.

**_Uncover new insights that can improve health outcomes_**

A pharmacy can determine if a beneficiary gets healthier over time due to medication adherence.

**_Access and monitor health information in one place_**

A health application can aggregate data into a health dashboard for beneficiaries.

---

## Support

The Blue Button 2.0 Google Group is where developers can ask questions, find answers, leave feedback and share experiences using the API. [Visit the Blue Button Google Group.](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api)
