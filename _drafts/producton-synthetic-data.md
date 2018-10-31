---
layout: default
---
# Blog: Synthetic data available in Production
Many of our developers have asked for a way to test their production access with synthetic data, just like they can do in our [sandbox](https://sandbox.bluebutton.cms.gov). It is something our Blue Button 2.0 Engineering team want to be able to do as well so that we can proactively test the performance of our production  API.

We are pleased to announce that our engineering team have been able to make this possible. We now have the same 30,000 synthetic beneficiaries and their associated synthetic claims records available in production.

## Accessing synthetic records in Production
Testing in production is ONLY available to developer applications that have been authorized for production access. You can learn more about the application process to enter production here:  [https://bluebutton.cms.gov/developers/#production-api-access](https://bluebutton.cms.gov/developers/#production-api-access)

Once you have been authorized and have received your production credentials you can test your app by accessing the production API endpoint at https://apii.bluebutton.cms.gov.

The synthetic records are available using the same userids and passwords used for the sandbox environment. 

## What are the differences between Sandbox and Production?
While the same userids and passwords are used in Sandbox and Production the FHIR Patient resource that is retrieved for each synthetic user is subtly different. 

As a Developer you should check that your application can handle a negative value for the FHIR Patient ID. That is because each synthetic FHIR Id has been prefixed with a minus sign. Therefore the numeric value for the FHIR Id, when handled as an integer, will be negative.

In the sandbox environment the synthetic beneficiary with the userid BBUser22183 would have a Patient ID: 

``` json
{
	”id”: “20140000002184”,
}
```
In production you would see for the same userid:

``` json
{
	”id”: “-20140000002184”,
...
}
```

This approach was used to avoid any possible co-mingling of real and synthetic information.

As always, we welcome your feedback - just head over to the [Google Group](https://groups.google.com/forum/#!forum/Developer-group-for-cms-blue-button-api) and leave us feedback.

