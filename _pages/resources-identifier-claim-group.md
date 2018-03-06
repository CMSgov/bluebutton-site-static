---
layout: layout-for-data-tables
title: 'Claim Group IDs'
permalink: '/resources/identifier/claim-group/'
---
# Identifier System: Claim Group IDs

## Usage

**System URI**: `https://bluebutton.cms.gov/resources/identifier/claim-group`
**Appears In:** <code><a href="http://hl7.org/fhir/STU3/explanationofbenefit-definitions.html#ExplanationOfBenefit.identifier">ExplanationOfBenefit.identifier</a></code>

This FHIR <code><a href="http://hl7.org/fhir/STU3/datatypes.html#identifier">Identifier</a>.system</code> value is used for `Identifier`s that designate a particular claim/event's Claim Group ID. Such `Identifier`s will be present for all `ExplanationOfBenefit` resources returned by the API.

## Background

Medicare claims/events can have a complex lifecycle, and may be updated over time as medical practitioners resubmit them, to correct inaccuracies and resolve other issues. Each such resubmission may result (depending on when it is filed and when our data extraction process occurs) in new `ExplanationOfBenefit` resources in the Blue Button 2.0 API, with unique `ExplanationOfBenefit.id` values.

The Claim Group ID helps to track that evolution across time:

* Each resubmission of an original claim/event will be grouped together with the same Claim Group ID.
* Older `ExplanationOfBenefit` resources in a Claim Group that have been superceded will have `ExplanationOfBenefit.status` updated to "`cancelled`" and `ExplanationOfBenefit.disposition` also updated to "`cancelled`".
* Newer `ExplanationOfBenefit` resources in a Claim Group that are current will have an `ExplanationOfBenefit.status` of "`active`" and also an `ExplanationOfBenefit.disposition` of "`active`".
* It's important to note that more than one `ExplanationOfBenefit` resource sharing the same Claim Group ID may be "`active`" at one time, as claims are split up and/or merged during their evolution.

<!-- The following statement may not be true, depending on whether or not it horrifies any of the FHIR spec folks. Conversation here: https://chat.fhir.org/#narrow/stream/implementers/topic/Default.20Search.20Filters -->
As most API users are only interested in seeing the most recent version of each claim/event the Blue Button 2.0 API filters out "`cancelled`" `ExplanationOfBenefit` resources by default. This can be overridden by specifying "`?disposition=*`" or "`?disposition=cancelled`" in the search. For example:

    https://sandbox.bluebutton.cms.gov/v1/fhir/ExplanationOfBenefit/?disposition=*
