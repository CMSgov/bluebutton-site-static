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
  - Explore the API
  - Getting started in the developer sandbox
  - Authorization
  - Understanding the data
  - Calling the API
  - Consuming the data
  - Optimizing your application
  - Production API access
  - Implementation guides
  
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

Digital health applications can use BB2.0 to give Medicare enrollees a more comprehensive view of their health data. Access to personal health data can make Medicare enrollees more aware of their health conditions, helping them communicate more effectively with their providers. Research shows that thirty percent of  Medicare enrollees have 2 or 3 chronic conditions and see 5 or more physicians annually.<a href="#footnote-1"><sup>1</sup></a> Helping Medicare enrollees gather their health information in one place makes it easier for them to coordinate care across providers and may minimize redundant procedures.

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
* Allow patients to share health information like current medications, lab results, and medical imaging with providers.
* Give caregivers an accurate picture of a Medicare enrollee's health data to facilitate care coordination and communication with providers.

For other examples of how applications use the Blue Button 2.0 API, visit the [Blue Button app directory on Medicare.gov](https://www.medicare.gov/manage-your-health/medicares-blue-button-blue-button-20/blue-button-apps).

### Access to Medicare enrollee data

#### Scope of access

Applications receive permission to access Medicare enrollee data on a per-user basis. Access to claims data for each individual enrollee begins after they grant access to an application via the BB2.0 API's authorization flow. 

Medicare enrollees may always opt to omit personal data such as name, date of birth, race, and gender when granting access to claims data. An enrollee's choice during the BB2.0 authorization flow determines the [scope](#scopes) of access an application will have to their data. 

#### Duration of access

The length of time that an application can continue to pull new claims data from Medicare depends on the application's use case and category. The BB2.0 API team determines your application's access duration category during the [production access process](https://bluebutton.cms.gov/guide/){:target="_blank"}. 

There are 3 categories for data access duration:

<table class="ds-c-table">
  <thead>
    <tr>
      <th><strong>Category</strong></th>
      <th><strong>Description and notes</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>10&nbsp;hours</td>
      <td>One-time use apps (Example: An app that pulls an enrollee’s data once to recommend insurance plans)<ul><li>These apps do not usually require separate logins or store users’ data over time.</li><li>Authorization will be granted for 10 hours, without the ability to refresh the token.</li><li>If an enrollee uses the app more than once, they must reauthorize for each data pull.</li></ul></td>
    </tr>
    <tr>
      <td>13&nbsp;months</td>
      <td>Apps that pull data for the enrollee’s use on an ongoing basis (Example: A personal health aggregator app.) <ul><li>Authorization will be granted for 13 months.</li><li>For continued access after 13 months, an app must prompt the user to reauthorize.</li></ul></td>
    </tr>
    <tr>
      <td>Research</td>
      <td>Apps that facilitate Institutional Review Board (IRB)-regulated clinical research studies <ul><li>Access to an enrollee’s data will never expire unless revoked by the enrollee or by the BB2.0 team due to app inactivity over a period of time.</li><li>Research apps will be reviewed every 2 years to ensure that they are still active.</li><li>If a research app is not active at a 2-year check-in, we will contact the app team for confirmation that they still need BB2.0 API access.</li><li>If you have a research app, please keep us updated on changes to your contact information and watch for emails from BlueButtonAPI@cms.hhs.gov.</li></ul></td>
    </tr>
  </tbody>
</table>

### Technical Specifications and Standards 

The Blue Button 2.0 API is a RESTful API, based on the HL7 FHIR standard and the CARIN Consumer Directed Payer Data Exchange Implementation Guide. It supplies data in JSON format, and uses the OAuth 2.0 protocol for authorization.

* [HL7 FHIR Standard](http://www.hl7.org/fhir/index.html){:target="_blank"}
* [CARIN Consumer Directed Payer Data Exchange Implementation Guide](http://www.hl7.org/fhir/us/carin-bb/index.html){:target="_blank"}
* [OAuth 2.0 protocol](https://oauth.net/){:target="_blank"}
* [RESTful API Overview](https://restfulapi.net/){:target="_blank"}

### Versions

We currently support 2 BB2.0 API versions:

#### Version 2 

BB2.0 Version 2 (V2) is based on [FHIR release (R4)](http://hl7.org/fhir/R4/){:target="_blank"} and the [CARIN CDPDE Implementation Guide (Carin for Blue Button)](http://hl7.org/fhir/us/carin-bb/STU1.1/){:target="_blank"} and was released in July 2021\. To learn about migrating to BB2.0 V2, go to [Migrating to V2 FAQ](https://github.com/CMSgov/beneficiary-fhir-data/wiki/Migrating-to-V2-FAQ)

#### Version 1 

Version 1 (V1) is the original Blue Button API, based on [FHIR release 3 (STU3)](http://hl7.org/fhir/STU3/){:target="_blank"}. Development on V1 is limited to bug fixes and basic maintenance. If you're developing a new app, use V2\. For information about BB2.0 V1, see the [V1 Documentation](https://bluebutton.cms.gov/v1/). 

### Environments

We currently maintain production and sandbox environments for developing with the BB2.0 API. For technical information about our environments, see [Base FHIR URLs](#base-fhir-urls). 

#### Sandbox

Develop your application using our sandbox environment. It provides access to synthetic Medicare enrollee data and includes all the same endpoints, resource types, and parameters as production. You can complete all of the same operations in the sandbox as in the production environment.

It's helpful to know that:

* Sandbox credentials will not work in production. 
* While we strive to provide a synthetic data set relevant to most use cases, our synthetic data set is not as comprehensive as production data.

To get started in the developer sandbox, [create an account](https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login){:target="_blank"}.

#### Production

Once your development is nearing completion, get access to live data in our production environment by following the instructions in our [production access user guide](https://bluebutton.cms.gov/guide/){:target="_blank"}. After you complete the requirements in the production access guide and your app is approved, we'll give you credentials for the production environment.

---

## Explore the API

### Test client

The Blue Button 2.0 API test client is a quick, no-code-required way to explore data returned from our API endpoints.

Before you begin: If you're logged in to the sandbox, log out to use the test client.  

1. Go to the [Blue Button 2.0 API test client](https://sandbox.bluebutton.cms.gov/testclient/){:target="_blank"}.
2. Choose a sample authorization token option. We recommend choosing the "Get an Authorization Token of v2 (PKCE enabled)" option. This option references our current codebase and Proof Key for Code Exchange (PKCE) is recommended for improved security. For more information on PCKE see [Proof Key for Code Exchange (PKCE) extension usage](#proof-key-for-code-exchange-pkce-extension-usage).
3. Click **Authorize as a Beneficiary**.
4. Log in to Medicare.gov using a [synthetic user's account credentials](#authenticating-as-a-synthetic-user).
5. Choose a Privacy Option setting.
6. Click **Allow**.  

Once you're logged in as a Medicare enrollee, you'll get an access token and you can make calls to different endpoints and see the sample data that is delivered in the response.

<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/test-client.png" alt="Blue Button 2.0 API test client" />

### Sample data

If you want to see a sample of the data available in the Blue Button 2.0 API without authenticating a synthetic user or creating a sandbox account, you can download a sample file. This [zip folder of JSON files]({{ site.baseurl }}/assets/zip/bb_sample_data_bbuser29999.zip) contains synthetic data for a single Medicare enrollee. The download includes 3 FHIR resources in JSON format:

1. A single [Patient](http://www.hl7.org/fhir/patient.html){:target="_blank"} resource
2. A [FHIR bundle](http://www.hl7.org/fhir/bundle.html){:target="_blank"} containing multiple [ExplanationOfBenefit](http://www.hl7.org/fhir/explanationofbenefit.html){:target="_blank"} resources (EOB)
3. A [FHIR bundle](http://www.hl7.org/fhir/bundle.html){:target="_blank"} containing multiple [Coverage](http://www.hl7.org/fhir/coverage.html){:target="_blank"} resources

To learn more about Blue Button 2.0 API data, refer to [Understanding the Data](#understanding-the-data).

--- 

## Getting started in the developer sandbox

To get started integrating with the Blue Button 2.0 API, you'll need to register a sandbox application. You don't need a working application at this point, but you need to define basic settings to generate client credentials for testing purposes.   

### 1\. Register an application in the developer sandbox

1. Go to the [Sandbox Dashboard](https://sandbox.bluebutton.cms.gov/home){:target="_blank"}. (If you don't already have an account, create one.)
2. Click [Add an Application](https://sandbox.bluebutton.cms.gov/v1/o/applications/register/){:target="_blank"}.

### 2\. Enter application details

When you add or edit a sandbox application, you'll enter various required configuration details.

<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/register-new-application.png" alt="New application registration screen" />

#### Application Name

The name of your sandbox application. 

#### OAuth Client Type

The Blue Button 2.0 API only supports confidential client type. 

#### Authorization Grant Type 

The Blue Button 2.0 API only supports the authorization code grant type. An authorization code is a random string generated by the authorization server and returned to the application as part of the authorization response.

#### Callback URLs / Redirect URIs 

This is an API endpoint on your system that receives the callback after a user successfully authorizes your application to access their Medicare data. To enter multiple URIs in the **Callback URLs / Redirect URIs** field, separate each entry with a space or new line.   

Sample format: `URIscheme://[sub-domain.]domain_name[:port]/path`

#### Does my application need to collect beneficiary demographic data?

This setting determines 2 things:

* What [scopes](#scopes) are applied to your application (determines which API calls your application can execute).
* The information and options displayed on the authorization screen Medicare enrollees use to allow or deny your application access to their data.

| **Setting** | **Description** |
| -------- | -------- |
| Yes | Allows your application to request access to a Medicare enrollee's claims data AND personal information such as name, date of birth, race and gender. (Scopes: `patient/Patient.read`, `patient/Coverage.read`, `patient/ExplanationOfBenefit.read`, `profile`)<br><br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/demographic-info-yes.png" alt="Authorization screen with demographic info option" />|
| No | Allows your application to request access to the `patient/Coverage.read` and `patient/ExplanationOfBenefit.read` scopes.<br><br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/demographic-info-no.png" alt="Authorization screen without demographic info option" />|
{:.ds-c-table}

To learn more about scopes and permissions, visit [Authorization](#authorization).

### 3\. Save your application

Click **Save Application**.  

After you register your sandbox application, you'll get a Client ID and Client Secret.

* Client ID: an alphanumeric string used to identify your application. Use this in your code when you call the Blue Button 2.0 API.
* Client Secret: an alphanumeric string used by your application to authenticate with the Blue Button server.  

Note: Client credentials from the developer sandbox only work in the sandbox environment. To get production credentials, you need to complete the [production access requirements](#production-api-access) and be approved.  

### 4\. Test the API with Postman or cURL

Once you've created a Blue Button 2.0 sandbox application, you can start making requests. The instructions in this section will get you up and running quickly with Postman or cURL.

#### Postman

[Postman](https://www.postman.com/){:target="_blank"} is a widely used API client. To start making Blue Button 2.0 API sandbox calls in Postman, follow the steps shown below.  

1. Configure your Sandbox application to work with Postman:
    1. Log into the [Blue Button 2.0 Sandbox](https://sandbox.bluebutton.cms.gov/){:target="_blank"}.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-01.png" alt="Sandbox login button" />
    2. Click **View/Edit App** for the app you want to use with Postman.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-02.png" alt="View/Edit App link" />
    3. Click **Edit Application**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-03.png" alt="Edit Application button" />
    4. Enter the following URLs into the **Callback URLs / Redirect URIs** field, separated by a carriage return.
        - `https://oauth.pstmn.io/v1/callback`
        - `https://oauth.pstmn.io/v1/browser-callback`<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-04.png" alt="Callback URLs / Redirect URIs field, populated with callback URLs listed text" />
    5. Click **Save Application**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-05.png" alt="Save Application button" />
2. Download the [Blue Button 2.0 API Sandbox Postman collection](/assets/developer-resources/CMS-BlueButton-2.0-API-Sandbox.postman_collection.json) and import it into the Postman desktop or web application. 
    - To import the collection, either click the **Import** button in Postman and select the collection file, or drag the file into the Postman window. 
3. Select the top-level folder in the collection, **CMS BlueButton 2.0 API Sandbox**.
4. Select the **Variables** tab.
5. Copy your application's **Client ID** and **Client Secret** from your Sandbox account into both the **Initial Value** and **Current Value** cels for the corresponding Postman variables, `clientId` and `clientSecret`.
6. After copying and pasting your API credentials, log out of the Blue Button sandbox in your browser. Being logged into the sandbox can cause errors during authorization in Postman.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-12.png" alt="Sandbox Logout button" />
7. In Postman, select the **Authorization** tab.
8. Click **Get New Access Token**.
9. A Medicare.gov login window will open. Enter the username and password for a [synthetic sandbox user account](#authenticating-as-a-synthetic-user) (e.g., user = "BBUser00000" and password = "PW00000!"), and click **Log in**.<br><img src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-10.png" alt="Medicare login window" />
10. Click **Connect**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-11.png" alt="Connect button" />
11. When the **Manage Access Tokens** window appears, click **Use Token**. You may also give your token a name.
12. Make any desired Blue Button 2.0 API calls from the endpoints listed under the **Patient**, **Explanation of Benefit**, and **Coverage** folders. For example, to retrieve explanation of benefits information for the authenticated patient:
    1. Select the **Explanation of Benefits** folder, then **GET Search Explanation of Benefits**.
    2. Click **Send**.
    3. The API will return a FHIR bundle with explanation of benefits information.

#### cURL

You can also call the  Blue Button 2.0 sandbox with [cURL](https://curl.se/){:target="_blank"}, a popular command-line HTTP client.

First, obtain an access token. To test using your sandbox application, you can use [Postman](#postman) to retrieve a token with your client ID and secret, as shown in the previous section. Alternately, you can get a sample authorization token from the Blue Button 2.0 Test Client as shown in the following steps:  

1. Navigate to the [Blue Button 2.0 API Test Client](https://sandbox.bluebutton.cms.gov/testclient/){:target="_blank"}.
2. If you are currently logged into the Blue Button 2.0 sandbox, click **Log Out to Continue**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-06.png" alt="Log Out to Continue button" />
3. Click **Get a Sample Authorization Token for v2**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-07.png" alt="Get a Sample Authorization for V2 button" />
4. Click **Authorize as a Beneficiary**.<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-08.png" alt="Authorize as a Beneficiary button" />
5. A Medicare login screen will open. Enter the username and password for a [synthetic sandbox user account](#authenticating-as-a-synthetic-user) (e.g., user = "BBUser00000" and password = "PW00000!"), and click **Log in**.<br><img src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-10.png" alt="Medicare login window" />
6. Click **Connect**.<br><img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-11.png" alt="Connect button" />
7. A new page will open. Copy the access token from the JSON shown under **Step 1: Sample Authorization** for use in your cURL command.<img style="width: 100%;" src="{{ site.baseurl }}/assets/img/docs/v2/bb-postman-09.png" alt="JSON object with access token highlighted" />

Once you have an access token, you can start making API calls with cURL. For example, the following command will retrieve insurance coverage information for the authenticated patient (replace `<YOUR ACCESS TOKEN>` with your actual access token):  

~~~
curl --location "https://sandbox.bluebutton.cms.gov/v2/fhir/ExplanationOfBenefit/" --header "Accept: application/json" --header "Authorization: Bearer <YOUR ACCESS TOKEN>"
~~~

### 5\. Next steps

If you're ready to start building, check out our Sample Applications or SDKs:

#### SDKs

Our SDKs provide a comprehensive set of tools to help you build applications faster and in a more standardized way. The SDKs are available for Node and Python.  

* [Node SDK](https://www.npmjs.com/package/cms-bluebutton-sdk){:target="_blank"}
* [Python SDK](https://pypi.org/project/cms-bluebutton-sdk/){:target="_blank"}

#### Sample Apps

Our sample applications provide examples of basic use of the BB2.0 API.  

* [Node & React](https://github.com/CMSgov/bluebutton-sample-client-nodejs-react){:target="_blank"}
* [Python & React](https://github.com/CMSgov/bluebutton-sample-client-python-react){:target="_blank"}

---

## Authorization

The BB2.0 API uses the [OAuth 2 authorization flow](https://www.oauth.com/){:target="_blank"}. To initiate an integration, you'll need the client ID and client secret for your application that were generated when you registered your application.

### Web applications

BB2.0 API supports the Authorization Code flow for web applications running on a server. Use the following settings when registering your application: 

* Client Type: Confidential
* Grant Type: Authorization code

#### User authorization

To allow a user to authorize your application, direct them to the BB2.0 API `/authorize` endpoint with the appropriate parameters. 

Example call:
~~~
https://sandbox.bluebutton.cms.gov/v2/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2&redirect_uri=http://localhost:8080/testclient/callback&response_type=code&state=8e896a59f0744a8e93bf2f1f13230be5
~~~

**Parameters: Authorization code request**

|**Parameter** | **Required** | **Description** |
| -------- | -------- | -------- |
| `client_id`     | required     | The `client_id` from your registered application.     |
| `redirect_uri`     | required     | The callback URL of your application. The user will be directed to this URL after authorizing your application.      |
| `response_type`     | required     | Supported response type: `code`     |
| `state`     | optional     | Recommended. A random string used to protect against request forgery attacks.   |
{:.ds-c-table}

#### Token endpoints

* Sandbox: `https://sandbox.bluebutton.cms.gov/v2/o/token/`
* Production: `https://api.bluebutton.cms.gov/v2/o/token/`


#### Exchange code for token

If the user authorizes your application, the BB2.0 API redirects back to the `redirect_uri` registered with your application with an authorization code and state parameter appended to it. 

For example, if the Redirect URI is `http://localhost:8080/testclient/callback`, BB2.0 API will redirect with this request:

~~~
GET http://localhost:8080/testclient/callback?code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&state=8e896a59f0744a8e93bf2f1f13230
~~~

Your application can now exchange the code provided in the redirected request for an access token. 

To retrieve an access token, POST to the BB2.0 /token endpoint providing the code with the following parameters: 

* `client_id`
* `client_secret`
* `redirect_uri`
* `grant_type`: `authorization_code` 
* `code`

##### cURL command
~~~
curl -X "https://sandbox.bluebutton.cms.gov/v2/o/token/" \
-u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:<client_secret>" \
-d "code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2&grant_type=authorization_code&redirect_uri=http://localhost:8080/testclient/callback"
~~~
##### Token response
~~~
{
"access_token": "oQlduHNr09GKCU506GOgp8OarrAy2q",
"expires_in": 16768.523842,
"token_type": "Bearer",
"scope": "profile patient/Patient.read patient/ExplanationOfBenefit.read patient/Coverage.read",
"refresh_token": "wDimPGoA8vwXP51kie71vpsy9l17HN"
}
~~~
Applications in the "10 hours" access category do not receive a refresh token in the BB2.0 token response.
#### Exchange refresh token for new access token

Access tokens expire after 10 hours. You can't use an expired access token to access data. To access data after an access token expires, request a new access token using a refresh token. Refresh tokens are available to applications in the "13 months" and "Research" access duration categories.

You can use a refresh token at any time in your application's workflow, even before an access token expires.

To retrieve a new refresh token, POST to the BB2.0 API `/token` endpoint with the following parameters:

* `client_id`
* `client_secret`
* `grant_type`: `refresh_token`
* `refresh_token`

##### cURL command
~~~
curl -X POST "https://sandbox.bluebutton.cms.gov/v2/o/token/" \
-u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:<client_secret>" \
-d "grant_type=refresh_token&refresh_token=wDimPGoA8vwXP51kie71vpsy9l17HN”
~~~
##### Token response 

(successful with 200 status code):
~~~
{
"access_token": "VD1VaT4IfjXAMlZTS9E4RVXZlkhYG7",
"expires_in": 36000,
"token_type": "Bearer",
"scope": "profile patient/Patient.read patient/Coverage.read patient/ExplanationOfBenefit.read",
"refresh_token": "7x0VkRQlRU4fRNCQL2vh239nIyucgw",
"patient": "-20140000000001"
}
~~~
#### Common token endpoint errors

##### Reused refresh token

A refresh token can only be used one time. The following is an example of an error response when attempting to reuse a refresh token:

Response (unsuccessful with 400 status code):
~~~
{
"error": "invalid_grant"
}
~~~
If you receive this error, verify that your refresh token sent the correct value.  If it's already been used, the user should be directed to re-authorize following the original authorization flow above.

##### Client credentials or permissions problems

If your request has any issues with client credentials or permissions, the following response will be received:

Response (unsuccessful with 401 status code):
~~~
{
"error": "invalid_client"
}
~~~
If you receive this message, double-check that the request looks correct. If everything looks correct, email [bluebuttonapi@cms.hhs.gov](mailto:bluebuttonapi@cms.hhs.gov), and the Blue Button 2.0 API team can help troubleshoot.

#### Expire authenticated user for sandbox testing

For testing in our sandbox, you can use the `/expire_authenticated_user` endpoint that expires the authorization granted by a patient user.

`/expire_authenticated_user` can be used to test your code for the following conditions that produce the same error responses via the API:

* When an access token expires, without needing to wait for the expiration in 10 hours
* When a patient revokes access to your application
* When access granted to a patient's data has expired

POST to the BB2.0 API `/expire_authenticated_user` endpoint with the following parameters:

* `client_id`
* `client_secret`
* patient ID (patient ID "-20140000000001" is used in the cURL example below)

##### cURL command
~~~
curl -X POST "https://sandbox.bluebutton.cms.gov/v2/o/expire_authenticated_user/-20140000000001/" \
-u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:\<client_secret\>" \
-H “Content-Length: 0”
~~~
##### Response 

Successful with 200 status code:
~~~
success
~~~
##### Common error responses


| Error Code | Response | Reason |
| -------- | -------- | -------- |
| 404     | `Data Access Grant was Not Found`     | Patient ID has not granted access     |
| 403     | `FORBIDDEN`    | Issues with client credentials or permissions    |
{:.ds-c-table}



### Native & mobile applications

The Blue Button API supports the [OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749){:target="_blank"} using the [authorization code grant](https://www.rfc-editor.org/rfc/rfc6749#section-1.3.1){:target="_blank"} with a [confidential client](https://www.rfc-editor.org/rfc/rfc6749#section-2.1){:target="_blank"} type flow. To optimize the security of Medicare enrollees' data during authentication, we do not support the implicit grant or public client types.

For best practices for the type of application you're developing, review the [OAuth 2.0 for Native Apps](https://www.rfc-editor.org/rfc/rfc8252.txt){:target="_blank"}.

To mitigate security risks, use a proxy middleware server following a Backend For Frontend (BFF) authentication pattern. In the BFF pattern, a backend server performs all authorization code and refresh token exchanges. For examples of this type of proxy middleware client/server implementation, check out our sample applications available in [Node](https://github.com/CMSgov/bluebutton-sample-client-nodejs-react){:target="_blank"} or [Python](https://github.com/CMSgov/bluebutton-sample-client-python-react){:target="_blank"}.

### Proof Key for Code Exchange (PKCE) extension usage

To improve the security of your application, we highly recommend using the [PKCE](https://tools.ietf.org/html/rfc7636){:target="_blank"} extension.

There are several reasons to use the PKCE extension:

* Ensures that the application that started the OAuth 2.0 flow is the same one that is finishing it.
* Mitigates the impact of a compromised Authorization Code by a malicious actor.
* Follows the [OAuth 2.0 Security Best Current Practice](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-security-topics#section-2.1.1){:target="_blank"}

#### PKCE code challenge support

PKCE uses a code challenge that is derived from a code-verifier. The BB2.0 API supports the S256 style code challenge:

`codechallenge = BASE64URL-ENCODE(SHA256(ASCII(codeverifier)))`

When using PKCE, send the following additional parameters and values as part of the OAuth2.0 Authorization Request:

* `code_challenge`
* `codechallengemethod = "S256"`

To learn more about this flow, refer to [OAuth.com](https://www.oauth.com/){:target="_blank"}.

### Scopes

Scopes define the API endpoints that your application is allowed to access. The BB2.0 API uses [HL7 FHIR Scopes](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html){:target="_blank"} to manage access to Medicare enrollee data. 

#### BB2.0 API HL7 FHIR 

| **Scope** | **Grants** |
| -------- | -------- | 
| `patient/Patient.read`     | Permission to read the Patient resource for a Medicare enrollee | 
| `patient/Coverage.read`     | Permission to read the Coverage resources for a Medicare enrollee |
| `patient/ExplanationOfBenefit.read`     | Permission to read the Explanation of Benefit resources for a Medicare enrollee |
| `profile`     |Permission to access the `/UserInfo` endpoint (from the [OpenID Connect specification](https://openid.net/connect/){:target="_blank"} |
{:.ds-c-table}


#### Medicare enrollee personal information guidelines

There are 2 scenarios that block your application's access to the `/Patient` and `/Userinfo` endpoints:

1. You choose not to collect Medicare enrollee personal information when your application is approved in production.
2. A Medicare enrollee does not give your application permission to access their personal information. In the Medicare.gov authentication process, Medicare enrollees always have the option to block access to their personal data. 

If you can't access the `/Patient` or `/Userinfo` endpoint, you can get the resource ID for a patient by pulling it during the initial authorization response or from the `ExplanationOfBenefit` or `Coverage` bundles.

Suppose your application requires information limited by a scope and you can't get the information in another endpoint. In that case, you can explain why certain data is needed within your application before the user goes through the Medicare.gov authentication process. For example, if you use demographic information to help users autofill forms, explain in your UI that allowing access to their personal data will make it easier and faster to fill out required forms. However, if a user shares that data with you for one-time data entry, be clear about how long you keep the information and if it is used for any other purposes in your Privacy Policy and/or Terms of Service documents.

#### Revoked access

An enrollee can revoke access to your application in the 'My Connected Apps' section of their Medicare.gov account. This results in an invalid token for that user. If a Medicare enrollee revokes access to their data, be sure to account for that use case in your application's UI so it's easy for a Medicare enrollee to understand what's happening with their Medicare data.

---
## Understanding the data

The BB2.0 database pulls data from the [CMS Chronic Conditions Warehouse (CCW)](https://www2.ccwdata.org/web/guest/home/){:target="_blank"}, which contains Medicare Part A, B and D claims data going back to 2014\. Over 600 fields from the CCW are mapped to FHIR. These fields are surfaced across the Patient, Coverage and Explanation of Benefits FHIR resources.

### FHIR resources

Blue Button 2.0 API data is supplied in three resources from the [FHIR standard](http://hl7.org/fhir/R4/){:target="_blank"}:

* [Explanation of Benefit](http://www.hl7.org/fhir/R4/explanationofbenefit.html){:target="_blank"} (EOB): Primary source of claims data. The EOB resource contains the lines within an episode of care, including where and when the service was performed, the diagnosis codes, the provider who performed the service, and the cost of care.
* [Patient](http://hl7.org/fhir/R4/patient.html){:target="_blank"}: Provides information about patients including demographic information and updates to their patient identifiers.
* [Coverage](https://hl7.org/fhir/R4/coverage.html){:target="_blank"}: Provides information about the enrollees' insurance coverage, including information about dual coverage.

#### Explanation of Benefit

The Explanation of Benefit resource provides data for the following claim types:  

* Inpatient (INPATIENT)
* Outpatient (OUTPATIENT)
* Skilled Nursing Facility Claims (SNF)
* Hospice (HOSPICE)
* Home Health Agency Claims (HHA)
* Carrier (Professional)
* Durable Medical Equipment (DME)
* Prescription Drug Events - Part D (PDE)  

Request:
~~~
HTTP GET /v2/fhir/ExplanationOfBenefit/?patient=[fhir_id]  
~~~

This request returns claims as [Explanation of Benefit Resources](https://hl7.org/fhir/R4/explanationofbenefit.html){:target="_blank"} inside a [FHIR Bundle](http://hl7.org/fhir/R4/bundle.html){:target="_blank"}.   

Example response excerpt:
~~~
{
    "total":99,
    "entry": [
        {
            "resource": {
                "resourceType":"ExplanationOfBenefit",
                "id":"carrier--10045426206",
                "meta":{
                    "lastUpdated":"2021-06-07T21:51:33.787-04:00",
                    "profile": [
                        "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-ExplanationOfBenefit-Professional-NonClinician"
                    ]
                },
                "identifier": [
                    {
                        "type":{
                            "coding": [
                                {
                                    "system":"http://hl7.org/fhir/us/carin-bb/CodeSystem/C4BBIdentifierType",
                                    "code":"uc",
                                    "display":"UniqueClaimID"
                                }
                            ]
                        },
                        "system":"https://bluebutton.cms.gov/resources/variables/clm_id",
                        "value":"-10045426206"
                    },
~~~
  

<a href="/sample-eob-entry.json" download>Download a sample EOB resource</a>

#### Patient  

~~~
HTTP GET /v2/fhir/Patient/[fhir_id]  
~~~

The above URL returns demographic and other administrative information as a [Patient FHIR Resource](http://hl7.org/fhir/R4/patient.html){:target="_blank"}. This information is mostly demographic information, not medical data. Note that users can choose to allow or deny access to the /Patient endpoint in the Medicare.gov authorization flow. For more information, go to [Scopes](#scopes).  

Request:
~~~
curl --header "Authorization:Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Patient/-20140000008325"`  
~~~

Example response excerpt:
~~~
{
    "resourceType": "Patient",
    "id": "-20000000001112",
    "meta": {
        "lastUpdated":"2021-06-07T21:50:48.132-04:00",
        "profile": [
            "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-Patient"
        ]
    },
    "identifier": [
        {
            "type":{
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                        "code":"MC",
                        "display":"Patient'sMedicarenumber"
                    }
                ]
            },
            "system": "http://hl7.org/fhir/sid/us-mbi",
            "value":"2S00A00AA00",
            "period": {
                "start":"2020-01-01"
            }
        }
    ],
    "name": [
        {
            "use":"usual",
            "family":"Doe",
            "given": [
                "John",
                "X"
            ]
        }
    ],
    "gender":"male",
    "birthDate":"1999-06-01",
    "deceasedDateTime":"1981-03-17",
    "address": [
        {
            "state":"07",
            "postalCode":"99999"
        }
    ]
}

~~~

<a href="/sample-patient-entry.json" download>Download a sample Patient FHIR Resource</a>  

#### Coverage  
~~~
HTTP GET /v2/fhir/Coverage/?beneficiary=[fhir_id]  
~~~
The above URL returns Coverage information as [Coverage resources](http://hl7.org/fhir/R4/coverage.html){:target="_blank"} inside a [FHIR Bundle](http://hl7.org/fhir/R4/bundle.html){:target="_blank"}. One coverage resource is supplied for each coverage type.

Request: 
~~~
curl --header "Authorization:Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v2/fhir/Coverage/?beneficiary=-20140000008325"`
~~~

Response excerpt:
~~~
{
    "resourceType":"Bundle",
    "id":"fb4bffd7-abb3-401f-96cd-d617c545092c",
    "meta":{
        "lastUpdated":"2022-02-14T17:27:56.303-05:00"
    },
    "type":"searchset",
    "total":4,
    "entry": [
        {
            "resource": {
                "resourceType":"Coverage",
                "id":"part-a--20000000001112",
                "meta": {
                    "lastUpdated":"2021-06-07T21:50:48.132-04:00",
                    "profile": [
                        "http://hl7.org/fhir/us/carin-bb/StructureDefinition/C4BB-Coverage"
                    ]
                },
                "status":"active",
                "type":{
                    "coding": [
                        {
                            "system":"http://terminology.hl7.org/CodeSystem/v3-ActCode",
                            "code":"SUBSIDIZ"
                        }
                    ]
                },
                "subscriberId": "2S00A00AA00",
                "beneficiary": {
                    "reference":"Patient/-20000000001112"
                },

~~~

  
<a href="/sample-coverage-entry.json" download>Download a sample Coverage FHIR Resource</a>  

### UserInfo

The UserInfo endpoint is an OAuth 2.0 Protected Resource that returns information about an authenticated user.   

Note that users can choose to allow or deny access to the UserInfo endpoint in the Medicare.gov authorization flow. For more information, go to [Scopes](#scopes).  
  

`HTTP GET /connect/userinfo`  

The above URL returns basic information about the user, given an authorization token. An HTTP GET is called and the response is returned as JSON.  

Request:
~~~
curl --header "Authorization: Bearer <AUTHORIZATIONTOKEN\>" "https://sandbox.bluebutton.cms.gov/v2/connect/userinfo"`
~~~

Example response:
~~~
{
    "sub": "-123456789",
    "prefered_username": "fflinstone",
    "given_name": "Fred",
    "family_name:, "Flinstone,
    "name": "FredFlinstone",
    "email": "pebbles-daddy@example.com",
    "created": "2017-11-28",
    "patient": "-123456789",
}
~~~
### Terminology and coding systems

BB2.0 API supplies codified data using several different terminology and coding systems, defined by various standards bodies, along with locally defined CMS coding systems: 

* [ICD-10](https://www.cms.gov/Medicare/Coding/ICD10){:target="_blank"}
* [HCPCS](https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo){:target="_blank"}
* [CPT Codes](https://www.cms.gov/Medicare/Fraud-and-Abuse/PhysicianSelfReferral){:target="_blank"}
* [National Drug Code Directory](https://www.fda.gov/drugs/drug-approvals-and-databases/national-drug-code-directory){:target="_blank"}
* [CMS Claim Type](https://bluebutton.cms.gov/resources/codesystem/eob-type/){:target="_blank"}  

Additional information about coding systems can be found on the [terminology page](http://www.hl7.org/fhir/us/carin-bb/artifacts.html#5){:target="_blank"} of the [CARIN Implementation Guide](http://www.hl7.org/fhir/us/carin-bb/index.html){:target="_blank"} and in the [Blue Button Code System Listing (CSV 77KB)](/assets/csv/bluebutton_system_listing.csv){:target="_blank"}.  

BB2.0 API also provides data in [FHIR Extensions](http://www.hl7.org/fhir/extensibility.html){:target="_blank"}. FHIR extensions are custom data elements that are not found in the FHIR standard:

* [Blue Button extensions in V2 (CSV 96KB)](/assets/csv/BB_V2_extension_listing.csv){:target="_blank"}
* [Original extensions defined in Blue Button V1](https://bluebutton.cms.gov/assets/ig/extensions.html){:target="_blank"} 

### Refresh rate and rate limiting

Data from the CCW is pulled into the BB2.0 API database on a weekly basis. The weekly data pull may be delayed for maintenance or because of delayed delivery of claims to the CCW.  

Our rate limit is high enough to accommodate the needs of anyone integrating with the BB2.0 API. The BB2.0 API is one of 4 CMS APIs that share the same data from the CCW. BB2.0 is for single data calls for an individual Medicare enrollee and the other 3 APIs are designed for bulk data calls. Because the rate limit is set based on the needs the bulk data APIs, the rate limit is higher than required for an application making single API calls using BB2.0\.  

### Synthetic data

Because access to real claims data is restricted in order to protect the privacy of Medicare enrollees, CMS created synthetic user accounts representing enrollment information and healthcare claims for 40,000 Medicare enrollees. Since synthetic data are realistic-but-not-real data, the typical privacy and security restrictions do not apply.  

Although the synthetic user accounts are not tied to any real patient data, they mimic real claims data. For example, if a patient is prescribed the diabetes medication Metformin, the associated cost and date of this prescription will be realistic. However, the synthetic data set does not represent a longitudinal patient view or true clinical scenario. This allows you to test your integration with BB2.0 API, but could result in a patient with records for contradictory procedures. 

#### Working with synthetic user accounts

BB2.0 API offers 40,000 synthetic user accounts for you to test with in both the sandbox and production environments:

| User account ranges | Date updated | Description | 
| -------- | -------- | -------- | 
| BBUser00000 to BBuser09999     | Rolling Claims updated weekly<br /> Loaded July 2023 |     Most recently updated and most useful accounts. These accounts receive new claims data on a rolling basis.  These user accounts represent a range of Medicare demographics and ages, including people under 65 who qualify for Medicare for reasons other than age. |
| BBUser30000 to BBuser39999 | Loaded October, 2021 | static claims data |
| BBUser10000 to BBuser19999 | Loaded 2017 |  static claims data | 
| BBUser20000 to BBuser29999 | Loaded 2017 | static claims data | 
{:.ds-c-table}

To differentiate between synthetic data and real patient production data, synthetic records have negative Patient ID and Explanation of Benefit values (example synthetic Patient ID: -10000010254618). Real Patient IDs will always have positive values.  

#### Authenticating as a synthetic user

Each of our 40,000 synthetic user accounts have Medicare.gov login credentials. To log in as a synthetic user, use the following username/password combination pattern when authorizing a test user with Blue Button 2.0:

* Username: BBUserXXXXX (Example: BBUser00005)
* Password: PWXXXXX! (Example: PW00005!)  

#### Claim dates in rolling claims updates

When new data is added for a synthetic user account in the weekly update, the new data includes claims dated 1-2 weeks prior. This delay simulates real claim processing time in production data. Get updated claims using the [\_lastUpdated query parameter](#query-by-lastupdated-field).  
  
---

## Consuming the data
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

## Optimizing your application

### Compress resources for more efficient data transfers  

Turn on compression to improve performance when transferring large data resources. Gzip compression is turned off by default. Compression can be activated for the following content types:  

* `text/html`
* `text/plain`
* `application/json`
* `application/fhir+json`  

To activate compression add the following to the header:  

`Accept-Encoding: gzip`  

The minimum payload size we will gzip is 1 kilobyte. Check for the `Content-Encoding: gzip` response header before trying to decompress.  

### Query by type

EOB resources fall into 8 types. If you only need specific types of data, the query by type feature allows you to request claims by claim type. By default, the FHIR API returns all of these claim types when requesting the EOB for an individual Medicare enrollee.  

#### EOB Claim types and parameters

| Claim Type | Type Parameter<br /> (case-sensitive) |
| ---- | ---- |
| Carrier | carrier |
| Durable Medical Equipment | dme |
| Home Health Agency | hha |
| Hospice | hospice |
| Inpatient | inpatient |
| Outpatient | outpatient |
| Skilled Nursing Facility | snf |
| Prescription Drug Event | pde |
{:.ds-c-table}
    
Use the query parameter to request a specific claim type. 
~~~
Example: ?type=pde
~~~

To request multiple claim types, use a comma-separated list of values for the TYPE parameter. If multiple codes are specified, EOBs matching all of those claim types will be returned.   

Example:  
~~~
{baseURL}/ExplanationOfBenefit?patient=123&type=carrier,dme,hha,hospice,inpatient,outpatient,snf  
~~~

#### Claim type errors

If you submit an invalid combination of claim types or use the wrong case you'll get an error response with a status code of `400 Bad Request`.

### Query by "lastUpdated" Field  

The HL7 FHIR specification provides a Meta section in each resource. The `lastUpdated` field represents the date and time of the last update and is supplied with a FHIR instant datatype  
~~~
YYYY-MM-DDThh:mm:ss.sss+zz:zz.  
~~~
The HL7 FHIR specification also provides a `_lastUpdated query` parameter for the search operations on the endpoints. By using the `_lastUpdated` query parameter, you can request records that have changed before or after a specific date. If you keep track of the date of a previous request, you can request just the changes since your previous request. The format of this request would be:  
~~~
{baseURL}/Patient?_id=-20000000001112&_lastUpdated=gt2020-02-13T08:00:00-05:00  
~~~

Do not use dates before 2020-02-12 with the `_lastUpdated parameter`. 

The Blue Button API supports operators for less than (lt), greater than (gt), less than or equal (le), and greater than or equal (ge) the specified instant. You can also specify a time interval by using two `_lastUpdated parameters` like this:  
~~~
{baseURL}/ExplanationOfBenefit?patient=Patient/-20000000001112&_lastUpdated=gt2020-02-13T08:00:00-05:00&_lastUpdated=lt2020-02-14T08:00:00-05:00
~~~

---

## Production API access

In order to gain production access, an organization should start by reviewing the [Terms of Service](https://bluebutton.cms.gov/terms/), [production access user guide](https://bluebutton.cms.gov/guide/), and [checklist](https://bluebutton.cms.gov/checklist/). Once an organization believes it is fulfilling all the requirements detailed in the checklist and is adherent to the terms of service, they should email [BlueButtonAPI@cms.hhs.gov](mailto:BlueButtonAPI@cms.hhs.gov) to set up a production access demonstration meeting with the CMS team.

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

 <a id="footnote-1"></a><sup>1</sup> Jama Health Forum, “Addressing Challenges in Primary Care—Lessons to Guide Innovation” [https://jamanetwork.com/journals/jama-health-forum/fullarticle/2795471](https://jamanetwork.com/journals/jama-health-forum/fullarticle/2795471), August 19, 2022