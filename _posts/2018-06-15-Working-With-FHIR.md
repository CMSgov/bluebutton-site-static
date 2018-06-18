---
layout: post_with_category
title: Blue Button at HL7 FHIR DevDays
date:  2018-06-15 5:30 PM -0600
categories: latest code
permalink: /blog/:title
badge: blog
ctas:
  - 
    title: Home
    link: /
  -
    title: Sign up for the Developer Sandbox
    link: https://sandbox.bluebutton.cms.gov/v1/accounts/create
---
On June 19th, 2018 the Blue Button 2.0 API is being featured in one of the 
[tutorial sessions](https://www.fhirdevdays.com/boston/schedule/#event-145) 
at the HL7 [FHIR DevDays conference](https://www.fhirdevdays.com/boston/) in Boston, MA.

The break-out session and the hands-on practice areas feature exercises to work with different aspects of FHIR. 
For Blue Button we are taking developers through interacting with our FHIR API through the OAuth2.0 Interface. 
We felt this was important because many test environments that expose FHIR resources do not protect those resources. 
Yet in the real world OAuth2.0 is typically used to control access. Interacting with an API through an OAuth2.0
authorization layer can make development more complicated. Therefore, this exercise sets out to simplify that 
process. 

The exercise covers two methods of access:

-   Using the Testclient app that is built into the sandbox.
-   Using a callback handler to capture the access token and enable subsequent calls to FHIR resources. 

What follows below is the Hands-on exercise that was provided for FHIR DevDays. We hope you find it useful.

<hr/>

# Hands-on Exercise

During the hands-on session of the Blue Button on FHIR tutorial, you will learn how to connect an application to the CMS Blue Button Sandbox environment. Authorize access as one of 30,000 synthetic beneficiaries and retrieve a Patient record or a bundle of Coverage or ExplanationOfBenefit resources.

After completing this tutorial, you will be able to:
-	Access the CMS Blue Button CapabilityStatement
-	Connect to an Oauth2.0 protected API
-	Authorize access as a target patient/beneficiary
-	Retrieve Stu3 FHIR resources for the authorizing beneficiary

## Mastering Consumer-Directed Exchange using OAuth2.0

### Check out the documentation

Open your browser and go to https://bluebutton.cms.gov. Browse around the site. Check out the Developer Documentation.

### Try our simple testclient app

-   Open your browser and go to [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov). 
-   Click on “Testclient” in the navigation bar and Follow the prompts…

When you are asked to authorize as a Medicare beneficiary try the following credentials:

    User name: BBUser12321
    Password: PW12321! 

*Hint: we have 29,999 users like that one.*
-   On the next screen click to Approve Access.

![Testclient app results screen](/assets/img/blog/testclient_result.png)
 
Now try accessing a Patient Record. 
[https://sandbox.bluebutton.cms.gov/testclient/Patient](https://sandbox.bluebutton.cms.gov/testclient/Patient)

    {"identifier": [
        {"system": "https://bluebutton.cms.gov/resources/variables/bene_id", 
         "value": "20000000002322"}, 
        {"system": "https://bluebutton.cms.gov/resources/identifier/hicn-hash", 
         "value": "b8ec89080509826e661a311ee836b66fe42ba6fac284e4d755a545339dda52c8"}], 
        "birthDate": "2000-06-01", 
     "extension": [
        {"valueCoding": {"system": "https://bluebutton.cms.gov/resources/variables/race", 
                         "code": "1", 
                         "display": "White"}, 
         "url": "https://bluebutton.cms.gov/resources/variables/race"}], 
     "address": [{"district": "999", 
                  "postalCode": "99999", 
                  "state": "21"}], 
     "resourceType": "Patient", 
     "gender": "unknown", 
     "id": "20000000002322", 
     "name": [{"family": "Doe", 
               "given": ["Jane", "X"], 
                         "use": "usual"}]
    }

### Register an application

-	Create an account: https://sandbox.bluebutton.cms.gov/v1/accounts/create
-	Check your email and activate the account
-	Login https://sandbox.bluebutton.cms.gov/v1/accounts/mfa/login

![Register a sandbox app](/assets/img/blog/register_sandbox_app.png)
 
-	Select Application Registration
-	Select Register New Application
-	Enter details for your application
    -	Pick a name. e.g. Your Name + “FHIR Dev Days”
    -	Client Type = Confidential
    -	Authorization Grant Type = Authorization Code
    -	Redirect URIs = http://localhost:8000/callback + any others you want to use. 
    -	Agree to the Terms of Service.
-	Save the registration
-	Copy the Client ID and Client Secret
-	Logout 

### Build a callback handler

-	Download and install a version of Python 3 ( https://www.python.org/downloads/ )

### Create a virtual environment:
    
    mkdir demo
    cd demo
    python -m venv ./virtualenv

### activate the virtualenv

    source ./virtualenv/bin/activate
    git clone https://github.com/ekivemark/bluebutton-callback-handler.git
    cd ./bluebutton-callback-handler

### install supporting libraries

    pip install -r requirements.txt

-	Edit the callback.py file to add
    -	Client_id
    -	Client_secret
-	Run the callback-handler

    Python callback.py

-	Open your browser
-	Go to http://localhost:8000/
-	Login with a synthetic Medicare account:
    -	BBUser12345
    -	PW12345!

Sample data:

    {
      "curl_coverage_url": "curl -s --header 'Authorization: Bearer 7wsYwYjtoBw3mBIBGX420IonfZJ1AL' 'https://sandbox.bluebutton.cms.gov/v1/fhir/Coverage' ", 
      "curl_eob": "curl -s --header 'Authorization: Bearer 7wsYwYjtoBw3mBIBGX420IonfZJ1AL' 'https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit' ", 
      "curl_patient_url": "curl -s --header 'Authorization: Bearer 7wsYwYjtoBw3mBIBGX420IonfZJ1AL' 'https://sandbox.bluebutton.cms.gov/v1/fhir/Patient/19990000001233'", 
      "oauth_token": {
        "access_token": "7wsYwYjtoBw3mBIBGX420IonfZJ1AL", 
        "expires_at": 1529124810.112087, 
        "expires_in": 36000, 
        "patient": "19990000001233", 
        "refresh_token": "UTbxZonRKCKAByMmlfcPvKqnKiXhrb", 
        "scope": [
          "profile", 
          "patient/Coverage.read", 
          "patient/Patient.read", 
          "patient/ExplanationOfBenefit.read"
        ], 
        "token_type": "Bearer"
      }
    }

-	Copy and paste the curl commands into a terminal window to view Blue Button FHIR Resources.

## Requirements
- Internet connection
-	Web Browser
-	Python 3 (download from https://www.python.org/downloads/)
-	Github.com/ekivemark/bluebutton-callback-handler


