---
layout: post
title: ­Get Just the Claims Data You Need
date:  2020-07-29 6:00 AM -0600
categories: latest
permalink: /blog/:title
published: false
badge: blog
hero-image: /assets/img/blog/hero-images/get-just-the-claims-data-you-need.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/get-just-the-claims-data-you-need.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

The Blue Button 2.0 API team is excited to announce feature enhancements that will enable third-party partner applications to request only the claims data they need. These enhancements will allow apps to request certain claim types, such as Medicare Part D Pharmacy Claims (PDE), or only request new claims information since the last updated date.

The BB2.0 API team believes that building more flexibility into the API will enable applications to deliver a better experience to beneficiary end users, including faster response times.

To enable application developers to retrieve ExplanationOfBenefit (EOB) resources that more closely match their needs, two new query parameters have been introduced for the EOB resource:
- `type`
- `_lastUpdated`

## Query by Type

Many developers are interested in specific claim types, such as PDE. The query by type feature will allow applications to request just those claims. This will enable applications to process and download data more quickly and efficiently.

`ExplanationOfBenefit` resources fall into 8 types:
- `CARRIER`
- `DME`
- `HHA`
- `HOSPICE`
- `INPATIENT`
- `OUTPATIENT`
- `PDE`
- `SNF`

Currently, when requesting the EOBs for a beneficiary, the FHIR API returns all of these claim types.  By enabling the Type query parameter in the Blue Button 2.0 API, apps can now request specific claim types. For example, to request only Part D drug claims, add the query parameter:

```
 ?type=pde
```

To request multiple claim types, an app will need to make separate requests -- one for each claim type. If you concatenate claim types, only the last type in the string is used.

For instance, in the following example only the carrier claims will be returned:

```
&type=pde,carrier
```

The full list of claim types are:

```
‘carrier’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier’,
```
```
‘pde’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|pde’,
```
```
‘dme’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|dme’,
```
```
‘hha’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|hha’,
```
```
‘hospice’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|hospice',
```
```
‘inpatient’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient’,
```
```
‘outpatient’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|outpatient’,
```
```
‘snf’, ‘https://bluebutton.cms.gov/resources/codesystem/eob-type|snf’,
```

It is important to use lower case when requesting a claim type. If you submit an invalid combination of claim types or use the wrong case, you’ll see a message like this:

```
{
  “detail”: “not a valid value”
}
```

The status code for this message is a 400 Bad Request.

### Examples:

In the sandbox there are synthetic beneficiaries with four of the eight claim types:
- `carrier`
- `inpatient`
- `pde`
- `outpatient`

Let us take a synthetic beneficiary record: 

Username: 

```
BBUser20023
```
Password:
```
PW20023!
```

The FHIR ID for this beneficiary is:
```
-20140000000024
```

Let us do a regular ExplanationOfBenefit request:

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/
```

This bundle identifies 148 claims, returning the first 10. Here is how the start of the bundle will look:

```
{
  “resourceType”: “Bundle”,
  “id”: “9562c9b7-df79-419a-a94b-ef8cc9347e0e”,
  “meta”: {
    “lastUpdated”: “2019-11-05T22:05:48.257-05:00”
  },
“type”: “searchset”,
“total”: 148,
“link”: [
  {
    “relation”: “first”,
    “Url”:    “https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit?_count=10&startIndex=0&patient=-20140000000024”
  },
…
```

There are three claim types in this beneficiary’s record:
- Carrier (44)
- Inpatient(1)
- PDE(103)

The queries to request each claim type individually would be:

#### Carrier Claims

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=carrier
```

or

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|carrier
```

#### Inpatient Claims

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=inpatient
```

or

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|inpatient
```

#### PDE Claims

Since many of our developers are interested in the Part D drug claims it is now possible to query for only PDE-type claims.

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=pde
```

or 

```
https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?type=https://bluebutton.cms.gov/resources/codesystem/eob-type|pde
```

## Query By _lastUpdated

The HL7 FHIR specification provides a Meta section in each resource. The lastUpdated field represents the date and time of the last update. This takes the format of an “instant” type:

```
YYYY-MM-DDThh:mm:ss.sss+zz:zz.
```

Examples of this format are:
- `2015-02-07T13:28:17.239+02:00`
- `2017-01-01T00:00:00Z`

The HL7 FHIR specification also provides a _lastUpdated query parameter for the search operations on the end-points. By using the _lastUpdated query parameter, an application will be able to request only the records that have changed before or after a specific date. If you keep track of the date of a previous request, you can request just the changes since your previous request. The format of this request would be:

```
https://sandbox.bluebutton.cms.gov/v1/fhir/Patient?_id=-19990000000001&_lastUpdated=gt2020-02-13T08:00:00-05:00&_format=application%2Fjson%2Bfhir’
```

The output from that request would look like this:

```
/v1/fhir/Patient?_id=-19990000000001&_lastUpdated=gt2020-02-13T08:00:00-05:00&_format=application%2Fjson%2Bfhir’
{
  “resourceType”: “Bundle”,
  “id”: “7d8ff6a1-95f9-4210-b08b-58a96ea74494”,
  “meta”: {
    “lastUpdated”: “2020-02-14T08:57:16.641-05:00”
},
“type”: “searchset”,
“total”: 1,
“link”: [
  {
    “relation”: “self”,
  “url”: “https://prod-sbx.bfdcloud.net/v1/fhir/Patient?_format=application%2Fjson%2Bfhir&_id=-19990000000001&_lastUpdated=gt2020-02-13T08%3A00%3A00-05%3A00”
  }
],
“entry”: [
  {
    “resource”: {
      “resourceType”: “Patient”,
      “id”: “-19990000000001”,
      “meta”: {
        “lastUpdated”: “2020-02-13T21:53:06.017-05:00”
    },
“extension”: [
…
```

<div class="ds-c-alert ds-c-alert--hide-icon ds-u-margin-bottom--2">
  <div class="ds-c-alert__body">
    <h3 class="ds-c-alert__heading">Note:</h3>
    <p class="ds-c-alert__text">
      Do not input dates before 2020-02-12 with <code>_lastUpdated</code>. Limitations of our backend service prevent data before 2020-02-12 from being tagged correctly.
    </p>
  </div>
</div>

The BB2.0 API supports operators for less than (`lt`), greater than (`gt`), less than or equal (`le`), and greater than or equal (`ge`) the specified instant. It is also possible to specify a time interval by using two `_lastUpdated` parameters like this:

```
‘/v1/fhir/ExplanationOfBenefit?patient=Patient/-19990000000001&_lastUpdated=gt2020-02-13T08:00:00-05:00&_lastUpdated=lt2020-02-14T08:00:00-05:00&_format=application%2Fjson%2Bfhir’
```

### Which Beneficiaries have updated records?

Initially, all resources in production were given a lastUpdate value of 2020-01-01T00:00:00-00.00. The BB2.0 API started tracking lastUpdate values in February of 2020. So no resources have lastUpdate values before these dates. Do not input dates before 02-12-2020 with _lastUpdated.

### Which Synthetic Beneficiaries have updated records?

Here is a CSV file that identifies the updated synthetic patient records and their associated Medicare beneficiary user accounts:

<a class="ds-c-button ds-u-margin-y--2 ds-c-button--solid" href="{{site.baseurl}}/assets/developer-resources/Prod-Sandbox-SyntheticData-LastUpdated.csv">Download Updated Synthetic Beneficiary CSV File</a>

More details are provided in the [search parameters page of the FHIR specification](https://www.hl7.org/fhir/search.html#3.1.1). The `gt` prefix is one of the values permitted as defined in the [prefix section of the search specification](https://www.hl7.org/fhir/search.html#prefix).

### Experiment with the new search parameters

The new selection parameters are live in the sandbox and production environments today. Try them out in the sandbox and let us know about your experience in the Google Group. Be sure to let our team know if this helps you more easily select the records you really want. Our team looks forward to seeing how you put this new capability to work.

As always, please give us your feedback. You can let us know your experience with this new feature by posting a message in our Google Group.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
