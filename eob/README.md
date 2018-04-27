Anatomy of BlueButton API FHIR ExplanationOfBenefit Responses
=============================================================


BlueButton  API FHIR responses contain these FHIR Resource types.


* `Patient`
* `Coverage`
* `ExplanationOfBenefit` (EOB)


The purpose of this document is provide more detailed descriptions of the complex resource the `ExplanationOfBenefit`. `ExplanationOfBenefit` is often abbreviated as EOB.  The official documentation for the EOB is here http://hl7.org/fhir/explanationofbenefit.html.


As per the FHIR specification, if you query the API as a search operation, a `Bundle` will instead be returned containing one or more search results.  When it comes to the `Patient` resource, only one record will ever be returned.   `Coverage` usually as only a handful of entries per patient as well.  `ExplanationOfBenefit` on the other hand can have hundreds of entries.  The BB API support paging to help developers step through potentially huge responses.  by default, only 10 records are returned.  The maximum number of records that can be queries at one time is 50.  This means that developers must use paging to obtain all information when the number of EOBs is greater than 50.


Types of EOBs
-------------

The Blue Button API defines several "EOB types". These are:


* `CARRIER` - Routine office visits, etc. (Part B) [See Example](https://github.com/TransparentHealth/bluebutton-site-static/blob/CBBP-938/eob/carrier/carrier.md)
* `DME` - Durable Medical Equipment. (Part B)
* `HHA` - Home Health Services. (Part A)
* `HOSPICE` -  Hospice. (Part A)
* `INPATIENT` - Inpatient Hospital Care (Part A)  [See Example](https://github.com/TransparentHealth/bluebutton-site-static/blob/CBBP-938/eob/inpatient/inpatient.md)
* `OUTPATIENT` - Outpatient (Part B)
* `PDE` - Pharmacy (Part D)  [See Example](https://github.com/TransparentHealth/bluebutton-site-static/blob/CBBP-938/eob/pde/pde.md)
* `SNF` - Skilled Nursing Facility (Part A)

The current version of FHIR (STU 3) does not have a direct one-to-one mapping between the `eob-type` and the `ex-claimtype`. Please see https://bluebutton.cms.gov/resources/codesystem/eob-type  for more detailed information.  Based on the EOB type, the anatomy of the EOB resource will differ.  Currently, in the sample synthetic data set only `CARRIER`, `INPATIENT`, and, `PDE`.

