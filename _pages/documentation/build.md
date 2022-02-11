---
layout: documentation
title:  "Blue Button 2.0 API Docs"
date:   2021-06-11 09:21:12 -0500
description: Instructions for understanding and using the CMS Blue Button 2.0 v2/FHIR R4 API.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: documentation
permalink: "/documentation/build"
sections:
  - Create a sandbox account
  - Try the API
  
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

### Create a Sandbox Account
You will need to create an account to join the Developer Sandbox. Click here to [**Join the Developer Sandbox**](https://sandbox.bluebutton.cms.gov/v1/accounts/create).  Once you have verified your account, log in and click "Add an Application" from the Developer Sandbox homepage.  The process of registering an application generates a Client ID and Client Secret which you will need later to try the API using Postman, CURL, etc. as well as authorizing your application in the future.  It's okay if your actual application is not ready yet, or if some of the details of your application are not available at this time.  You can always return to edit the details of your application later.  You can also use one of the [Blue Button Sample Applications](https://bluebutton.cms.gov/resources).

### Try the API

#### Try the API Using Postman

This section describes how to use Postman to execute FHIR API calls against the BlueButton sandbox.  This section assumes you have [P](https://www.postman.com/downloads/)[ostman installed](https://www.postman.com/downloads/) and a basic working knowledge of Postman.  If you haven't already done so, create a BlueButton Sandbox account and register an application (see the [section titled "Creating a Sandbox Account"](http://localhost/) above for instructions).  Even though you'll be using Postman to query the sandbox, a registered application is necessary to obtain a client id and client secret, which are then used to configure Postman for authorization.

**Configuring Postman for Authorization**

-   In the Postman app, create a new Request tab
-   In the Request tab, click on the "Authorization" menu tab and select Type = "OAuth 2.0"
-   Under "Configure New Token", enter the information as provided in the table below (see also the screenshot below)

|**Field**|**Value** |
| --- | --- |
|Token Name:|{the name you gave your app [when registering](http://localhost/)}|
|Grant Type:|Authorization Code|
|Callback URL|"[http://localhost:3000](http://localhost:3000/)"  (or the callback URL used when registering)|
|Auth URL|*note: the trailing slash in the URLs below are required* for v1: <https://sandbox.bluebutton.cms.gov/v1/o/authorize/> for v2: [https://sandbox.bluebutton.cms.gov/v2/o/authorize](https://sandbox.bluebutton.cms.gov/v2/o/authorize/)/|
|Access Token URL|*note: the trailing slash in the URLs below are required* for v1:<https://sandbox.bluebutton.cms.gov/v1/o/token/> for v2:<https://sandbox.bluebutton.cms.gov/v2/o/token/>|
|Client ID:|{the Client ID assigned to your App in the sandbox}|
|Client Secret:|{the Client Secret assigned to your App in the sandbox}|
|Scope: |patient/Patient.read patient/Coverage.read patient/ExplanationOfBenefit.read profile|
|State:|{leave this blank}|
|Client Authentication:|Send as Basic Auth header|
{:.ds-c-table}

Confirm all settings above.  The proper settings are illustrated in the screenshot below.

---
