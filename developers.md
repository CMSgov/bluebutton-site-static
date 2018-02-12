---
layout: developers
title:  "Blue Button API Docs"
date:   2017-10-30 09:21:12 -0500
description:
landing-page: live
gradient: "blueberry-lime-background"
subnav-link-gradient: "blueberry-lime-link"
badge: api
sections:
  - Overview
  - Authorization
  - Core Resources
  - Try the API
  - Production API Access
  - Meet "Jack"
ctas:
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

---

## Authorization

To use the Blue Button OAuth 2, you need to go through two separate processes. First, you must create a Developer Preview account and register your application to gain the credentials necessary to request access.

Next, you must develop your application to correctly make requests and handle the responses from both the user's browser and the Blue Button servers.

Below you will find a sample account you can use to test your Blue Button OAuth implementation. This account mimics a valid MyMedicare.gov account but has reduced functionality. For example, you cannot test “Forgot Password” flow.

_Jane Doe Username: User29999 Password: PW29999!_

**Please note: Blue Button OAuth will be available in production on February 1st.**

<pre>HTTP  GET /o/authorize</pre>

<pre>HTTP  POST /o/token  </pre>

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

<pre>/v1/protected/bluebutton/fhir/v1/ExplanationOfBenefit/?patient=[fhir_id]</pre>

The above URL returns all of the synthetic beneficiary's Explanation of Benefit (sometimes referred to as an episode of care) records as an ExplanationOfBenefit FHIR Resource. The bulk of a beneficiary's data is contained within these ExplanationOfBenefit FHIR resources.

<pre>curl --header "Authorization: Bearer AUTHORIZATION TOKEN"  "https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?patient=20140000008325"</pre>

<pre>
{
  "resourceType": "ExplanationOfBenefit",
  "id": "EB3500",
  "text": {
    "status": "generated",
    "div": "
A human-readable rendering of the ExplanationOfBenefit
"
  },
  "identifier": [
    {
      "system": "http://www.BenefitsInc.com/fhir/explanationofbenefit",
      "value": "987654321"
    }
  ],
  "status": "active",
  "type": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/ex-claimtype",
        "code": "oral"
      }
    ]
  },
  "patient": {
    "reference": "Patient/pat1"
  },
  "created": "2014-08-16",
  "organization": {
    "reference": "Organization/2"
  },
  "claim": {
    "reference": "Claim/100150"
  },
  "claimResponse": {
    "reference": "ClaimResponse/R3500"
  },
  "outcome": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/remittance-outcome",
        "code": "complete"
      }
    ]
  },
  "disposition": "Claim settled as per contract.",
  "careTeam": [
    {
      "sequence": 1,
      "provider": {
        "reference": "Practitioner/example"
      }
    }
  ],
  "insurance": {
    "coverage": {
      "reference": "Coverage/9876B1"
    }
  },
  "item": [
    {
      "sequence": 1,
      "careTeamLinkId": [
        1
      ],
      "service": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/service-uscls",
            "code": "1200"
          }
        ]
      },
      "servicedDate": "2014-08-16",
      "unitPrice": {
        "value": 135.57,
        "system": "urn:iso:std:iso:4217",
        "code": "USD"
      },
      "net": {
        "value": 135.57,
        "system": "urn:iso:std:iso:4217",
        "code": "USD"
      },
      "adjudication": [
        {
          "category": {
            "coding": [
              {
                "code": "eligible"
              }
            ]
          },
          "amount": {
            "value": 120.00,
            "system": "urn:iso:std:iso:4217",
            "code": "USD"
          }
        },
        {
          "category": {
            "coding": [
              {
                "code": "eligpercent"
              }
            ]
          },
          "value": 0.80
        },
        {
          "category": {
            "coding": [
              {
                "code": "benefit"
              }
            ]
          },
          "amount": {
            "value": 96.00,
            "system": "urn:iso:std:iso:4217",
            "code": "USD"
          }
        }
      ]
    }
  ],
  "totalCost": {
    "value": 135.57,
    "system": "urn:iso:std:iso:4217",
    "code": "USD"
  },
  "totalBenefit": {
    "value": 96.00,
    "system": "urn:iso:std:iso:4217",
    "code": "USD"
  }
}
</pre>

**Get all Coverage Information for an Individual Beneficiary**

<pre>HTTP GET /v1/fhir/Patient/[fhir_id]</pre>

The above URL returns the synthetic beneficiary's coverage information as an [ExplanationOfBenefit FHIR Resource.](http://hl7.org/fhir/explanationofbenefit.html)

<pre>curl --header "Authorization: Bearer AUTHORIZATION TOKEN"  "https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage/?patient=20140000008325"
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

## Try the API

To join the Developer Preview, register a sample application and retrieve synthetic data for a sample Patient ID by calling the API, follow these four steps:

**Step 1:** [Join the Developer Preview](https://sandbox.bluebutton.cms.gov/v1/accounts/request-invite) and register a sample application

- [Join the Developer Preview](https://sandbox.bluebutton.cms.gov/v1/accounts/request-invite) to access the Developer Dashboard
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

## Meet Jack

"Jack" is a hypothetical 70 year-old male with Type 2 Diabetes and high blood pressure. Jack takes daily medication and his Doctor told him he needs to lose weight. He takes Glimepiride to help control his blood sugar and previously was on Metformin.

[Learn more about "Jack" (PDF)](https://cmsgov.github.io/bluebutton-developer-help/Jack-Persona.pdf)

---
