---
layout: layout-for-data-tables
title: 'Benefit Balance Coding'
permalink: '/resources/codesystem/benefit-balance/'
---
# Coding System: Benefit Balance

## Usage

**System URI**: `https://bluebutton.cms.gov/resources/codesystem/benefit-balance`

**Appears In:** 
* <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.benefitBalance">ExplanationOfBenefit.benefitBalance</a></code>
* <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.benefitBalance.category">ExplanationOfBenefit.benefitBalance.category</a></code>
* <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.benefitBalance.name">ExplanationOfBenefit.benefitBalance.name</a></code>
*  <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.benefitBalance.description">ExplanationOfBenefit.benefitBalance.description</a></code>

This FHIR <code><a href="http://hl7.org/fhir/STU3/datatypes.html#coding">Coding</a>.system</code> value is used for the `Coding`s that best identifies the benefit balance for each `ExplanationOfBenefit` (EOB) resource. Such `Coding`s are used in all `ExplanationOfBenefit` resources returned by the API.

## Values

This variable is coded, and will contain one of the following values.

**Values for Codeset**:

| Value    | Description                          |
|----------|--------------------------------------|
| dental   | Dental
| Vision   | Vision
| medical  | Medical
| rehab    | Rehab
| pharmacy | Pharmacy


