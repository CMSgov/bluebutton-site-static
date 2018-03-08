---
layout: layout-for-data-tables
title: 'EOB Type Coding'
permalink: '/resources/codesystem/eob-type/'
---
# Coding System: EOB Type

## Usage

**System URI**: `https://bluebutton.cms.gov/resources/codesystem/eob-type`

**Appears In:** <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.type">ExplanationOfBenefit.type</a></code>

This FHIR <code><a href="http://hl7.org/fhir/STU3/datatypes.html#coding">Coding</a>.system</code> value is used for the `Coding`s that best identifies the claim/event for each `ExplanationOfBenefit` (EOB) resource. Such `ExplanationOfBenefit.type` `Coding`s will be present for all `ExplanationOfBenefit` resources returned by the API.

The `ExplanationOfBenefit.type` field will contain multiple `Coding`s, based on the type of claim/event that the EOB represents. At the moment, only the BBAPI-specific `eob-type` `Coding` is guaranteed to be present for every EOB, and so it's the one that API authors are recommended to make the most use of. This is particularly critical since the data/fields available in the EOBs vary dramatically for each `eob-type`. For example, API users should not expect that the fields present in a "`CARRIER`" EOB will also be present in an "`HHA`" EOB; **the data schema for each claim/event type is quite different!**

<!-- TODO: Once available, this would be a great place to link to our EOB profiles, since we'll have one for each eob-type. -->

## Values

The following table lists all of the claim/event EOB types, along with how they're mapped for each of the possible `ExplanationOfBenefit.type` `Coding`s.

<table class="ds-c-table">
  <caption>ExplanationOfBenefit.type Coding Values</caption>
  <thead>
    <tr>
      <th scope="col">BBAPI<br /><code><a href="https://bluebutton.cms.gov/resources/codesystem/eob-type">eob-type</a></code></th>
      <th scope="col">FHIR<br /><code><a href="http://hl7.org/fhir/STU3/valueset-claim-type.html">ex-claimtype</a></code></th>
      <th scope="col">Medicare<br /><code><a href="https://bluebutton.cms.gov/resources/variables/nch_clm_type_cd">nch_clm_type_cd</a></code></th>
      <th scope="col">Medicare<br /><code><a href="https://bluebutton.cms.gov/resources/variables/nch_near_line_rec_ident_cd">nch_near_line_rec_ident_cd</a></code></th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th><code>CARRIER</code></th>
      <td><code>professional</code></td>
      <td><code>71</code> or <code>72</code></td>
      <td><code>O</code></td>
      <td><a href="https://www.medicare.gov/what-medicare-covers/part-b/what-medicare-part-b-covers.html">What Part B Covers</a></td>
    </tr>
    <tr>
      <th><code>DME</code></th>
      <td><em>(no coding)</em></td>
      <td><code>81</code> or <code>82</code></td>
      <td><code>M</code></td>
      <td><a href="https://www.medicare.gov/what-medicare-covers/part-b/durable-medical-equipment.html">What Part B Covers: Durable Medical Equipment</a></td>
    </tr>
    <tr>
      <th><code>HHA</code></th>
      <td><em>(no coding)</em></td>
      <td><code>10</code></td>
      <td><code>U</code> or <code>V</code> or <code>W</code></td>
      <td><a href="https://www.medicare.gov/coverage/home-health-services.html">What Part A Covers: Home Health Services</a></td>
    </tr>
    <tr>
      <th><code>HOSPICE</code></th>
      <td><code>institutional</code></td>
      <td><code>50</code></td>
      <td><code>V</code></td>
      <td><a href="https://www.medicare.gov/what-medicare-covers/part-a/part-a-coverage-hospice.html">What Part A Covers: Hospice</a></td>
    </tr>
    <tr>
      <th><code>INPATIENT</code></th>
      <td><code>institutional</code></td>
      <td><code>60</code></td>
      <td><code>V</code></td>
      <td><a href="https://www.medicare.gov/coverage/hospital-care-inpatient.html">What Part A Covers: Inpatient Hospital Care</a></td>
    </tr>
    <tr>
      <th><code>OUTPATIENT</code></th>
      <td><code>professional</code></td>
      <td><code>40</code></td>
      <td><code>W</code></td>
      <td><a href="https://www.medicare.gov/what-medicare-covers/part-b/what-medicare-part-b-covers.html">What Part B Covers</a></td>
    </tr>
    <tr>
      <th><code>PDE</code></th>
      <td><code>pharmacy</code></td>
      <td><em>(no coding)</em></td>
      <td><em>(no coding)</em></td>
      <td><a href="https://www.medicare.gov/part-d/coverage/part-d-coverage.html">What Drug Plans Cover</a></td>
    </tr>
    <tr>
      <th><code>SNF</code></th>
      <td><code>institutional</code></td>
      <td><code>20</code> or <code>30</code></td>
      <td><code>V</code></td>
      <td><a href="https://www.medicare.gov/what-medicare-covers/part-a/part-a-coverage-skilled-nursing-facilities.html">What Part A Covers: Skilled Nursing Facility Care</a></td>
    </tr>
  </tbody>
</table>
