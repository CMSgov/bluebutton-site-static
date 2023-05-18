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
  - Overview 
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

## Overview

Blue Button 2.0 (BB2.0) API enables software developers to build trusted applications, services, and research programs that benefit Medicare enrollees. As a [standards-based API](#technical-specifications-and-standards), BB2.0 provides claims data for more than 64 million people with Medicare.

### Data

BB2.0 API includes more than 20 billion Medicare Part A, B and D claims going back to 2014\. 

* Part A: Institutional claims (Example: services received at the hospital)
* Part B: Professional or carrier claims (Example: primary care visits)
* Part D: Prescription drug claims (Example: when a prescription was filled)

Note: Blue Button 2.0 API does not provide Medicare Part C claims (Medicare Advantage). However, if a Medicare Advantage enrollee has a Part D plan, the API includes those claims.

### Use Cases

BB2.0 API data is valuable for any organization interested in innovating with claims data from over 64 million Medicare enrollees. The API serves a variety of use cases and we encourage you to explore ways to use BB2.0 API data to support Medicare enrollees in making healthcare decisions. 

Examples of current use cases include:

#### Personal health data aggregators

Digital health applications can use BB2.0 to give Medicare enrollees a more comprehensive view of their health data. Access to personal health data can make Medicare enrollees more aware of their health conditions, helping them communicate more effectively with their providers. Research shows that thirty percent of  Medicare enrollees have 2 or 3 chronic conditions and see 5 or more physicians annually.1 Helping Medicare enrollees gather their health information in one place makes it easier for them to coordinate care across providers and may minimize redundant procedures.

#### Insurance plan finders

BB2.0 API data can help filter insurance plan options based on a Medicare enrollee's specific health history and needs. Medicare enrollees can use insurance plan finder tools directly or Medicare brokers can use these tools to advise patients on the best plan options.

For example, with BB2.0 you can: 

* Use claims and utilization data to make personalized recommendations for new plan options.
* Estimate prescription costs to optimize Medicare plan guidance.
* Check if a Medicare enrollee's current providers are in-network for various plan options.

#### Clinical research studies

Organizations conducting healthcare research and clinical trials often require participants to fill out long forms or regularly submit data over the course of the study. Medicare enrollees can authorize a research study to automatically pull their claims data with BB2.0, reducing the need for manual data entry.

#### Health record sharing

BB2.0 API can make it easy for Medicare enrollees to share their health data with doctors, pharmacies, caregivers, and others. 

You can use BB2.0 to:

* Integrate BB2.0 data with Electronic Health Records (EHR) systems to import current health information.
* Allow patients to share health information like current medications, lab results, and medical imaging with providers..
* Give caregivers an accurate picture of a Medicare enrollee's health data to facilitate care coordination and communication with providers.

For other examples of how applications use the Blue Button 2.0 API, visit the [Blue Button app directory on Medicare.gov](https://www.medicare.gov/manage-your-health/medicares-blue-button-blue-button-20/blue-button-apps).

### Technical Specifications and Standards 

The Blue Button 2.0 API is a RESTFul API, based on the HL7 FHIR standard and the CARIN Consumer Directed Payer Data Exchange Implementation Guide. It supplies data in JSON format, and uses the OAuth 2.0 protocol for authorization.

* [HL7 FHIR Standard](http://www.hl7.org/fhir/index.html)
* [CARIN Consumer Directed Payer Data Exchange Implementation Guide](http://www.hl7.org/fhir/us/carin-bb/index.html)
* [OAuth 2.0 protocol](https://oauth.net/)
* [RESTful API Overview](https://restfulapi.io/)

### Versions

We currently support 2 BB2.0 API versions:

#### Version 2 

BB2.0 Version 2 (V2) is based on [FHIR release (R4)](http://hl7.org/fhir/R4/) and the [CARIN CDPDE Implementation Guide (Carin for Blue Button)](http://hl7.org/fhir/us/carin-bb/STU1.1/) and was released in July 2021\. To learn about migrating to BB2.0 V2, go to [Migrating to V2 FAQ](https://github.com/CMSgov/beneficiary-fhir-data/wiki/Migrating-to-V2-FAQ)

#### Version 1 

Version 1 (V1) is the original Blue Button API, based on [FHIR release 3 (STU3)](http://hl7.org/fhir/STU3/). Development on V1 is limited to bug fixes and basic maintenance. If you're developing a new app, use V2\. For information about BB2.0 V1, see the [V1 Documentation](https://bluebutton.cms.gov/v1/). 

### Environments

We currently maintain production and sandbox environments for developing with the BB2.0 API. For technical information about our environments, see [Base FHIR URLs](https://docs.google.com/document/d/1Ktw_lgOsqZRopJCTV8krJ2W5zjxNoeolxFcHQJje0zw/edit#heading=h.ikw2u81euyqi). 

#### Sandbox

Develop your application using our sandbox environment. It provides access to synthetic Medicare enrollee data and includes all the same endpoints, resource types, and parameters as production. You can complete all of the same operations in the sandbox as in the production environment.

It's helpful to know that:

* Sandbox credentials will not work in production. 
* While we strive to provide a synthetic data set relevant to most use cases, our synthetic data set is not as comprehensive as production data.

To get started in the developer sandbox, [create an account](https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login).

#### Production

Once your development is nearing completion, get access to live data in our production environment by following the instructions in our [production access user guide](https://bluebutton.cms.gov/guide/). After you complete the requirements in the production access guide and your app is approved, we'll give you credentials for the production environment.

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

3. Click "Get a Sample Authorization Token for v2."<br />
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

2. Paste the Request URL: `https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325`

1. Click "Authorization" and select type "OAuth 2.0"

1. Click on "Get New Access Token"

2. Enter the following parameters:
    - **Token Name:** {The name of your app}
    - **Grant Type:** Authorization Code (unless you have chosen an alternate value for your app)
    - **Callback URL:** One of the redirect uris you registered for your app, for example: `http://localhost:3000`
    - **Auth URL:**`https://sandbox.bluebutton.cms.gov/v2/o/authorize/`
    - **Access Token URL:** `https://sandbox.bluebutton.cms.gov/v2/o/token/`
    - **Client ID:** {The Client ID assigned to your App in the sandbox}
    - **Client Secret:** {The Client Secret assigned to your App in the sandbox}
    - **Scope:** `patient/Patient.read patient/Coverage.read patient/ExplanationOfBenefit.read profile`<br />
_Note:_ When a beneficiary is authorizing your application, they will have the ability to omit the `patient/Patient.read scope`.
    - **State:** An optional value that you may use in your app
    - **Client Authentication:** Select "Send as Basic Auth header" `https://sandbox.bluebutton.cms.gov/v2/o/authorize/`

6. Click Request Token. You should see a pop up for your Medicare account. Log in with one of the Synthetic Beneficiary Accounts: <br />
The first synthetic beneficiary account user is `BBUser00000` with password `PW00000!` Sample users continue all the way to `BBUser29999` with password `PW29999!` _Note: the `!` at the end of the password is required._

1. Authorize sharing by clicking "Allow" on the authorization screen

2. When you return to the Postman workspace you should now be able to make requests to the API using the Access Token that will have been placed in the Header

3. Click "Send" and see the synthetic beneficiary&#39;s personal health information as a Patient FHIR Resource display under "Body" in Postman

You can also use cURL:

~~~
curl --header "Authorization: Bearer <YOUR TOKEN HERE>" https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325`
~~~
    
### Step 4: View the API Response

### Step 5: Access Synthetic Data

In order to access the full synthetic dataset for an individual synthetic beneficiary, you can do the following:

1. Set up your sandbox application

2. Log out of [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov/){:target="_blank"}.

3. Access the authorization URL at:<br /> `https://sandbox.bluebutton.cms.gov/v2/o/authorize/`<br />
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
This gives access to the  '/v2/connect/UserInfo' endpoint.

Our OAuth screen gives beneficiaries the ability to choose whether or not to share their demographic information. **Your application will need to handle the return of a 403 status code** from the `/v2/fhir/Patient` and `/v2/connect/userinfo` endpoints.

<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/bene_auth_screen.png" alt="The OAuth screen with a choice for benes to share or withhold certain demographic information" />

If the beneficiary declines to share information that your application needs to function, you may display a message explaining why that information is needed and request reauthorization, or handle the collection of that information elsewhere within your application.

The default selection when a beneficiary reaches the authorization screen will be to share all data, including demographic data, with your application. If a beneficiary makes a selection as to whether or not they want to share demographic data with your application and later decides they want to change that selection, they&#39;ll need to be taken through the authorization flow again to make a different choice from the OAuth screen.

**Ensuring you still get the data you need**

Take the time to ensure that you have fallbacks in place if you are unable to access the patient or userinfo endpoints.

For example, if you are getting the patient_ID from the `v2/fhir/Patient` endpoint, we recommend getting that identifier from the initial authorization response, or another resource like `ExplanationOfBenefit` or `Coverage`.

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

~~~
https://sandbox.bluebutton.cms.gov/v2/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=&amp;response_type=code&amp;state=8e896a59f0744a8e93bf2f1f13230be5 
~~~
#### Exchange code for token

After visiting the authorization page a user will be redirected back to the `redirect_uri` registered with your application.

For example if the redirect_uri is `http://localhost:8080/testclient/callback`, BlueButton will redirect with this request.

```
GET http://localhost:8080/testclient/callback?code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&amp;state=8e896a59f0744a8e93bf2f1f13230be5
```

Your application can now exchange the code provided in the redirected request for a full token. Send a POST request to the BlueButton token endpoint providing the code, the application&#39;s `client_id`, `client_secret`, and `redirect_uri`. Your request must also specify the `grant_type` which should always be `authorization_code` for this flow.

Request:
~~~
curl -X POST "https://sandbox.bluebutton.cms.gov/v2/o/token/" \ -u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:\&lt;client_secret\&gt;" \ -d "code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&amp;grant_type=authorization_code&amp;redirect_uri=http://localhost/testclient/callback"
~~~

Response:

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

To use the client application flow direct the user to the Blue Button 2.0 API authorization endpoint with the `response_type` parameter set to token.

~~~
https://sandbox.bluebutton.cms.gov/v2/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&amp;redirect_uri=http://localhost:8080/testclient/callback&amp;response_type=token&amp;state=8e896a59f0744a8e93bf2f1f13230be5
~~~

If the user authorizes your application they will be redirected back to the `redirect_uri` of your application. The request will include an access token in the fragment.

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

### FHIR Resources

- Explanation of Benefit
- Patient
- Coverage

### UserInfo

- Get User Profile from an Authorization Token

As a security measure, the beneficiary's date of birth, SSN, and HICN will not be provided by the CMS Blue Button 2.0 API.

We use [FHIR Extensions](https://www.hl7.org/fhir/extensibility.html#Extension){:target="_blank"} in our API responses.

### Explanation of Benefit FHIR Resource

Request:

~~~
HTTP GET /v2/fhir/ExplanationOfBenefit/?patient=[fhir_id]
~~~

This request returns claims as [ExplanationOfBenefit Resources](https://hl7.org/fhir/R4/explanationofbenefit.html){:target="_blank"} inside a [FHIR Bundle](http://hl7.org/fhir/R4/bundle.html){:target="_blank"}. The response is typically thousands of lines long.

Example response excerpt:

~~~
{
    "resourceType": "Bundle",
    "id": "b50fafb4-e82e-4a4f-9d4b-1caf83e82807",
    "meta": {
        "lastUpdated": "2022-02-14T17:27:56.303-05:00"
    },
    "type": "searchset",
    "total": 99,
    "entry": [
        {
            "resource": {
                "resourceType": "ExplanationOfBenefit",
                "id": "carrier--10045426206",
                "meta": {
                    "lastUpdated": "2021-06-07T21:51:33.787-04:00",
                    "profile": [
                        "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-ExplanationOfBenefit-Professional-NonClinician"
                    ]
                },
                "identifier": [
                    {
                        "type": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/us/carin-bb/CodeSystem/C4BBIdentifierType",
                                    "code": "uc",
                                    "display": "Unique Claim ID"
                                }
                            ]
                        },
                        "system": "https://bluebutton.cms.gov/resources/variables/clm_id",
                        "value": "-10045426206"
                    },
	.....

~~~

### Patient FHIR Resource

~~~
HTTP GET /v2/fhir/Patient/[fhir_id]
~~~


The above URL returns demographic and other administrative information as a [Patient FHIR Resource](http://hl7.org/fhir/R4/patient.html){:target="_blank"}. This information is mostly contact information, not medical data.

Request:
~~~
curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325"`
~~~

Example response excerpt:

~~~
{
    "resourceType": "Patient",
    "id": "-19990000000002",
    "meta": {
        "lastUpdated": "2021-06-07T21:50:48.132-04:00",
        "profile": [
            "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-Patient"
        ]
    },
    "identifier": [
        {
            "type": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                        "code": "MC",
                        "display": "Patient's Medicare number"
                    }
                ]
            },
            "system": "http://hl7.org/fhir/sid/us-mbi",
            "value": "2S00A00AA00",
            "period": {
                "start": "2020-01-01"
            }
        }
    ],
    "name": [
        {
            "use": "usual",
            "family": "Doe",
            "given": [
                "John",
                "X"
            ]
        }
    ],
    "gender": "male",
    "birthDate": "1999-06-01",
    "deceasedDateTime": "1981-03-17",
    "address": [
        {
            "state": "07",
            "postalCode": "99999"
        }
    ]
}

~~~

[Download a sample Patient FHIR Resource](https://bluebutton.cms.gov/sample-patient-entry.json)

### Coverage FHIR Resource

~~~
HTTP GET /v2/fhir/Coverage/?beneficiary=[fhir_id]
~~~

The above URL returns Coverage information as [Coverage resources](http://hl7.org/fhir/R4/coverage.html) inside a [FHIR Bundle](http://hl7.org/fhir/R4/bundle.html).  One coverage resource is supplied for each coverage type. Example: Part-A, Part-B

Request:
~~~
curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Coverage/?beneficiary=-20140000008325"`
~~~

Response excerpt:
~~~
{
    "resourceType": "Bundle",
    "id": "fb4bffd7-abb3-401f-96cd-d617c545092c",
    "meta": {
        "lastUpdated": "2022-02-14T17:27:56.303-05:00"
    },
    "type": "searchset",
    "total": 4,
    "entry": [
        {
            "resource": {
                "resourceType": "Coverage",
                "id": "part-a--19990000000002",
                "meta": {
                    "lastUpdated": "2021-06-07T21:50:48.132-04:00",
                    "profile": [
                        "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-Coverage"
                    ]
                },
                "status": "active",
                "type": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                            "code": "SUBSIDIZ"
                        }
                    ]
                },
                "subscriberId": "2S00A00AA00",
                "beneficiary": {
                    "reference": "Patient/-19990000000002"
                },
                .....
	       
~~~

### Compress Resources for more efficient data transfers

To improve the performance when transferring large data resources it is possible to turn on compression. Gzip compression is turned off by default. Compression can be activated for the following content types:

- text/html
- text/plain
- application/json
- application/fhir+json

To activate compression add the following to the header:
~~~
Accept-Encoding: gzip
~~~

The minimum payload size we will gzip is 1 kilobyte. If the original uncompressed size of the payload is less than 1 kb, we will not apply gzip compression to our response. Therefore, developers should ensure their applications handle this scenario gracefully by checking for the **Content-Encoding: gzip** response header before trying to decompress.

[Download a sample Coverage FHIR Resource](https://bluebutton.cms.gov/sample-coverage-entry.json)

### Get User Profile for an Authorization Token

~~~
HTTP GET /connect/userinfo
~~~

The UserInfo Endpoint is an OAuth 2.0 Protected Resource.The above URL fetches the fictitious beneficiary&#39;s basic account information given an Authorization Token. This is most often used when creating an account within your application. An HTTP GET is called and the response is returned as JSON.

Request:
~~~
curl --header "Authorization: Bearer <AUTHORIZATION TOKEN>" "https://sandbox.bluebutton.cms.gov/v2/connect/userinfo"`
~~~

Response:

~~~
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
~~~

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

~~~
/v2/fhir/ExplanationOfBenefit?patient=123&amp;type=carrier,dme,hha,hospice,inpatient,outpatient,snf
~~~

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

#### Query by Type Examples

In the sandbox there are synthetic beneficiaries with three of the eight claim types:

- carrier
- inpatient
- pde

Let us take a synthetic beneficiary record:

Username: `BBUser20023`
Password `PW20023!`

The PATIENT ID for this beneficiary is `-20140000000024`

Let us do a regular `ExplanationOfBenefit` request:

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/
~~~

This bundle identifies 151 claims, returning the first 10. Here is how the start of the bundle will look:

~~~
{
   "resourceType": "Bundle",
   "id": "4a475183-4763-4ee1-b90d-1d23908a11f5",
   "meta": {
      "lastUpdated": "2022-02-14T17:27:56.303-05:00"
   },
   "type": "searchset",
   "total": 151,
   "link": [
      {
         "relation": "first",
         "url": "https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit?_format=application%2Fjson%2Bfhir&startIndex=0&_count=10&patient=-20140000000024"
      }
      ....
~~~

There are three claim types in this record:

- Carrier (44)
- Inpatient (1)
- PDE (103)

The queries to request each claim type individually would be:

##### Carrier Claims

~~~ 
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=carrier 
~~~

or

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier
~~~

##### Inpatient Claims

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=inpatient` 
~~~

or

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient
~~~

##### PDE Claims

Since many of our developers are interested in the Part D drug claims it is now possible to query for only PDE-type claims.

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=pde` 
~~~

or

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|pde
~~~

### Query by lastUpdated Field

The HL7 FHIR specification provides a [Meta](https://www.hl7.org/fhir/resource.html#Meta){:target="_blank"} section in each resource. The lastUpdated field represents the date and time of the last update. This takes the format of an "instant" type:

`YYYY-MM-DDThh:mm:ss.sss+zz:zz`

The HL7 FHIR specification also provides a `_lastUpdated` query parameter for the search operations on the end-points. By using the `_lastUpdated` query parameter, **an application will be able to request only the records that have changed before or after a specific date**. If you keep track of the date of a previous request, you can request just the changes since your previous request. The format of this request would be:

~~~
https://sandbox.bluebutton.cms.gov/v2/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;
~~~

_Note: Do not input dates before 2020-02-12 with `_lastUpdated`. Limitations of our backend service prevent data before 2020-02-12 from being tagged correctly._

The output from that request would look like this:

Request URL:

~~~
/v2/fhir/Patient?_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir&#39;
~~~

Example response excerpt:

~~~
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

"url": "https://prod-sbx.bfdcloud.net/v2/fhir/Patient?_format=application%2Fjson%2Bfhir&amp;_id=-19990000000001&amp;_lastUpdated=gt2020-02-13T08%3A00%3A00-05%3A00"

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

~~~

The BB2.0 API supports operators for less than (lt), greater than (gt), less than or equal (le), and greater than or equal (ge) the specified instant. It is also possible to specify a time interval by using two `_lastUpdated` parameters like this:

~~~
/v2/fhir/ExplanationOfBenefit?patient=Patient/-19990000000001&amp;_lastUpdated=gt2020-02-13T08:00:00-05:00&amp;_lastUpdated=lt2020-02-14T08:00:00-05:00&amp;_format=application%2Fjson%2Bfhir`
~~~

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
| Sandbox     | Development and Testing     | `https://sandbox.bluebutton.cms.gov/v2/fhir/`   |
| Production | Production Data Access | `https://api.bluebutton.cms.gov/v2/fhir/`|
{:.ds-c-table}

    
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




FHIR `Bundle` example:

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

 


Bundle navigation example:

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


Patient identifier example:
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

### Meet Lucille


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

### Meet Jack

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

### Migrating to v2/FHIR R4 FAQ
- [Frequently Asked Questions about the V2 API transition for Blue Button 2.0 API (BB2.0)](https://github.com/CMSgov/beneficiary-fhir-data/wiki/Migrating-to-V2-FAQ){:target="_blank"}
 
### Where can you find the latest information?

Join the Google Groups for any APIs you access for the most up to date information:

- [Blue Button 2.0 (BB2.0)](https://groups.google.com/g/developer-group-for-cms-blue-button-api){:target="_blank"}
- [Beneficiary Claims Data API (BCDA)](https://groups.google.com/forum/#!forum/bc-api){:target="_blank"}
- [Data at the Point of Care (DPC)](https://groups.google.com/forum/#!forum/dpc-api){:target="_blank"}
- [Medicare Claims Data to Part D Sponsors (AB2D)](https://groups.google.com/g/ab2d-api){:target="_blank"}

---
