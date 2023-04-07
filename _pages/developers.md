---
layout: developers
title:  "Blue Button 2.0 API Docs"
date:   2021-06-11 09:21:12 -0500
description: Instructions for understanding and using the CMS Blue Button 2.0 v2/FHIR R4 API.
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: documentation
permalink: "/developers/"
sections:
  - Try the API
  - Authorization
  - Core Resources
  - Calling the API
  - Consuming the Data
  - Sample Beneficiaries
  - Production API Access
  - Developer Guidelines
  - Implementation Guides
  - STU3 vs FHIR R4 Comparison Tables
  - Additional Information
  
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

## Try the API

You can start using the API right away by following these steps:
1. Join the Developer Sandbox & register a Sandbox application
2. Generate a sample token
3. Call the API to retrieve synthetic data for a sample Patient
4. Review the response data
5. Access the synthetic dataset to try additional calls


### Step 1: Join the developer sandbox and register a sandbox application

[Create an account](https://sandbox.bluebutton.cms.gov/v1/accounts/create){:target="_blank"} to join the developer sandbox. Once you have verified your account, log in and click "Add an Application" from the Developer Sandbox homepage.

Register a new Sandbox application to get a Client ID and Client Secret. You can also use one of the [Blue Button Sample Applications](/resources).

<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/bene_auth_screen.png" alt="The OAuth screen with a choice for benes to share or withhold certain demographic information" />

You need to include at least one Callback or Redirect URL.

You can change any of this information later in My Sandbox Apps.

### Step 2: Generate a sample token

To test out the Blue Button API, you must first generate a sample token that represents a beneficiary granting consent to access their CMS Medicare claims data.

Access the Test Client to see a sample of Blue Button data.

1. If you are already logged in to the Developer portal, log out.

2. From the Sandbox homepage, click on "Test Client" in the top-level navigation.

3. Click "Get a Sample Authorization Token" if you want to call v1 API or "Get a Sample Authorization Token for v2" if want to call v2 API:<br />
<a href="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-16_15-42-0.png"><img style="width: 100%; padding:20px;" src="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-16_15-42-0.png" alt="The sample authorization token page" /></a>

1. Click the "Authorize as a Beneficiary" at the bottom to authorize<br />
<a href="{{ site.baseurl }}/assets/img/docs/v2/V2_AUTH_FORM.png"><img style="width: 100%; padding:20px;" src="{{ site.baseurl }}/assets/img/docs/v2/V2_AUTH_FORM.png" alt="v2 sample API call" /></a>

1. You will be redirected to the login page for [Medicare.gov](http://medicare.gov/){:target="_blank"}.<br />
<img style="width: 100%; padding:20px;" src="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-15_18-28-51.png?" alt="Medicare.gov login page" />

6. Log in with one of the Synthetic Beneficiary Accounts: <br />
The first synthetic beneficiary account user is `BBUser00000` with password `PW00000!` Sample users continue all the way to `BBUser29999` with password `PW29999!` _Note: the `!` at the end of the password is required._

7. Depending on your application, select either "Share all of your data" or "Share healthcare data, but not your personal info" to test your application.

8. Click "Allow" to Authorize sharing data.
<img style="width: 100%; padding: 20px;" src="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-15_18-33-13.png" alt="Medicare.gov authorization page" />

9. Review the details returned from the Authorization flow: access token and its info, patient ID, scopes associated with the token etc.<br />
<a href="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-15_18-35-16.png"><img style="width: 100%; padding:20px;" src="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-15_18-35-16.png" alt="v2 Authorization flow return" /></a>

10. Switching from v2 to v1 or vice versa, on authorization details page (step 7) there are two links:
    - "repeat this step if you need a new token" - click this link, you will be directed to authorize as a beneficiary as in step 4 and stay with your current API version.
    - "restart testclient" - click this link, you will be directed to test client home page as in step 3 and choose v1 or v2 API there.<br />
<a href="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-16_15-40-23.png"><img style="width: 100%; padding:20px;" src="{{ site.baseurl }}/assets/img/docs/v2/image2021-3-16_15-40-23.png" alt="Authorization details page displaying action items" /></a>

### Step 3: Call the API

After you obtain your Access Token, you can call the API using Postman or cURL.

To call the API using Postman:
1. From the Postman app, open a new tab

2. Paste the Request URL:
    - v1: `https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/-20140000008325`
    - v2: `https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325`

1. Click "Authorization" and select type "OAuth 2.0"

1. Click on "Get New Access Token"

2. Enter the following parameters:
    - **Token Name:** {The name of your app}
    - **Grant Type:** Authorization Code (unless you have chosen an alternate value for your app)
    - **Callback URL:** One of the redirect uris you registered for your app, for example: `http://localhost:3000`
    - **Auth URL:**
        - v1: `https://sandbox.bluebutton.cms.gov/v1/o/authorize/`
        - v2: `https://sandbox.bluebutton.cms.gov/v2/o/authorize/`
    - **Access Token URL:**
        - v1: `https://sandbox.bluebutton.cms.gov/v1/o/token/`
        - v2: `https://sandbox.bluebutton.cms.gov/v2/o/token/`
    - **Client ID:** {The Client ID assigned to your App in the sandbox}
    - **Client Secret:** {The Client Secret assigned to your App in the sandbox}
    - **Scope:** `patient/Patient.read patient/Coverage.read patient/ExplanationOfBenefit.read profile`<br />
_Note:_ When a beneficiary is authorizing your application, they will have the ability to omit the `patient/Patient.read scope`.
    - **State:** An optional value that you may use in your app
    - **Client Authentication:** Select "Send as Basic Auth header"
        - v1: `https://sandbox.bluebutton.cms.gov/v1/o/authorize/`
        - v2: `https://sandbox.bluebutton.cms.gov/v2/o/authorize/`

6. Click Request Token. You should see a pop up for your Medicare account. Log in with one of the Synthetic Beneficiary Accounts: <br />
The first synthetic beneficiary account user is `BBUser00000` with password `PW00000!` Sample users continue all the way to `BBUser29999` with password `PW29999!` _Note: the `!` at the end of the password is required._

1. Authorize sharing by clicking "Allow" on the authorization screen

2. When you return to the Postman workspace you should now be able to make requests to the API using the Access Token that will have been placed in the Header

3. Click "Send" and see the synthetic beneficiary&#39;s personal health information as a Patient FHIR Resource display under "Body" in Postman

You can also use cURL:

- v1: `curl --header "Authorization: Bearer <YOUR TOKEN HERE>" https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/-20140000008325`

- v2: `curl --header "Authorization: Bearer YOUR TOKEN HERE" https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325`

### Step 4: View the API Response

### Step 5: Access Synthetic Data

In order to access the full synthetic dataset for an individual synthetic beneficiary, you can do the following:

1. Set up your sandbox application

2. Log out of [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov/){:target="_blank"}.

3. Access the authorization URL at:<br />
v1: `https://sandbox.bluebutton.cms.gov/v1/o/authorize/`<br />
v2: `https://sandbox.bluebutton.cms.gov/v2/o/authorize/`<br />
_Note: The last backslash is important_. _Also remember to append `?client_id={your client_id}` using the client ID assigned to the application you registered._

1. You will be redirected to the Medicare authentication screen on. DO NOT ACCESS THIS PAGE DIRECTLY.

1. Log in with one of the Synthetic Beneficiary Accounts:
The first synthetic beneficiary account user is `BBUser00000` with password `PW00000!` Sample users continue all the way to `BBUser29999` with password `PW29999!` _Note: the ! at the end of the password is required._

1. Approve access for your application, which will now receive an access token, which can be used in the requests described above.

2. The authorization completes when you are redirected back to the `Redirect_URI` you specified when you registered your application.

---

## Authorization

To use the Blue Button 2.0 OAuth 2 a developer must [register their application](https://sandbox.bluebutton.cms.gov/v1/o/applications/){:target="_blank"}.

A registered application is given a Client ID and a Client Secret. The secret should only be used if it can be kept confidential, such as communication between your server and the Blue Button 2.0 API. Otherwise the [Client Application Flow](https://bluebutton.cms.gov/developers/#client-application-flow) may be used.

### Scopes

Access tokens have a scope, which defines what the access token can do and what resources it can access. For our purposes, scopes are primarily utilized to give Medicare beneficiaries more granular choice over what data they would like to share with applications. The Blue Button 2.0 API has implemented [HL7 FHIR Scopes](http://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html){:target="_blank"} to manage access to beneficiary data. They look like this:

```
patient/Patient.read

patient/Coverage.read

patient/ExplanationOfBenefit.read
```

From the OpenID Connect specification we support:
```
profile
```
This gives access to the /v1/connect/UserInfo or /v2/connect/UserInfo Endpoint.

Our OAuth screen gives beneficiaries the ability to choose whether or not to share their demographic information. **Your application will need to handle the return of a 403 status code** from the /v1/fhir/Patient (or /v2/fhir/Patient) and /v1/connect/userinfo (or /v2/connect/userinfo) endpoints.

<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/bene_auth_screen.png" alt="The OAuth screen with a choice for benes to share or withhold certain demographic information" />

If the beneficiary declines to share information that your application needs to function, you may display a message explaining why that information is needed and request reauthorization, or handle the collection of that information elsewhere within your application.

The default selection when a beneficiary reaches the authorization screen will be to share all data, including demographic data, with your application. If a beneficiary makes a selection as to whether or not they want to share demographic data with your application and later decides they want to change that selection, they&#39;ll need to be taken through the authorization flow again to make a different choice from the OAuth screen.

**Ensuring you still get the data you need**

Take the time to ensure that you have fallbacks in place if you are unable to access the patient or userinfo endpoints.

For example, if you are getting the patient_ID from the v1/fhir/Patient (or v2/fhir/Patient) endpoint, we recommend getting that identifier from the initial authorization response, or another resource like ExplanationOfBenefit or Coverage.

**Explanation of needed data to Medicare Beneficiaries**

If information limited by a scope is required for your application to properly function and it is not possible to get the information in another endpoint, we recommend providing an explanation about why certain data is needed in your user flow.

For example, if you use demographic information to help beneficiaries autofill tedious data-entry, you might want to explain that benefit before they reach the authorization screen. **It is essential, however, that you give beneficiaries the full picture.** If they do share that data with you for one-time data entry, they should know how long you keep it and if it is used for any other purposes.

**What if my application doesn&#39;t need demographic information from beneficiaries?**

As stewards of sensitive data, it is important to adopt the practice of only asking for the data that is needed to perform a service for a beneficiary. As you register or edit an application in our Sandbox, you will see an option to choose whether or not your application needs to collect demographic information from beneficiaries.

If you choose not to collect demographic information, Medicare beneficiaries will see a simplified version of the OAuth screen as they no longer need to choose whether or not they want to share that information.

### Native Mobile App Support

Native Mobile App Support follows the [RFC 8252 - OAuth 2.0 for Native Apps](https://tools.ietf.org/html/rfc8252){:target="_blank"} authentication flow utilizing the [PKCE](https://tools.ietf.org/html/rfc7636){:target="_blank"} extension and enables a custom URI scheme redirect.

The implementation of the [RFC 8252](https://tools.ietf.org/html/rfc8252){:target="_blank"} specification enables developers to build mobile applications without requiring a proxy server to route redirect calls to their mobile app.

The [PKCE](https://tools.ietf.org/html/rfc7636){:target="_blank"} extension provides a technique for public clients to mitigate the threat of a "man-in-the-middle" attack. This involves creating a secret that is used when exchanging the authorization code to obtain an access token.

[PKCE](https://tools.ietf.org/html/rfc7636){:target="_blank"} uses a code challenge that is derived from a code-verifier. The standard supports two styles of code challenge:

- plain
- S256

However, the Blue Button 2.0 API only supports the "S256" style code challenge.

Where the:
```
codechallenge = BASE64URL-ENCODE(SHA256(ASCII(codeverifier)))
```

The following additional parameters and values are sent as part of the OAuth2.0 Authorization Request:

```
- code_challenge
- codechallengemethod = "S256"
```

More details can be found about this flow on [OAuth.com](https://www.oauth.com/){:target="_blank"}. Check out this link: [Protecting Mobile Apps with PKCE - OAuth 2.0 Servers](https://www.oauth.com/oauth2-servers/pkce/){:target="_blank"}

### Registering Your App for Mobile App Support

When you register your application in the Blue Button 2.0 API Developer Sandbox, you will want to specify a unique custom URI scheme. This should be a unique value that will not conflict with other custom URI schemes implemented on a user&#39;s mobile device.

We recommend that you define your custom URI scheme using a reverse domain name notation. As we developed our own testing application, we implemented a custom URI scheme of:

```
- gov.cms.bluebutton.oauthtester
```

This equated to an oauthtester subdomain for the [bluebutton.cms.gov](https://bluebutton.cms.gov/developers) domain.

The reverse DNS style custom URI scheme should then be coupled with the re-direct path on the mobile device that will handle the call back from the Blue Button 2.0 API.

For example:

```
tld.app.subdomain[.subsubdomain]:/callback/path/endpoint
```


### Redirect_URI

When creating an Application in the sandbox a redirect URI is required. This is the API endpoint on _your_ system that receives the callback from the Blue Button 2.0 API after a beneficiary is passed to the Blue Button 2.0 API to authorize your application.

Multiple redirect URIs can be entered in the Redirect_URI field. Each entry should be separated by a space or newline.

A Redirect_URI follows this format:

```
URLprotocol://[sub-domain.]domain_name[:port]/path
```
### URL Protocol

Three URL protocols are supported, depending on the purpose:

#### http:// protocol

Environment: Sandbox only

Purpose: Typically used for local testing by using `http://localhost` 

Notes: Any domain name can be used.

#### https://protocol

Environment: Sandbox and Production

Purpose: Used for secure communication.

Notes: Required for all applications in the production environment unless the application is using the Mobile OAuth method for handling callbacks.

#### custom_url:// protocol

Environment: Sandbox and Production

Purpose: Used by mobile applications to handle communications directly with an application on a mobile device.

Notes:
If you are using Mobile OAuth support for communication directly with a mobile device the `custom_url` should follow this format:

```
Top-level.domain(TLD).domain-name[.sub-domain][.app_name]
```

For example, if the Blue Button 2.0 API team created an application we might create a custom_url of:
```
gov.cms.bluebutton.oauthtester
```

This would then be incorporated into a redirect URI entry. Here is an example:

```
gov.cms.bluebutton.oauthtester:8080//bluebutton_app/callback.html
```


### Web Application Flow

To use this flow your application should be registered with Client Type set to confidential and Grant Type set to authorization-code.

#### Request authorization from user

To allow a user to authorize your application, direct them to the Blue Button 2.0 API authorize endpoint. The request must include the response_type set to code, your application&#39;s client_id, and your application&#39;s redirect_uri. An optional state field that your application can use to identify the authorization request is recommended.

| **API version** | **Request URL** |
| --- | --- |
| v1 | `https://sandbox.bluebutton.cms.gov/v1/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=http://localhost:8080/testclient/callback&amp;response_type=code&amp;state=8e896a59f0744a8e93bf2f1f13230be5` |
| v2 | `https://sandbox.bluebutton.cms.gov/v2/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=&amp;response_type=code&amp;state=8e896a59f0744a8e93bf2f1f13230be5` |
{:.ds-c-table}

#### Exchange code for token

After visiting the authorization page a user will be redirected back to the redirect_uri registered with your application.

For example if the redirect_uri is `http://localhost:8080/testclient/callback` BlueButton will redirect with this request.

```
GET http://localhost:8080/testclient/callback?code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&amp;state=8e896a59f0744a8e93bf2f1f13230be5
```

Your application can now exchange the code provided in the redirected request for a full token. Send a POST request to the BlueButton token endpoint providing the code, the application&#39;s client_id, client_secret, and redirect_uri. Your request must also specify the grant_type which should always be authorization_code for this flow.

| **API version** | **Request URL** |
| -------- | -------- |
| v1 | `curl -X POST "https://sandbox.bluebutton.cms.gov/v1/o/token/" \ -u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:\&lt;client_secret\&gt;" \ -d "code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&amp;grant_type=authorization_code&amp;redirect_uri=http://localhost/testclient/callback"` |
| v2 |`curl -X POST "https://sandbox.bluebutton.cms.gov/v2/o/token/" \ -u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:\&lt;client_secret\&gt;" \ -d "code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&amp;grant_type=authorization_code&amp;redirect_uri=http://localhost/testclient/callback"` |
{:.ds-c-table}

Response

```
{

"access_token": "oQlduHNr09GKCU506GOgp8OarrAy2q",

"expires_in": 16768.523842,

"token_type": "Bearer",

"scope": "profile patient/Patient.read patient/ExplanationOfBenefit.read patient/Coverage.read"

"refresh_token": "wDimPGoA8vwXP51kie71vpsy9l17HN"

}
```
### Adding the STATE parameter

#### Client Application Flow

To use this flow your application should be registered with Client Type set to public and Grant Type set to implicit.

#### Request authorization from user

To use the client application flow direct the user to the Blue Button 2.0 API authorization endpoint with the response_type parameter set to token.

| **API version** | **Request URL** |
| --- | --- |
| v1 |`https://sandbox.bluebutton.cms.gov/v1/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=http://localhost:8080/testclient/callback&amp;response_type=token&amp;state=8e896a59f0744a8e93bf2f1f13230be5`|
| v2 |`https://sandbox.bluebutton.cms.gov/v2/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=http://localhost:8080/testclient/callback&amp;response_type=token&amp;state=8e896a59f0744a8e93bf2f1f13230be5` |
{:.ds-c-table}

If the user authorizes your application they will be redirected back to the redirect_uri of your application. The request will include an access token in the fragment.

#### Typescript Example
```
http://localhost:8080/testclient/callback#access_token=KCHMTX5VHNAXYGYv38eG2RLAX4hL6R&amp;expires_in=35849.875807&amp;token_type=Bearer&amp;scope=profile+patient%2FPatient.read+patient%2FExplanationOfBenefit.read+patient%2FCoverage.read&amp;state=8e896a59f0744a8e93bf2f1f13230be5
```

You can use this sample account to test your Blue Button 2.0 API OAuth implementation. This account mimics a valid Medicare account but has reduced functionality. For example, you cannot test "Forgot Password" flow.

_Jane Doe_

_Username: BBUser29999_

_Password: PW29999!_

---

## Core Resources

Base Request URL: `https://sandbox.bluebutton.cms.gov`

**FHIR Resources:**

- Explanation of Benefit
- Patient
- Coverage

**UserInfo:**

- Get User Profile from an Authorization Token

As a security measure, the beneficiary&#39;s date of birth, SSN, and HICN will not be provided by the CMS Blue Button 2.0 API.

We use [FHIR Extensions](https://www.hl7.org/fhir/extensibility.html#Extension){:target="_blank"} in our API responses.

**Explanation of Benefit FHIR Resource**

| **API version** | **Request** |
| --- | --- |
| v1 | `HTTP GET /v1/fhir/ExplanationOfBenefit/?patient=[fhir_id]` |
| v2 | `HTTP GET /v2/fhir/ExplanationOfBenefit/?patient=[fhir_id]` |
{:.ds-c-table}

The above URL returns all of the beneficiary&#39;s Explanation of Benefit (sometimes referred to as an episode of care) records as an [ExplanationOfBenefit FHIR Resource](https://www.hl7.org/fhir/explanationofbenefit.html){:target="_blank"}. The bulk of a beneficiary&#39;s data is contained within these ExplanationOfBenefit FHIR resources.

Each one can be thousands of lines long.

| **API version** | **CURL command** |
| --- | --- |
| v1 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=-20140000008325"` |
| v2 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?patient=-20140000008325"`|
{:.ds-c-table}

That API call will return an Explanation of Benefit that contains many FHIR resources and is typically thousands of lines long.

[Learn more about the Explanation of Benefits FHIR resource in the Blue Button 2.0 API](https://bluebutton.cms.gov/eob/)

Response for v1, e.g. :

```
{

"fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/carrier-22011027731",

"resource": {

"resourceType": "ExplanationOfBenefit",

"id": "carrier-22011027731",

"contained": [

{

"resourceType": "ReferralRequest",

"id": "1",

"status": "completed",

"subject": {

"reference": "Patient/-20140000008325"

},

"requester": {

"agent": {

"identifier": {

"system": "http://hl7.org/fhir/sid/us-npi",

"value": "999999999999"

}

}

},

"recipient": [

{

"identifier": {

"system": "http://hl7.org/fhir/sid/us-npi",

"value": "999999999999"

}

}

]

}

]
```

...this is only a subset of the entire output...

**Patient FHIR Resource**

| **API version** | **Request** |
| --- | --- |
| v1 | `HTTP GET /v1/fhir/Patient/[fhir_id]` |
| v2 | `HTTP GET /v2/fhir/Patient/[fhir_id]` |
{:.ds-c-table}

The above URL returns the beneficiary&#39;s demographics and other administrative information as a [Patient FHIR Resource](https://www.hl7.org/fhir/patient.html){:target="_blank"}. This information is mostly contact information, not medical data.

| **API version** | **CURL command** |
| --- | --- |
| v1 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/-20140000008325"` |
| v2 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325"` |
{:.ds-c-table}

Response for v1 e.g.:

```
{

"resourceType": "Patient",

"id": "-20140000008325",

"extension": [

{

"url": "https://bluebutton.cms.gov/resources/variables/race",

"valueCoding": {

"system": "https://bluebutton.cms.gov/resources/variables/race",

"code": "1",

"display": "White"

}

}

],

"identifier": [

{

"system": "http://bluebutton.cms.hhs.gov/identifier#bene_id",

"value": "-20140000008325"

},

{

"system": "http://bluebutton.cms.hhs.gov/identifier#hicnHash",

"value": "2025fbc612a884853f0c245e686780bf748e5652360ecd7430575491f4e018c5"

}

],

"name": [

{

"use": "usual",

"family": "Doe",

"given": [

"Jane",

"X"

]

}

],

"gender": "unknown",

"birthDate": "2014-06-01",

"address": [

{

"district": "999",

"state": "15",

"postalCode": "99999"

}

]

}
```

[Download a sample Patient FHIR Resource](https://bluebutton.cms.gov/sample-patient-entry.json)

**Coverage FHIR Resource**

| **API version** | **Request** |
| --- | --- |
| v1 | HTTP GET /v1/fhir/Coverage/?beneficiary=[fhir_id] |
| v2 | HTTP GET /v2/fhir/Coverage/?beneficiary=[fhir_id] |
{:.ds-c-table}

The above URL returns the beneficiary&#39;s Coverage information as an [Coverage FHIR Resource.](http://hl7.org/fhir/coverage.html){:target="_blank"}

| **API version** | **CURL command** |
| --- | --- |
| v1 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/?beneficiary=-20140000008325"` |
| v2 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Coverage/?beneficiary=-20140000008325"` |
{:.ds-c-table}

Response for v1 e.g.:

```
{

"fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/part-a-20140000008325",

"resource": {

"resourceType": "Coverage",

"id": "part-a-20140000008325",

"extension": [

{

"url": "https://bluebutton.cms.gov/resources/variables/ms_cd",

"valueCoding": {

"system": "https://bluebutton.cms.gov/resources/variables/ms_cd",

"code": "10",

"display": "Aged without end-stage renal disease (ESRD)"

}

},

{

"url": "https://bluebutton.cms.gov/resources/variables/orec",

"valueCoding": {

"system": "https://bluebutton.cms.gov/resources/variables/orec",

"code": "0",

"display": "Old age and survivor&#39;s insurance (OASI)"

}

},

{

"url": "https://bluebutton.cms.gov/resources/variables/esrd_ind",

"valueCoding": {

"system": "https://bluebutton.cms.gov/resources/variables/esrd_ind",

"code": "0",

"display": "the beneficiary does not have ESRD"

}

},

{

"url": "https://bluebutton.cms.gov/resources/variables/a_trm_cd",

"valueCoding": {

"system": "https://bluebutton.cms.gov/resources/variables/a_trm_cd",

"code": "0",

"display": "Not Terminated"

}

}

]
```

...this is only a subset of the entire output...

### Compress Resources for more efficient data transfers

To improve the performance when transferring large data resources it is possible to turn on compression. Gzip compression is turned off by default. Compression can be activated for the following content types:

- text/html
- text/plain
- application/json
- application/fhir+json

To activate compression add the following to the header:

Accept-Encoding: gzip

The minimum payload size we will gzip is 1 kilobyte. If the original uncompressed size of the payload is less than 1 kb, we will not apply gzip compression to our response. Therefore, developers should ensure their applications handle this scenario gracefully by checking for the **Content-Encoding: gzip** response header before trying to decompress.

[Download a sample Coverage FHIR Resource](https://bluebutton.cms.gov/sample-coverage-entry.json)

### Get User Profile for an Authorization Token

`HTTP GET /connect/userinfo`

The UserInfo Endpoint is an OAuth 2.0 Protected Resource.The above URL fetches the fictitious beneficiary&#39;s basic account information given an Authorization Token. This is most often used when creating an account within your application. An HTTP GET is called and the response is returned as JSON.

| **API version** | **CURL command** |
| --- | --- |
| v1 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v1/connect/userinfo"` |
| v2 | `curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/connect/userinfo"` |
{:.ds-c-table}

Response:

```
{

"sub": "fflinstone",

"prefered_username": "fflinstone",

"given_name": "Fred",

"family_name:, "Flinstone,

"name": "Fred Flinstone",

"email": "pebbles-daddy@example.com",

"created": "2017-11-28",

"patient": "123456789",

}
```

### More Efficient Data Queries

#### Query by Type

Many developers are interested in specific claim types, such as Prescription Drug Events (PDE). The query by type feature will allow applications to request just those claims. This will enable applications to process and download data more quickly and efficiently.

ExplanationOfBenefit resources fall into 8 types:

- Carrier Claims (CARRIER)
- Durable Medical Equipment (DME)
- Home Health Agency Claims (HHA)
- Hospice Claims (HOSPICE)
- Inpatient Claims (INPATIENT)
- Outpatient Claims (OUTPATIENT)
- Part D Events (PDE)
- Skilled Nursing Facility Claims (SNF)

By default, the FHIR API returns all of these claim types when requesting the EOB for a beneficiary. You can use the Type query parameter to request specific claim types.

For example, to request only Part D drug claims, add the query parameter:

```
?type=pde
```

To request multiple claim types, a list of comma-separated values can be given for the TYPE parameter.

If multiple codes are specified, EOBs matching all of those claim types will be returned:

| **API version** | **Request URL** |
| --- | --- |
| v1 | `/v1/fhir/ExplanationOfBenefit?patient=123&amp;type=carrier,dme,hha,hospice,inpatient,outpatient,snf` |
| v2 | `/v2/fhir/ExplanationOfBenefit?patient=123&amp;type=carrier,dme,hha,hospice,inpatient,outpatient,snf` |
{:.ds-c-table}

The full list of claim types are:

* carrier: `https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier`
* pde: `https://bluebutton.cms.gov/resources/codesystem/eob-type|pde`
* dme: `https://bluebutton.cms.gov/resources/codesystem/eob-type|dme`
* hha: `https://bluebutton.cms.gov/resources/codesystem/eob-type|hha`
* hospice: `https://bluebutton.cms.gov/resources/codesystem/eob-type|hospice`
* inpatient: `https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient`
* outpatient: `https://bluebutton.cms.gov/resources/codesystem/eob-type|outpatient`
* snf: `https://bluebutton.cms.gov/resources/codesystem/eob-type|snf`

Use lower case when requesting a claim type. If you submit an invalid combination of claim types or use the wrong case you&#39;ll see a message like this:

```
{

"detail": "not a valid value"

}
```

The status code for this message is a 400 Bad Request.

**Query by Type Examples**

In the sandbox there are synthetic beneficiaries with three of the eight claim types:

- carrier
- inpatient
- pde

Let us take a synthetic beneficiary record:

Username: `BBUser20023`
Password `PW20023!`

The FHIR ID for this beneficiary is `-20140000000024`

Let us do a regular `ExplanationOfBenefit` request:

| **API version** | **Request** |
| --- | --- |
| v1 | `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/` |
| v2 | `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/` |
{:.ds-c-table}

This bundle identifies 148 claims, returning the first 10. Here is how the start of the bundle will look:

Response for v1, e.g.:

```
{

"resourceType": "Bundle",

"id": "9562c9b7-df79-419a-a94b-ef8cc9347e0e",

"meta": {

"lastUpdated": "2019-11-05T22:05:48.257-05:00"

},

"type": "searchset",

"total": 148,

"link": [

{

"relation": "first",

"Url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit?_count=10&amp;startIndex=0&amp;patient=-20140000000024"

},
```

There are three claim types in this beneficiary&#39;s record:

- Carrier (44)
- Inpatient (1)
- PDE (103)

The queries to request each claim type individually would be:

**Carrier Claims**

| **API version** | **Request** |
| --- | --- |
| v1 | `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=carrier` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier` |
| v2 | `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=carrier` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier` |
{:.ds-c-table}

**Inpatient Claims**

| **API version** | **Request** |
| --- | --- |
| v1 | `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=inpatient` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient` |
| v2 | `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=inpatient` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient` |
{:.ds-c-table}

**PDE Claims** 

Since many of our developers are interested in the Part D drug claims it is now possible to query for only PDE-type claims.

| **API verion** | **Request** |
| --- | --- |
| v1 | `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=pde` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|pde` |
| v2 | `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=pde` <br />Or<br /> `https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|pde` |
{:.ds-c-table}

### Query by lastUpdated Field

The HL7 FHIR specification provides a [Meta](https://www.hl7.org/fhir/resource.html#Meta){:target="_blank"} section in each resource. The lastUpdated field represents the date and time of the last update. This takes the format of an "instant" type:

`YYYY-MM-DDThh:mm:ss.sss+zz:zz`

The HL7 FHIR specification also provides a `_lastUpdated` query parameter for the search operations on the end-points. By using the `_lastUpdated` query parameter, **an application will be able to request only the records that have changed before or after a specific date**. If you keep track of the date of a previous request, you can request just the changes since your previous request. The format of this request would be:

- v1: `https://sandbox.bluebutton.cms.gov/v1/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;`
- v2: `https://sandbox.bluebutton.cms.gov/v2/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;`

_Note: Do not input dates before 2020-02-12 with `_lastUpdated`. Limitations of our backend service prevent data before 2020-02-12 from being tagged correctly._

The output from that request would look like this:

| **API version** | **Request URL** |
| --- | --- |
| v1 | `/v1/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;` |
| v2 | `/v2/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;` |
{:.ds-c-table}

Response for v1, e.g.:

```
{

"resourceType": "Bundle",

"id": "7d8ff6a1-95f9-4210-b08b-58a96ea74494",

"meta": {

"lastUpdated": "2020-02-14T08:57:16.641-05:00"

},

"type": "searchset",

"total": 1,

"link": [

{

"relation": "self",

"url": "https://prod-sbx.bfdcloud.net/v1/fhir/Patient?_format=application%2Fjson%2Bfhir&amp;_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08%3A00%3A00-05%3A00"

}

],

"entry": [

{

"resource": {

"resourceType": "Patient",

"id": "-19990000000001",

"meta": {

"lastUpdated": "2020-02-13T21:53:06.017-05:00"

},

```

The BB2.0 API supports operators for less than (lt), greater than (gt), less than or equal (le), and greater than or equal (ge) the specified instant. It is also possible to specify a time interval by using two `_lastUpdated` parameters like this:

| **API version** | **Request URL** |
| --- | --- |
| v1 | `/v1/fhir/ExplanationOfBenefit?patient=Patient/-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_lastUpdated=lt2020-02-14T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir` |
| v2 | `/v2/fhir/ExplanationOfBenefit?patient=Patient/-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_lastUpdated=lt2020-02-14T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir` |
{:.ds-c-table}

### FHIR Data Model

We have mapped over 1,300 fields from the CMS Chronic Conditions Data Warehouse (CCW) into FHIR. These fields are surfaced across the Patient, Coverage and Explanation of Benefits FHIR resources.

- Beneficiary Enrollment Record
- Carrier Claims (CARRIER)
- Durable Medical Equipment (DME)
- Home Health Agency Claims (HHA)
- Hospice Claims (HOSPICE)
- Inpatient Claims (INPATIENT)
- Outpatient Claims (OUTPATIENT)
- Part D Events (PDE)
- Skilled Nursing Facility Claims (SNF)

The Blue Button 2.0 API FHIR data model leverages coding systems specific to Medicare billing forms and/or the Chronic Conditions Warehouse, FHIR and Industry Coding Systems.

For Example:

- [National Drug Code Directory](https://www.accessdata.fda.gov/scripts/cder/ndc/){:target="_blank"}
- [HL7 v3 Code System ActCode](http://hl7.org/fhir/v3/ActCode/cs.html){:target="_blank"}
- [ICD-10](https://terminology.hl7.org/4.0.0/CodeSystem-icd10CM.html){:target="_blank"}

[View the full list of Blue Button 2.0 API FHIR Data Model Coding Systems and Identifiers](https://github.com/CMSgov/bluebutton-data-server/blob/master/dev/data-model.md){:target="_blank"}

#### How Often Will New/Updated Data Be Available?

Medicare Part A, B, and D claims data will be refreshed weekly.

Our schedules may vary depending on many things like maintenance, delayed delivery of claims to the CCW data warehouse, or additional data quality processing that&#39;s needed.

We recommend you have a daily job to fetch new claims data for your users. Please be responsible with your API usage and comply with the Service Management Rights to Limit conditions in the Blue Button 2.0 API Terms of Service.

#### Synthetic Data

The CMS Blue Button 2.0 API offers a synthetic data set for developers to test against. This means that each request returns a realistic value. For example, if a patient is prescribed the diabetes medication Metformin, the associated cost and date of this prescription will be accurate.

Please note that this synthetic data set does not represent a longitudinal patient view. The claims—though representative independently—are shuffled and randomly assigned to patients. To build the synthetic data set, we selected a number of random claims, and shuffled them like a deck of cards among a group of fictitious Patient IDs. This will allow developers to test the Blue Button 2.0 API system, but could result in a patient with records for contradictory procedures.

#### Production Data

The CMS Blue Button 2.0 API has at least one claim for over 60M beneficiaries.

Today, there are approximately 38M beneficiaries in traditional or fee-for-service Medicare. The Blue Button 2.0 API has Part A/B/D data for those beneficiaries plus Part D data for some beneficiaries on Medicare Advantage plans.

Part D has always been a separate program, but certain plans include both the MA benefits (Part C) and Part D. As a result, Part D drug event data is collected separately from MA encounter data. Part D drug event data for all participants in Part D has been collected by the agency since the program began in the mid-2000s.

The API also has historical claims data going back four years. All of these factors contribute to the 53M number we use to describe the total number of beneficiaries available via the Blue Button 2.0 API.

---

## Calling the API

This section provides information on basic and common queries against the Blue Button API.  For a complete listing of Blue Button API calls, see our [Swagger documentation](https://sandbox.bluebutton.cms.gov/docs/openapi){:target="_blank"}.


### Base FHIR URLs

| Environment | Purpose | Base URL |
| -------- | -------- | -------- |
| Sandbox     | Development and Testing     | `https://sandbox.bluebutton.cms.gov/{version}/fhir/`   |
| Production | Production Data Access | `https://api.bluebutton.cms.gov/{version}/fhir/`|
{:.ds-c-table}

    Note: Use `v1` or `v2` for the  {version}
    
To find beneficiaries with varying volumes and types of data, use this [CSV of synthetic data](https://bluebutton.cms.gov/synthetic_users_by_claim_count_full.csv). Using the synthetic data, you can break down claims by type (carrier, inpatient, etc.) for each beneficiary/user combination.  Synthetic data works in both the Sandbox and Production environments.
	


### Querying Resources
A listing of common API calls are shown in the table below.  See "Base FHIR URLs" above and substitute for {baseURL} as appropriate.  
    
For a complete listing of Blue Button API calls, see our [Swagger documentation](https://sandbox.bluebutton.cms.gov/docs/openapi){:target="_blank"}.  



| Resource | Request | Description |
| -------- | -------- | -------- |
| Patient     | `HTTP GET {baseURL}/Patient`     | Returns a [bundle](https://www.hl7.org/fhir/bundle.html){:target="_blank"} of [Patient resources](https://www.hl7.org/fhir/patient.html){:target="_blank"} with one entry (one patient resource).  You can use the resource ID `Bundle.entry.resource.id`in later queries.  For synthetic data, the ID is a negative number.     |
| Patient | `HTTP GET {baseURL}/Patient/{id}` | Returns a single Patient resource.  Replace `{id}` with a valid patient resource ID.  See `/Patient` call above. |
| Coverage | `HTTP GET {baseURL}/Coverage?beneficiary={ id }`<br>OR<br>`HTTP GET {baseURL}/Coverage`| Replace `{id}` with the patient resource ID.  Returns a [bundle](https://www.hl7.org/fhir/bundle.html){:target="_blank"} of [Coverage resources](https://www.hl7.org/fhir/coverage.html){:target="_blank"} |
| Explanation of Benefit |  `HTTP GET {baseURL}/ExplanationOfBenefit?patient={ id }`<br />OR<br />`HTTP GET {baseURL}/ExplanationOfBenefit`| Replace `{id}` with patient resource ID.  Returns a [bundle](https://www.hl7.org/fhir/bundle.html){:target="_blank"} of [Explanation of Benefit resources](https://www.hl7.org/fhir/explanationofbenefit.html){:target="_blank"}.  The bundle should contain one or more EOBs. You can use the resource ID located at `Bundle.entry.resource.id` (the explanation of benefit resource ID) in later queries.  For synthetic data, the ID is typically formatted as `[claimtype]`–`[number]` Example: `carrier--10114937820` |
| Explanation of Benefit  | `HTTP GET {baseURL}/ExplanationOfBenefit/{id}` | Returns a single [Explanation of Benefit resources](https://www.hl7.org/fhir/explanationofbenefit.html){:target="_blank"}.  Replace {id} with a valid EOB resource ID.  See `/ExplanationOfBenefit` call above. |
| Capability Statement | `HTTP GET {baseURL}/metadata` | Returns the [FHIR capability statement](https://www.hl7.org/fhir/capabilitystatement.html){:target="_blank"} (Example: the FHIR features and operations supported by this server) |
| User Info | `HTTP GET {host}/{version}/connect/userinfo` | If the user grants access to access to their personal information, `UserInfo` returns name, family name and email. If the user denies access to their personal information, `UserInfo` returns `You do not have permission.` | 
{:.ds-c-table}

---

## Consuming the Data
The Blue Button API includes over 1300 data elements with a wide variety of data exchange use cases. Here are some basics to get you started with common data elements. 

For complete implementation guidance, see the [FHIR specification](http://www.hl7.org/fhir/index.html){:target="_blank"} and the [CARIN implementation guide](http://www.hl7.org/fhir/us/carin-bb/index.html){:target="_blank"}. Our [Resources page](https://bluebutton.cms.gov/resources/) also includes links to tutorials and helpful information on FHIR.

### Understanding the payload

Blue Button API [search operations](http://www.hl7.org/fhir/http.html#search){:target="_blank"} (like `/Patient`, `/ExplanationOfBenefit`, and `/ExplanationOfBenefit?patient=123`)  return data in [FHIR Bundles](http://www.hl7.org/fhir/bundle.html){:target="_blank"}. A FHIR bundle is a container resource that includes a collection of FHIR resources. You can grab each resource by looping through the `Bundle.entry` list attribute.  

[Read calls](http://www.hl7.org/fhir/http.html#read){:target="_blank"} such as `/Patient/123` return a single resource.




**FHIR `Bundle` example:**
```
{
    "resourceType": "Bundle",
    "id": "123",
    ....
    ....
    "type": "searchset",
    "total": 99,
    "entry": [
        {
            "resource": {
                "resourceType": "ExplanationOfBenefit",
                "id": "carrier--123",
                ....
            }
        }
        {
            "resource": {
                "resourceType": "ExplanationOfBenefit",
                "id": "carrier--456",
                ....
            }
        }  
    ]
}
```






### Navigating through a bundle
FHIR search results are paginated because they typically contain many records. The default is 10 records in each call. You can override the default of 10 with a _count parameter in the request. The maximum records allowed is 50.

To navigate forward and backward through the bundle, use the URLs provided in `Bundle.link`, as described in the table below. For instance, to get the next `X` records, use the URL supplied in `Bundle.link` where `relation = next`.  


| Relation    | Description |
| ----------- | ----------- |
| first       | Retrieve the first X records in the resultset |
| next        | Retrieve the next X records in the resultset |  
| previous    | Retrieve the previous X records in the resultset |  
| last        | Retrieve the last X records in the resultset |  
{:.ds-c-table}

In the example below, the `Bundle.total` attribute shows that there are 89 records in the results. However, only the first 10 records are delivered in the `Bundle.entry` array. 

For more information on Bundles and FHIR search results, see [FHIR v4.3.0 Bundle](http://www.hl7.org/fhir/bundle.html){:target="_blank"} and [FHIR v4.3.0 Managing Returned Resources](http://www.hl7.org/fhir/search.html#return){:target="_blank"}. 

 


**Bundle navigation example:**

```
"resourceType": "Bundle",
    "id": "5e5844c4-d3e2-44ca-8c87-77efccc5d60d",
    ...
    ...
    "total": 89,
    "link": [
        {
            "relation": "first",
            "url": "{host}/v2/fhir/ExplanationOfBenefit?startIndex=0&_count=10&patient=......
        },
        {
            "relation": "next",
            "url": "{host}/v2/fhir/ExplanationOfBenefit?startIndex=10&_count=10&patient=......
        },
        {
            "relation": "last",
            "url": "{host}/v2/fhir/ExplanationOfBenefit?&startIndex=.....
        },
        {
            "relation": "self",
            "url": "{host}/v2/fhir/ExplanationOfBenefit?&startIndex=.....
         }
    ],
```




### Working with identifiers
In FHIR, the difference between the `Resource.id` (resource ID) and `identifier` attributes within a resource can be confusing. 

* **Resource ID:** In the Blue Button API, the resource ID is an internal identifier from the source database, the Chronic Conditions Warehouse (CCW).  The resource ID is a system-level resource, held outside the resource.  The Resource ID is guaranteed to be unique for a particular resource and will always be limited to one value.


* **Identifier:** The identifier attribute typically provides business identifiers (or externally recognized identifiers).  In the Blue Button API, the `Patient.identifier` attribute provides the [Medicare Beneficiary ID (MBI)](https://www.cms.gov/medicare/new-medicare-card){:target="_blank"}. The MBI is the number on a beneficiary's Medicare card.

In FHIR, the identifier attribute is a list element that could supply multiple identifiers. Use [discriminators](https://www.hl7.org/fhir/profiling.html#discriminator){:target="_blank"} to distinguish between the entries to pull your desired identifier.  

For example, you can use discriminators to pull the current MBI from a Patient resource. (Beneficiaries are sometimes given new or replacement MBIs in situations such as identity theft.) In the `Patient` resource snippet below, there are two identifiers in the list. Use the following discriminators to pull the current MBI: 
- `identifier.system` = `http://hl7.org/fhir/sid/us-mbi` (ensures that the entry is an MBI)
- `identifier.type.coding[n].extension.valueCoding.code` = "current"


**Patient identifier example:**
```

"identifier": [
        {
            "system": "http://hl7.org/fhir/sid/us-mbi",
            "type": {
                "coding": [
                    {
                        "code": "MC",
                        "extension": [
                            {
                                "url": "https://bluebutton.cms.gov/resources/codesystem/identifier-currency",
                                "valueCoding": {
                                    "code": "current",
                                }
                            }
                        ]
                    }
                ]
            },
            "value": "<CURRENT MBI HERE>"
        },
        {
            "system": "http://hl7.org/fhir/sid/us-mbi",
            "type": {
                "coding": [
                    {
                        "code": "MC",
                        "extension": [
                            {
                                "url": "https://bluebutton.cms.gov/resources/codesystem/identifier-currency",
                                "valueCoding": {
                                    "code": "historic",
                                }
                            }
                        ]
                    }
                ]
            },
            "value": "<HISTORIC MBI HERE>"
        }
    ],
```


Example [FHIRPath expression](https://hl7.org/fhir/fhirpath.html){:target="_blank"}  for pulling the current MBI:

```
Patient.identifier.where(type.coding.extension('https://bluebutton.cms.gov/
resources/codesystem/identifier-currency').valueCoding.code =
'current').where(system = 'http://hl7.org/fhir/sid/us-mbi').value
```




### Working with references
The Blue Button API uses both [literal](http://www.hl7.org/fhir/references.html#literal){:target="_blank"} and [logical](http://www.hl7.org/fhir/references.html#logical){:target="_blank"} FHIR references to refer to other resources/data external to the resource.

#### Literal references

For literal references, relative URLs are provided.  In the sample EOB resource below, the `Eob.patient` attribute contains a relative URL reference, `/Patient/123`. Append this path to the base FHIR URL to perform a Patient read operation. 



Literal reference example:
```
"resource": {
    "resourceType": "ExplanationOfBenefit",
    "id": "carrier--10045426206",
    ....
    ....
    "patient": {
        "reference": "Patient/123"
    },
```


#### Contained resources
The Blue Button API also uses fragments and [contained resources](https://www.hl7.org/fhir/references.html#contained){:target="_blank"}.  A resource that does not have independent existence is embedded inside another resource as a contained resource.  For example, the Organization resource does not have its own endpoint. Instead, it is supplied as a contained resource with EOB. In the example EOB resource below, the organization resource is within the `Eob.contained` attribute, and the `Eob.provider` attribute has a `#` reference to `contained.id` (`#provider-org`).   

Contained resource example:
```
"contained": [
    {
        "active": true,
        "id": "provider-org",
        "identifier": [
            {
                "type": {
                    "coding": [
                        {
                            "code": "PRN",
                            "system": "http://terminology.hl7.org/CodeSystem/v2-0203"
....
....           
....
"provider": {
    "reference": "#provider-org"
},
```
#### Logical references
[Logical references](http://www.hl7.org/fhir/references.html#logical){:target="_blank"} typically supply a business identifier instead of a URL to an endpoint or contained resource.  

In the example below, the `Eob.careTeam.provider` attribute contains a reference to the the [National Provider Identifier (NPI)](https://npiregistry.cms.hhs.gov/){:target="_blank"} for the practitioner.  (Note: The Blue Button API  does not support a `/Practitioner` endpoint.)

Logical reference example:
```
"careTeam": [
        {
            "provider": {
                "identifier": {
                    "type": {
                        "coding": [
                            {
                                "code": "npi",
                                "display": "National Provider Identifier",
                                "system": "http://hl7.org/fhir/us/carin-bb/CodeSystem/C4BBIdentifierType"
                            }
                        ]
                    },
                    "value": "123"
                }
            },
```


### Extensions and SupportingInfo


The Blue Button API supplies many data points using [FHIR extensions](http://www.hl7.org/fhir/extensibility.html){:target="_blank"}.  Extensions are information that is not part of the basic definition of the FHIR resource. They're often very specific to a use case or situation.  For example, the Blue Button API uses extensions to supply Medicare-specific data points that are not part of the standard FHIR specification. 

All Blue Button API resources include extensions.  Extensions are like a key-value list, where the extension URL is the key. In an extension, the value attribute is defined as [Choice of Types](http://www.hl7.org/fhir/formats.html#choice){:target="_blank"}, where the data type depends on the definition of the extension.    

In the example below, there are two extensions: 
* [NCH Near Line Record Identification Code](https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd/) provides the value as a `valueCoding` type
* [Carrier or MAC Number](https://bluebutton.cms.gov/resources/variables/carr_num/)   is a `valueIdentifier`


*Note: In the Blue Button API, the extension URL points at an underlying valueset rather than the standard FHIR practice of the URL pointing to the [StructureDefinition](http://www.hl7.org/fhir/structuredefinition.html){:target="_blank"} of the extension.  This is due to historical reasons and will be revisited in future versions of Blue Button.*



Extension example:
```
"extension": [
    {
        "url": "https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd",
        "valueCoding": {
            "code": "O",
            "display": "Part B physician/supplier claim record (processed by local carriers; can include DMEPOS services)",
            "system": "https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd"
        }
    },
    {
        "url": "https://bluebutton.cms.gov/resources/variables/carr_num",
        "valueIdentifier": {
            "system": "https://bluebutton.cms.gov/resources/variables/carr_num",
            "value": "15202"
        }
    }
```

### SupportingInfo attribute
The `supportingInfo` attribute is a standard element in the FHIR EOB resource. Similar to extensions, `suportingInfo` is like a key-value list. `supportingInfo.category` serves as the key and `supportingInfo.code` is the value.   Other attributes in `supportingInfo` include `timing[x]`, `value[x]`, and `reason`.  

*Note: The [CARIN Implementation Guide](http://www.hl7.org/fhir/us/carin-bb/index.html){:target="_blank"} has chosen to use `supportingInfo` over extensions.  The CARIN IG does not define any extensions.  For historical and backwards compatibility reasons, the Blue Button API provides data in both extensions and `supportingInfo`.*

### Determining claim type
The Blue Button API supplies claims data in the [ExplanationOfBenefit resource](http://www.hl7.org/fhir/explanationofbenefit.html){:target="_blank"} for all claim types (Example: Inpatient, Outpatient, Carrier, DME, etc.)

To determine the type of a given claim, inspect the `Eob.type` attribute.  `Eob.type` is a `CodeableConcept`, which provides data as a list of codings. There are multiple entries in the list. 

Each entry is a code from a given codesystem or valueset with information about the type of claim.  For example, the `NCH_CLM_TYPE_CD` codesystem uses the code `71` for a carrier claim. The Blue Button API `eob-type` valueset uses a code of `CARRIER` for a carrier claim.  


Claim type example:
```
"type": {
    "coding": [
        {
            "code": "71",
            "display": "Local carrier non-durable medical equipment, prosthetics, orthotics, and supplies (DMEPOS) claim",
            "system": "https://bluebutton.cms.gov/resources/variables/nch_clm_type_cd"
        },
        {
            "code": "CARRIER",
            "system": "https://bluebutton.cms.gov/resources/codesystem/eob-type"
        },
        .....
        .....
    ]
},
```
For more information about determining claim types, see the following coding system reference links:
* [EOB type](https://bluebutton.cms.gov/resources/codesystem/eob-type/)
* [NCH Claim Type Code variable](https://bluebutton.cms.gov/resources/variables/nch_clm_type_cd/)
* [FHIR Claim Type value set](http://hl7.org/fhir/STU3/valueset-claim-type.html){:target="_blank"}


### Linking items
The `item` data element in the EOB resource supplies a list of entries describing products/services provided.  You can link each entry in the list to other parts of the EOB using the `item.*sequence elements`.  

For example, `Eob.item.diagnosisSequence` links to `Eob.diagnosis.sequence`, which tells you that this product/service is linked to the corresponding diagnosis.  In the partial EOB example below, the `item` is linked to diagnosis `1` and careTeam member `3`.

Linking item example:

```
"item": [
    {
        "adjudication": [
        ....
        ....
        "diagnosisSequence": [
            1
        ],
        "careTeamSequence": [
            3
        ],
        ....
        ....
    }
]
 
"diagnosis": [
    {
        "sequence": 1,
        "diagnosisCodeableConcept": {
            "coding": [
                {
                    "code": "Z0000",
                    "display": "ENCNTR FOR GENERAL ADULT MEDICAL EXAM W/O ABNORMAL FINDINGS",
        ....
        ....
    },
     
"careTeam": [
        {
            "sequence": 1
            ....
            ....
        },
        {
            "sequence": 2
            ....
            ....
        },
        {
        {
            "sequence": 3,
            "provider": {
                "identifier": {
                ....
                ....
            },
            "role": {
                "coding": [
                    {
                        "code": "performing",
                        "display": "Performing provider",
            ....
            ....       
```

---

## Sample Beneficiaries

[CSV of sample beneficiaries with rich claims data](https://bluebutton.cms.gov/synthetic_users_by_claim_count_full.csv)

When getting started with the Blue Button 2.0 API, it can be overwhelming to understand all of the coding systems and types of data that can be found in the Explanation of Benefit FHIR resource.

We have provided some hypothetical Beneficiaries to help give you a sense of what is found in Medicare Claims data.

**Meet Lucille**


Lucille is a 70-year old female. She has non-small cell lung cancer. Prior to her diagnosis, Lucille was active and had no significant health issues. She went on daily walks around her neighborhood, did yoga and made a concerted effort to eat healthy. Lucille smoked cigarettes for a few years when she was a teenager, but she quit after her father passed away from lung cancer. Her only other family history is mild hypertension on her mother’s side.

Below are some examples you may find in the Explanation of Benefit FHIR resource for Lucille.

Office Visit
```
"service": {

"coding": [{

"system": "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/index.html",

"version": "0",

"code": "99215"

Lung Biopsy

"procedureCodeableConcept": {

"coding": [{

"system": "http://hl7.org/fhir/sid/icd-9-cm",

"code": "3328"

Diagnostic Radiology

"service": {

"coding": [{

"system": "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/index.html",

"version": "0",

"code": "70553"

Radiation Therapy

"service": {

"coding": [{

"system": "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/index.html",

"version": "9",

"code": "77263"

Chemo

"service": {

"coding": [{

"system": "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/index.html",

"version": "0",

"code": "96400"
```

**Meet Jack**

Jack is a 70 year-old male with Type 2 Diabetes and high blood pressure. Jack takes daily medication and his Doctor told him he needs to lose weight. He takes Glimepiride to help control his blood sugar and previously was on Metformin.

[Learn more about "Jack" (PDF)](https://cmsgov.github.io/bluebutton-developer-help/Jack-Persona.pdf){:target="_blank"}

---

## Production API Access

In order to gain production access, an organization should start by reviewing the [Terms of Service](https://bluebutton.cms.gov/terms/), [production access user guide](https://bluebutton.cms.gov/guide/), and [checklist](https://bluebutton.cms.gov/checklist/). Once an organization believes it is fulfilling all the requirements detailed in the checklist and is adherent to the terms of service, they should email [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov) to set up a production access demonstration meeting with the CMS team.

---

## Developer Guidelines

Below are guidelines you should follow to be successful in your Blue Button 2.0 API integration.

### Your Privacy Policy

You will be asked to provide a URL to your privacy policy and terms and conditions when registering your app in the Blue Button 2.0 API Developer Portal. These links should be easy to access and understand by a beneficiary using your app. Consider using the [Model Privacy Notice](https://www.healthit.gov/topic/privacy-security-and-hipaa/model-privacy-notice-mpn){:target="_blank"}.

### Rate Limiting and Data Refresh

Medicare Part A, B, and D claims data will be refreshed weekly.

Our schedules may vary depending on many things like maintenance, delayed delivery of claims to the CCW data warehouse, or additional data quality processing that&#39;s needed.

We recommend you have a daily or weekly job to fetch new claims data for your users. Please be responsible with your API usage and comply with the Service Management Rights to Limit conditions in the [Blue Button 2.0 API Terms of Service](https://bluebutton.cms.gov/terms/).

### Use of the Blue Button 2.0 API Logo

The Blue Button 2.0 API logo and usage guidelines is detailed [here](https://www.healthit.gov/topic/health-it-initiatives/blue-button/logo-and-usage){:target="_blank"}.

### Beneficiary Revoking Access

A beneficiary may revoke access to your application via the Medicare website. When you encounter an invalid token indicating a beneficiary has revoked access, you should make a reasonable attempt to handle that case making it easy for the beneficiary to understand what is happening with their Medicare data.

"Medicare is unable to retrieve your data at this time due to an internal issue. Our team is aware of the issue and is working to resolve it. Please try again at a later time. We apologize for any inconvenience."

If you or your users encounters this error message, know that our team is aware of the issue and is working to resolve it as quickly as possible.

---

## Implementation guides

### HL7 FHIR Common Payer Consumer Data Set (CPCDS)

[Implementation Guide: Version 1.0.0, Date 2020-11-23](http://hl7.org/fhir/us/carin-bb/){:target="_blank"}


This IG describes the CARIN Alliance Blue Button 2.0 Framework and Common Payer Consumer Data Set (CPCDS), providing a set of resources that payers can exchange with third-parties to display to consumers via a FHIR-based API. This IG will help Medicare, Medicaid, CHIP, BHP standard health plans, and QHP issuers on the FFEs share adjudicated claims and encounter data via the Patient Access API discussed in section II.A. of this proposed rule. It includes data elements and coding instructions each impacted payer can use to prepare and share the specified data.

### HL7 FHIR CARIN - v2 Artifacts Summary

[Implementation Guide: Version 1.0.0, Date 2020-11-23](https://build.fhir.org/ig/HL7/carin-bb/artifacts.html#4){:target="_blank"}

The purpose of this IG is to outline the different artifacts released by CARIN for v2. The artifacts contain code explanations and benefits for the different EOB Profiles.

### HL7 FHIR CARIN – BlueButton GitHub IG
 
[Github Version 0.1.13, Date 2020-11-23
](https://github.com/HL7/carin-bb/){:target="_blank"} 

This implementation guide describes the CARIN Blue Button® Framework and Common Payer Consumer Data Set (CPCDS), providing a set of resources that payers can display to consumers via a FHIR API.

---

## STU3 vs FHIR R4 Comparison Tables

See also the [version transforms](https://www.hl7.org/fhir/r3maps.html){:target="_blank"} and the note about [version specific extensions](https://www.hl7.org/fhir/versions.html#extensions){:target="_blank"}. (This analysis is available as [XML](https://www.hl7.org/fhir/fhir.diff.xml){:target="_blank"} or [JSON](https://www.hl7.org/fhir/fhir.diff.json){:target="_blank"} from HL7 (note: this includes all R4 data).

---

## Additional Information
**Migrating to v2/FHIR R4 FAQ**
- [Frequently Asked Questions about the V2 API transition for Blue Button 2.0 API (BB2.0)](https://github.com/CMSgov/beneficiary-fhir-data/wiki/Migrating-to-V2-FAQ){:target="_blank"}
 
**Where can you find the latest information?**

Join the Google Groups for any APIs you access for the most up to date information:

- [Blue Button 2.0 (BB2.0)](https://groups.google.com/g/developer-group-for-cms-blue-button-api){:target="_blank"}
- [Beneficiary Claims Data API (BCDA)](https://groups.google.com/forum/#!forum/bc-api){:target="_blank"}
- [Data at the Point of Care (DPC)](https://groups.google.com/forum/#!forum/dpc-api){:target="_blank"}
- [Medicare Claims Data to Part D Sponsors (AB2D)](https://groups.google.com/g/ab2d-api){:target="_blank"}

---
