---
layout: developers
title:  "Blue Button API Docs"
date:   2017-10-30 09:21:12 -0500
description:
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: api
permalink: "/developers/"
sections:
  - Overview
  - Authorization
  - Core Resources
  - FHIR Data Model
  - Try the API
  - Meet "Jack"
  - Production API Access
  - Developer Guidelines
ctas:
  -
    title: Blue Button Home
    link: /
  -
    title: Register your application
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login
---

## Overview

The Centers for Medicare and Medicaid Services (CMS) Blue Button API enables Medicare beneficiaries to connect their Medicare claims data to the applications, services, and research programs they trust.

The CMS Blue Button API:

- Enables a developer to register a beneficiary-facing application
- Enables a beneficiary to grant an application access to four years of their Part A, B, and D claims data
- Uses the [HL7 FHIR](https://www.hl7.org/fhir/) standard for beneficiary data and the [OAuth 2.0](https://oauth.net/2/) standard for beneficiary authorization

Developers can sign up [here]()
to make use of the API.

---

## Authorization

To use the Blue Button OAuth 2
a developer must
[register their application](https://sandbox.bluebutton.cms.gov/v1/o/applications/).
A registered application is given
a client ID and a client secret.
The secret should only be used
if it can be kept confidential,
such as communication
between your sever and the Blue Button API.
Otherwise
the [Client Application Flow](#client-application-flow) may be used.

### Web Application Flow

To use this flow
your application should
be registered with
`Client Type` set to `confidential`
and
`Grant Type` set to `authorization-code`.

#### Request authorization from user

To allow
a user to authorize
your application,
direct them to Blue Button's `authorize` endpoint.
The request must include
the `response_type` set to `code`,
your application's client_id, and your application's redirect_uri.
An optional `state` field
that your application can use to identify
the authorization request is recommended.

```
https://sandbox.bluebutton.cms.gov/v1/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2
    &redirect_uri=http://localhost:8080/testclient/callback
    &response_type=code
    &state=8e896a59f0744a8e93bf2f1f13230be5
```

#### Exchange `code` for `token`

After visiting the authorization page
a user will be redirected back to
the `redirect_uri`
registered with
your application.

For example if
the `redirect_uri`
is `http://localhost:8080/testclient/callback`
BlueButton will redirect with this request.

```
GET http://localhost:8080/testclient/callback?code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2
    &state=8e896a59f0744a8e93bf2f1f13230be5
```

Your application can now
exchange the code
provided in the redirected request
for a full `token`. Send a `POST`
request to the BlueButton `token`
endpoint providing the `code`,
the application's `client_id`,
`client_secret`,
and `redirect_uri`.
Your request
must also specify the `grant_type`
which should always be `authorization_code`
for this flow.

```
curl -X POST "https://sandbox.bluebutton.cms.gov/v1/o/token/" \
    -u "swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2:<client_secret>" \
    -d "code=TSjqiZCdJwGyytGjz2GzziPfHTJ6z2
	&grant_type=authorization_code
	&redirect_uri=http://localhost/testclient/callback"
```

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

### Client Application Flow

To use this flow
your application should
be registered with
`Client Type` set to `public`
and
`Grant Type` set to `implicit`.

#### Request authorization from user

To use the client application flow
direct the user to
the Blue Button `authorization` endpoint
with the `response_type` parameter set to `token`.

```
https://sandbox.bluebutton.cms.gov/v1/o/authorize/?client_id=swBu7LWsCnIRfu530qnfPw1y5vMmER3lAM2L6rq2
    &redirect_uri=http://localhost:8080/testclient/callback
    &response_type=token
    &state=8e896a59f0744a8e93bf2f1f13230be5
```

If the user authorizes your application
they will be redirected back to
the `redirect_uri` of your application.
The request will include an `access_token`
in the fragment.

```
http://localhost:8080/testclient/callback#access_token=KCHMTX5VHNAXYGYv38eG2RLAX4hL6R
    &expires_in=35849.875807
    &token_type=Bearer
    &scope=profile+patient%2FPatient.read+patient%2FExplanationOfBenefit.read+patient%2FCoverage.read
    &state=8e896a59f0744a8e93bf2f1f13230be5
```

Below you will find a sample account you can use to test your Blue Button OAuth implementation. This account mimics a valid MyMedicare.gov account but has reduced functionality. For example, you cannot test “Forgot Password” flow.

_Jane Doe Username: BBUser29999 Password: PW29999!_

---


## Core Resources

Base Request URL:

<pre>HTTP GET /connect/userinfo </pre>

Resources:

- Get User Profile from an Authorization Token
- Get all Explanation of Benefit Records for an Individual beneficiary
- Get all Patient Records for an Individual beneficiary
- Get all Coverage Information for an Individual beneficiary

As a security measure the date of birth, SSN, and HICN will not be provided by the CMS Blue Button API.

We use [FHIR Extensions](https://www.hl7.org/fhir/extensibility.html#Extension) in our API responses.

**Get User Profile for an Authorization Token**

<pre>HTTP GET /connect/userinfo </pre>

The UserInfo Endpoint is an OAuth 2.0 Protected Resource.The above URL fetches the fictitious beneficiary’s basic account information given an Authorization Token. This is most often used when creating an account within your application. An HTTP GET is called and the response is returned as JSON.

<pre>curl --header "Authorization: Bearer AUTHORIZATION TOKEN" "https://sandbox.bluebutton.cms.gov/v1/connect/userinfo"</pre>

<pre>
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
</pre>

**Get all Explanation of Benefit Records for an individual beneficiary**

<pre>/v1/fhir/ExplanationOfBenefit/?patient=[fhir_id]</pre>

The above URL returns all of the synthetic beneficiary's Explanation of Benefit (sometimes referred to as an episode of care) records as an ExplanationOfBenefit FHIR Resource. The bulk of a beneficiary's data is contained within these ExplanationOfBenefit FHIR resources.

<pre>curl --header "Authorization: Bearer AUTHORIZATION TOKEN"  "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=20140000008325"</pre>

<pre>{
    "resourceType": "Bundle",
    "id": "106bf0ec-d274-43a0-909c-0635c50f354b",
    "meta": {
        "lastUpdated": "2018-02-09T10:51:48.914-05:00"
    },
    "type": "searchset",
    "total": 140,
    "link": [
        {
            "relation": "self",
            "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?_format=application%2Fjson%2Bfhir&patient=20140000008325"
        }
    ],
    "entry": [
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
                            "reference": "Patient?identifier=CCW.BENE_ID|20140000008325"
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
                ],
                "extension": [
                    {
                        "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/carr_num.txt",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/carr_num.txt",
                                    "code": "99999"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/pmtdnlcd.txt",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/pmtdnlcd.txt",
                                    "code": "1"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/asgmntcd.txt",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/asgmntcd.txt",
                                    "code": "A"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ccltrnum.txt",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ccltrnum.txt",
                                    "code": "99999999"
                                }
                            ]
                        }
                    }
                ],
                "identifier": [
                    {
                        "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/clm_id.txt",
                        "value": "22011027731"
                    },
                    {
                        "system": "http://bluebutton.cms.hhs.gov/identifier#claimGroup",
                        "value": "52241843218"
                    }
                ],
                "status": "active",
                "type": {
                    "extension": [
                        {
                            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ric_cd.txt",
                            "valueCodeableConcept": {
                                "coding": [
                                    {
                                        "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ric_cd.txt",
                                        "code": "O"
                                    }
                                ]
                            }
                        }
                    ],
                    "coding": [
                        {
                            "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/clm_type.txt",
                            "code": "71"
                        }
                    ]
                },
                "patient": {
                    "reference": "Patient?identifier=CCW.BENE_ID|20140000008325"
                },
                "billablePeriod": {
                    "start": "2015-04-01",
                    "end": "2015-04-01"
                },
                "referral": {
                    "reference": "#1"
                },
                "disposition": "Debit accepted",
                "careTeam": [
                    {
                        "extension": [
                            {
                                "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/prv_type.txt",
                                "valueCodeableConcept": {
                                    "coding": [
                                        {
                                            "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/prv_type.txt",
                                            "code": "1"
                                        }
                                    ]
                                }  

                  ...this is only a subset of the entire output...

</pre>

**Get all Patient Records for an individual beneficiary**

<pre><code>HTTP GET /v1/fhir/Patient/[fhir_id]</code></pre>

<p>The above URL returns the synthetic Beneficiary's personal health information as a [Patient FHIR Resource](https://www.hl7.org/fhir/patient.html).  This information is mostly contact information, not medical data.</p>

<pre><code>curl --header "Authorization: Bearer AUTHORIZATION TOKEN"  "https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/20140000008325"</code></pre>

<pre><code>{
  "resourceType": "Patient",
  "id": "20140000008325",
  "extension": [
    {
      "url": "http://hl7.org/fhir/StructureDefinition/us-core-race",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/race.txt",
            "code": "1"
          }
        ]
      }
    }
  ],
  "identifier": [
    {
      "system": "http://bluebutton.cms.hhs.gov/identifier#bene_id",
      "value": "20140000008325"
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
      "given": ["Jane", "X"]
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
}</code>
</pre>

**Get all Coverage Information for an Individual Beneficiary**

<pre>HTTP GET /v1/fhir/Coverage/?beneficiary=[fhir_id]</pre>

The above URL returns the synthetic beneficiary's Coverage information as an [ExplanationOfBenefit FHIR Resource.](http://hl7.org/fhir/explanationofbenefit.html)

<pre>curl --header "Authorization: Bearer AUTHORIZATION TOKEN"  "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/?beneficiary=20140000008325"
</pre>

<pre>
{
  "resourceType": "Bundle",
  "id": "28d26ab6-2043-4afd-8c9a-835c0ff3e179",
  "meta": {
    "lastUpdated": "2017-12-20T10:21:08.565-05:00"
  },
  "type": "searchset",
  "total": 3,
  "link": [
    {
      "relation": "self",
      "url": "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/?_format=application%2Fjson%2Bfhir&beneficiary=Patient%2F20140000008325"
    }
  ],
  "entry": [
    {
      "fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/part-a-20140000008325", "resource": {
        "resourceType": "Coverage",
        "id": "part-a-20140000008325",
        "extension": [
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt", "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt",
                  "code": "10"
                }
              ]
            }
          },
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/orec.txt",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/orec.txt",
                  "code": "0"
                }
              ]
            }
          },
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/crec.txt",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/crec.txt",
                  "code": "0"
                }
              ]
            }
          },
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/esrd_ind.txt",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/esrd_ind.txt",
                  "code": "0"
                }
              ]
            }
          }
        ],
        "status": "active",
        "type": {
          "coding": [
            {
              "system": "Medicare",
              "code": "Part A"
            }
          ]
        },
        "beneficiary": {
          "reference": "Patient?identifier=CCW.BENE_ID|20140000008325"
        },
        "grouping": {
          "subGroup": "Medicare",
          "subPlan": "Part A"
        }
      }
    },
    {
      "fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage
        /part-b-20140000008325", "resource": {
        "resourceType": "Coverage",
        "id": "part-b-20140000008325",
        "extension": [
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt", "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt",
                  "code": "10"
                }
              ]
            }
          }
        ],
        "status": "active",
        "type": {
          "coding": [
            {
              "system": "Medicare",
              "code": "Part B"
            }
          ]
        },
        "beneficiary": {
          "reference": "Patient?identifier=CCW.BENE_ID|20140000008325"
        },
        "grouping": {
          "subGroup": "Medicare",
          "subPlan": "Part B"
        }
      }
    },
    {
      "fullUrl": "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/part-d-20140000008325",
      "resource": {
        "resourceType": "Coverage",
        "id": "part-d-20140000008325",
        "extension": [
          {
            "url": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "https://www.ccwdata.org/cs/groups/public/documents/datadictionary/ms_cd.txt",
                  "code": "10"
                }
              ]
            }
          }
        ],
        "type": {
          "coding": [
            {
              "system": "Medicare",
              "code": "Part D"
            }
          ]
        },
        "beneficiary": {
          "reference": "Patient?identifier=CCW.BENE_ID|20140000008325"
        },
        "grouping": {
          "subGroup": "Medicare",
          "subPlan": "Part D"
        }
      }
    }
  ]
}
</pre>

## FHIR Data Model

We have mapped over 1,300 fields from the CMS claims data warehouse into FHIR.  These fields are surfaced across the Patient, Coverage and Explanation of Benefits FHIR resources.

- Beneficiary Enrollment Record
- Carrier Claims
- Durable Medical Equipment
- Home Health Agency Claims
- Hospice Claims
- Inpatient Claims
- Outpatient Claims
- Part D Events
- Skilled Nursing Facility Claims

The Blue Button API FHIR data model leverages coding systems specific to Medicare billing forms and/or the Chronic Conditions Warehouse, FHIR and Industry Coding Systems.

For Example:

- [National Drug Code Directory](https://www.accessdata.fda.gov/scripts/cder/ndc/)
- [HL7 v3 Code System ActCode](http://hl7.org/fhir/v3/ActCode/cs.html)
- [ICD-10](http://hl7.org/fhir/sid/icd-10)

[View the full list of Blue Button API FHIR Data Model Coding Systems and Identifiers](https://github.com/CMSgov/bluebutton-data-server/blob/master/dev/data-model.md)

**Synthetic Data**

The CMS Blue Button API offers a synthetic data set for developers to test against. This means that each request returns a realistic value. For example, if a patient is prescribed the diabetes medication Metformin, the associated cost and date of this prescription will be accurate.

Please note that this synthetic data set does not represent a longitudinal patient view. The claims—though representative independently—are shuffled and randomly assigned to patients. To build the synthetic data set, we selected a number of random claims, and shuffling them like a deck of cards among a group of fictitious Patient IDs. This will allow developers to test the Blue Button API system, but could result in a patient with records for contradictory procedures.

## Try the API

To join the Developer Preview, register a sample application and retrieve synthetic data for a sample Patient ID by calling the API, follow these four steps:

**Step 1:** [Join the Developer Preview](https://sandbox.bluebutton.cms.gov/v1/accounts/create) and register a sample application

- [Join the Developer Preview](https://sandbox.bluebutton.cms.gov/v1/accounts/create) to access the Developer Dashboard
- Click "Application Registration" to register a new sample application and get a Client ID and Secret

**Step 2:** Generate a sample token

To test out the Blue Button API, you must first generate a sample token that represents a beneficiary granting consent.

You can generate an access token for synthetic Patient 20140000008325 and sample Application TestApp by following these steps:

1.  Login to the developer portal
2.  Click on Test Client to begin
3.	Click "sample Authorization flow"
4.	Click the link to authorize. This will start the authorization flow to TestApp
5.	Login to your Blue Button Developer Preview Account (click here if you need to Join the Developer Preview)
6.	Agree to the Personal Health Information Sharing disclaimer (sample)
7.	Review the App Endorsements and click to accept risks (sample)
8.	Review the permissions TestApp is asking for and approve (sample)
9.	You will see a JSON document containing your access token and other information

You can now use your access token wherever "YOUR TOKEN HERE" is referenced below.

**Step 3:** Call the API

<pre>
curl --header "Authorization: Bearer YOUR TOKEN HERE" https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/20140000008325
</pre>

Or, try this out in Postman:

1. 	From Postman, open a new tab
2. 	Paste the Request URL: https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/20140000008325
3. 	Click "Authorization", select type "Bearer Token" and paste your token in the Token field
4. 	Click "Preview Request" and see a success message "Request headers were successfully updated with authorization data for preview."
5. 	Click "Send" and see the synthetic beneficiary's personal health information as a Patient FHIR Resource display under "Body" in Postman.

**Step 4:** View the API Response

In the API response for Patient 20140000008325 you will find:
- 32 total claims (140 total claim lines)
- 25 carrier claims (110 carrier claim lines)
- 2 inpatient claims (25 inpatient claim lines)
- 5 Part D events


**Step 5:** Accessing Synthetic Data

In order to access the full synthetic dataset, you can do the following:

1.  Set up your sandbox application
2.  Attempt to log into sandbox.bluebutton.cms.gov.
3.  Log into account.mymedicare.gov using one of thirty thousand provided usernames and passwords. The first user is BBUser00000, with password PW00000!, and these sample users continue all the way to BBUser29999, with password PW29999!.
4.  Approve access for your application, which will now have receive an access token, which can be used in the requests described above.

---

## Production API Access

Once you have successfully integrated with the CMS Blue Button API and are ready to go live, you can request access to the CMS Blue Button Production API through the Developer Portal.

**How long does it take to get my app approved?**

Typically this will take 1-2 weeks and involves a phone call and demo to the CMS Blue Button API team.

**What is the criteria I must meet to be considered for Production API access?**

First, you must register an application in the Blue Button Developer Sandbox and provide some basic information including:

- Your Name
- Email address
- Website
- Organization name
- Phone number

You also need to agree to the CMS Blue Button API Terms of Use when registering your app.

Next, the following criteria needs to be met and verified by the CMS Blue Button API team:

- You are a US based company
- You have a working app or website that can be demoed to the CMS Blue Button API team
- Your app links to a Privacy statement or Terms of Use that explains to a beneficiary in plain language how you will use their data and how they can cancel their account
- Your app must serve a Medicare population (obviously)

**What happens after I am approved?**

You will receive an email from the CMS Blue Button API team notifying you of approval.  You will then receive a new Client ID and Secret for your app in production.  You will use the base URL api.cms.bluebutton.gov instead of sandbox.bluebutton.cms.gov.

---

## Developer Guidelines

Below are guidelines you should follow to be successful in your Blue Button API integration.

**Your Privacy Policy**

You will be asked to provide a URL to your privacy policy and terms and conditions when registering your app in the Blue Button Developer Portal.  These links should be easy to access and understand by a beneficiary using your app.  Consider using the [Model Privacy Notice](https://www.healthit.gov/policy-researchers-implementers/model-privacy-notice-mpn).

**Rate Limiting and Data Refresh**

Medicare Part A and B claims data will be refreshed weekly, Part D data monthly.

Our schedules may vary depending on many things like maintenance, delayed delivery of claims to the CCW data warehouse, or additional data quality processing that's needed.

We recommend you have a daily or weekly job to fetch new claims data for your users.  Please be responsible with your API usage and comply with the Service Management Rights to Limit conditions in the [Blue Button API Terms of Service](/terms).

**Use of the Blue Button Logo**

The Blue Button logo and usage guidelines is detailed [here](https://www.healthit.gov/patients-families/blue-button/blue-button-image).

**Beneficiary Revokes Access**

A beneficiary may revoke access to your application via the MyMedicare.gov website.  When you encounter an invalid token indicating a beneficiary has revoked access, you should make a reasonable attempt to handle that case making it easy for the beneficiary to understand what is happening with their Medicare data.

---

## Meet Jack

"Jack" is a hypothetical 70 year-old male with Type 2 Diabetes and high blood pressure. Jack takes daily medication and his Doctor told him he needs to lose weight. He takes Glimepiride to help control his blood sugar and previously was on Metformin.

[Learn more about "Jack" (PDF)](https://cmsgov.github.io/bluebutton-developer-help/Jack-Persona.pdf)

---
