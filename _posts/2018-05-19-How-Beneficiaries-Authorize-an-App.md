---
layout: post_with_category
title: How Beneficiaries Authorize an App
date:   2018-05-19 23:00:00 -0600
categories: latest general
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
# How does a beneficiary grant access to their data
One of the frequent questions we get is: "How does a beneficiary grant access to their claims information to an application.

Let's look at this step-by-step.

As a developer, let's assume that you have successfully submitted an application to the Blue Button Production API. You have your credentials and have implemented them in your application, or web site.

*What happens next?*

## Discovery
A Medicare beneficiary discovers your app and creates an account. 
As they navigate your application they see an option to connect with Medicare and share 
their claims data with your application. 
 
## Connecting
The Beneficiary clicks the link in your application and is connected to the Blue Button 2.0 API.

## Authenticating with MyMedicare.gov
The Blue Button 2.0 API does not recognize the person connecting to the API so a login screen is presented to enable the Beneficiary to authenticate.

![MyMedicare Beneficiary Sign-in screen](/assets/img/blog/beneficiary_auth_screen.png)

There are four tracks a beneficiary can take from this sign in page:

1. Cancel: The beneficiary doesn't authenticate
2. Forget their credentials: Click "Trouble Signing In to reset their credentials.
3. Create an Account: If the Beneficiary doesn't have a MyMedicare.gov account
4. Sign In: Correctly enter the account credentials.

### 1. Cancel:
When the beneficiary chooses cancel the Login page will be redisplayed. 

We considering upgrading this condition to redirect back to the application with the state value your app provided in order 
and an error condition. This would enable applications to map the response back to the user in the app that made the request and chose to cancel.

### 2. Forgotten credentials
The "**Trouble Signing in**" link would be used by the beneficiary if they are unable to remember their User name and/or Password, or are unsure if they have a MyMedicare account.

![Trouble with Access screen](/assets/img/blog/beneficiary_trouble_screen.png)

As a minimum the beneficiary will need the following information to reset or check their credentials:
	- Medicare Number
	- Last Name
	- Suffix (if appropriate)
	- Date of Birth

After providing this information and answering a challenge question the Beneficiary will be led through further pages until credentials are reset.

### 3. Create an Account:

If a Beneficiary does not have an account on MyMedicare.gov they can create one using the "Create Account" link.

In order for a beneficiary to sign up for a MyMedicare.gov account they will need their Medicare card. 
This has their Medicare Number and their Medicare Part A and Part B eligibility dates.

In our [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) we have seen a 
number of questions posed about Medicare Advantage Beneficiaries. Medicare Advantage Pharmacy information 
(Part D claims) are found in the Blue Button 2.0 API. The question that is raised is how does a beneficiary 
register a MyMedicare.gov account in order to access their pharmacy claims if they don't have a Medicare Part A or Part B plan.  
The answer is that a beneficiary should refer to their Medicare card and enter the eligibility date for their Part A
or Part B plan. A beneficiary does not have to be an active Part A or Part B plan in order to create a 
MyMedicare.gov online account.

The other information needed to apply for a MyMedicare.gov account is: 

- Last name
- Date of Birth
- Gender
- Five digit zip code

#### Step 1 - Enter Your Information: 
The screens to create an account are shown below:
![Create an Account](/assets/img/blog/beneficiary_registration_screen_1a.png)
![Create an Account](/assets/img/blog/beneficiary_registration_screen_1b.png)

Check the boxes at the bottom of the page:
![Create an Account](/assets/img/blog/beneficiary_registration_screen_1c.png)

When the **continue** button is clicked a security popup will be displayed. 
Click **ok** to continue:
![Create an Account](/assets/img/blog/beneficiary_registration_screen_1d.png)


#### Step 2 - Address Verification:
Medicare checks a beneficiary's address against information provided by the Social Security Administration. 
If their address has changed they should go to the Social Security Administration and update 
their address there. The online link to do an address update is: 
[https://www.ssa.gov/myaccount/](https://www.ssa.gov/myaccount/)

It can take 7-14 days for the address change to be updated in the Medicare system.

The address verification is the next page to be displayed. This is Page 2 of 4:

![Create an Account](/assets/img/blog/beneficiary_registration_screen_2a.png)

#### Step 3 - Register a Username and Password:

Create a Username, Choose a secret question and enter an Answer, optionally enter 
an Email Address and create a Password:
![Create an Account](/assets/img/blog/beneficiary_registration_screen_3a.png)
![Create an Account](/assets/img/blog/beneficiary_registration_screen_3b.png)
![Create an Account](/assets/img/blog/beneficiary_registration_screen_3c.png)

#### Step 4 - Confirmation:

If the three previous pages are successfully completed a confirmation screen will be 
displayed with the username and the date that the account was created.

### 4. Sign in:

The Sign In option is the option to choose when a beneficiary wants to authorize an application. 
Clicking the **Sign in** button passes the beneficiary to the next step where they will authorize access of 
their data to the application.

## Authorize an Application

The Authorization screen looks something like this:

![Authorize an Application](/assets/img/blog/beneficiary_authorization_screen.png)

The screen asks the beneficiary if they want to give the named application access to:

- At least four years of their Medicare claims information
- Access to their profile and demographic information (name, address, date of birth etc.)
- Make copies of that data 
- Return to the Blue Button 2.0 API and retrieve new information until a beneficiary goes to MyMedicare.gov and revokes the application's access permissions

There are two options:

1. **Yes, approve access**
2. *No, do not approve access*

### Yes, approve access

If the beneficiary chooses the **Yes** option the Blue Button 2.0 API calls back to the third party application 
with a token that enables the application to access the API.

If a beneficiary wants to revoke access to your application at a future time they will need to use go to 
[MyMedicare.gov](https://mymedicare.gov), login using their Medicare Username and password and go to the 
application dashboard in their profile to revoke access permission to your application.

### No, do not approve access

If the beneficiary decides not to give the application access to their claims information the Blue Button 2.0 API calls back
to the application with an "Access Denied" error.

After navigating these screens the Beneficiary is returned to your application. If they provided approval your application
will be able to take the token that is returned and use it in accessing the Blue Button 2.0 API to retrieve the 
beneficiary's data.

We welcome your feedback on this post. Go to the [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) 
to give us feedback. 
