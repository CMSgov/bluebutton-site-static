---
layout: post
title: Expanding access to data by adding data elements
date:  2021-01-21 6:00 AM -0600
categories: latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/expanding-access-to-data-by-adding-data-elements.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/expanding-access-to-data-by-adding-data-elements.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

# Expanding access to data by adding data elements

The Blue Button 2.0 API will be adding support for 13 new data elements.
As part of this change, one (1) data element will also be removed as it
has become out of sync with the source of our address-related data.

## Important! Data Element to be Removed in February 2021: 

Beginning in early February, we will no longer be mapping and sending
the beneficiary county code field. Please ensure your applications are
updated accordingly.

-   Beneficiary County Code:
    -   **CCW Field Name:** `BENE_COUNTY_CD`
    -   **FHIR element Name:** `Patient.address.district`

## New Data Elements Available in Early 2021:

-   **Claim Health Insurance Prospective Payment System Uncompensated Care Amount:** 
    -   **CCW Field Name:** `CLM_UNCOMPD_CARE_PMT_AMT`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** This field identifies the payment for disproportionate share hospitals (DSH). It represents the uncompensated care amount of the payment. Comments: This field applies only to inpatient claims.

-   **Previous Identifier Effective Date:** 
    -   **CCW Field Name:** `EFCTV_BGN_DT`
    -   **FHIR element Name:** `explanationofbenefits.period.start`
    -   {:.ds-u-padding-bottom--2}**Description:** Previous Identifier Effective Date

-   **Previous Identifier Obsolete Date:** 
    -   **CCW Field Name:** `EFCTV_END_DT `
    -   **FHIR element Name:** `explanationofbenefits.period.end`
    -   {:.ds-u-padding-bottom--2}**Description:** Previous Identifier Obsolete Date

-   **Part B Carrier Claim Control Number:**
    -   **CCW Field Name:** `CARR_CLM_CNTL_NUM`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** The claim control number is an identifier
        assigned by the processing system (i.e., the Encounter Data
        System Contractor) to a claim.
        This is the field that, in combination with the original claim
        control number, identifies a unique version of a service
        record.

-   **FI Document Claim Control Number:** 
    -   **CCW Field Name:** `FI_DOC_CLM_CNTL_NUM`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** The historical final action algorithm used the
        original document control number (FI_ORIG_CLM_CNTL_NUM); the
        updated algorithm uses the current document control number
        (FI_DOC_CLM_CNTL_NUM) -- and employs all 23
        characters of the value rather than just the first 15
        characters. The updated algorithm also considers the claim
        accretion date (CWF_CLM_ACRTN_DT) when determining the sequence
        in which claims were processed.

-   **FI Original Claim Control Number:**
    -   **CCW Field Name:** `FI_ORIG_CLM_CNTL_NUM`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** The historical final action algorithm used the
        original document control number (FI_ORIG_CLM_CNTL_NUM); the
        updated algorithm uses the current document control number
        (FI_DOC_CLM_CNTL_NUM) -- and employs all 23
        characters of the value rather than just the first 15
        characters. The updated algorithm also considers the claim
        accretion date (CWF_CLM_ACRTN_DT) when determining the sequence
        in which claims were processed.

-   **Beneficiary Death Date:**
    -   **CCW Field Name:** `BENE_DEATH_DT`
    -   **FHIR element Name:** `Patient.deceased[x]`
    -   {:.ds-u-padding-bottom--2}**Description:** Indicates the date of death of the
        beneficiary.

-   **Claim Effective Date:**
    -   **CCW Field Name:** `NCH_WKLY_PROC_DT`
    -   **FHIR element Name:** `explanationofbenefits.information.timingDate`
    -   **Slice:** claimrecvddate
    -   {:.ds-u-padding-bottom--2}**Description:** The date the weekly NCH database load
        process cycle begins, during which the claim records are loaded
        into the Nearline file. This date 
        will always be a Friday, although the claims will actually be
        appended to the database subsequent to the date.

-   **Claim Line Institutional Revenue Center Date:**
    -   **CCW Field Name:** `REV_CNTR_DT`
    -   **FHIR element Name:** `explanationofbenefits.item.servicedate`
    -   {:.ds-u-padding-bottom--2}**Description:** This is the date of service for the revenue
        center record. However, it is populated only for home health
        claims, hospice claims, and Part B 
        institutional (HOP) claims. For home health claims, which are
        paid based on episodes that can last up to 60 days, this
        variable indicates 
        the dates for the individual visits.

-   **Claim Operational Indirect Medical Education Amount:**
    -   **CCW Field Name:** `IME_OP_CLM_VAL_AMT`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** This is one component of the total amount
        that is payable on PPS claims, and reflects the IME (indirect
        medical education) payments for
        operating expenses (such as labor) for the claim. There are two
        types of IME amounts that may be payable for many PPS claims;
        the 
        other type of IME payment is for the IME capital amount
        (variable called CLM_PPS_CPTL_IME_AMT). Both operating and
        capital IME 
        payments are components of the PPS, as well as numerous other
        factors.

-   **Claim Operational Disproportionate Amount:**
    -   **CCW Field Name:** `DSH_OP_CLM_VAL_AMT`
    -   **FHIR element Name:** `explanationofbenefits.extension`
    -   {:.ds-u-padding-bottom--2}**Description:** This is one component of the total amount
        that is payable on PPS claims, and reflects the DSH
        (disproportionate share hospital) payments
        for operating expenses (such as labor) for the claim. There are
        two types of DSH amounts that may be payable for many PPS
        claims; the 
        other type of DSH payment is for the DSH capital amount
        (variable called CLM_PPS_CPTL_DSPRPRTNT_SHR_AMT). Both operating
        and 
        capital DSH payments are components of the PPS, as well as
        numerous other factors.

-   **Date Beneficiary Enrolled in Hospice:** 
    -   **CCW Field Name:** `CLM_HOSPC_START_DT_ID `
    -   **FHIR Element:** `explanationofbenefits.information.timing.period`
    -   **Slice:** `admissionperiod`
    -   {:.ds-u-padding-bottom--2}**Description:** For Home Health prospective payment system
        (PPS) claims, the \'from\' date and the \'thru\' date on the RAP
        (Request for Anticipated
        Payment) initial claim must always match. The \"from\" date on
        the claim may not always represent the first date of
        services, 
        particularly for Home Health or Hospice care. To obtain the
        date corresponding with the onset of services (or admission
        date) use the 
        admission date from the claim (variable called CLM_ADMSN_DT for
        IP, SNF and HH - and variable called CLM_HOSPC_START_DT_ID
        for 
        HOS claims).

-   **Date Beneficiary Ended Hospice:**
    -   **CCW Field Name:** `NCH_BENE_DSCHRG_DT`
    -   **FHIR element Name:** `explanationofbenefits.information.timing.period  `
    -   **Slice:** `admissionperiod`
    -   {:.ds-u-padding-bottom--2}**Description:** The last day on the billing statement covering
        services rendered to the beneficiary (a.k.a \'Statement Covers
        Thru Date\').

As always, we welcome your feedback in response to this change. You can
share your experience by posting a message in our [Google Group](https://groups.google.com/g/developer-group-for-cms-blue-button-api?pli=1).

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
