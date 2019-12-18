---
layout: post
title: Blue Button 2.0 API Update
date:  2019-12-16 6:00 AM -0600
categories: latest
permalink: /blog/:title
badge: blog
hero-image: /assets/img/blog/hero-images/bbapi-update.jpg
hero-thumb: /assets/img/blog/hero-images/thumbnails/bbapi-update.jpg
extra_links:
 - title: Blog Index
   link: /blog/index.html
---

On December 4th, a third-party application partner reported a data anomaly with the Blue Button 2.0 API (BB2.0). CMS verified the anomaly and immediately suspended access to the production environment. We discovered a bug in the BB2.0 codebase which may be causing certain beneficiary protected health information to be inadvertently shared with another beneficiary or the wrong BB2.0 application. 

The privacy and security of beneficiary health information is our top priority. CMS is contacting affected beneficiaries and third-party applications directly. Access to BB2.0 remains closed while we conduct a full review. Restoration of service is pending resolution of the issue. 

Please note that this issue only impacts BB2.0, not Plan Finder, Medicare.gov, or any other system. We have not detected any intrusion by unauthorized users and system integrity has not been compromised by any external source.

## What happened?

Medicare beneficiaries use BB2.0 to authorize third-party applications to access their own Medicare claims data. The BB2.0 system verifies user credentials with a CMS identity management system, ensuring correct beneficiary data is passed to the third-party application. In order to do this, BB2.0 identifies beneficiaries based on a randomly generated, unique user ID returned by the identity management system. We discovered BB2.0 was truncating a 128-bit user ID to a 96-bit user ID. The 96-bits remaining were not sufficiently random to uniquely identify a single user. This resulted in the same truncated user ID being assigned to different beneficiaries. Because BB2.0 was truncating the user ID provided by the identity management system, some beneficiaries with the same truncated ID were passed data pertaining to other users via BB2.0.

The root cause for the incident is clear and CMS is taking steps to better understand how this bug occurred. Early takeaways include:
- Code Review – The current BB2.0 team has a strong culture of code review in place. The code that caused this bug was committed on January 11, 2018. Based on check-in notes around the change, it appears that a comprehensive review was not completed. A more comprehensive review may have identified this coding error.  
- Testing – CMS uses synthetic data to test BB2.0 to verify functionality without risking beneficiary personal health information (PHI). In an attempt to protect PHI, integration with other systems, such as the identity management system, was not tested. Early reviews of test scenarios would have highlighted the gap in integration testing.  
- Cross Team Collaboration – The code that generates the user ID token is run by a separate identity management team. Assumptions were made by the BB2.0 team about how the token works and were not validated. Better collaboration across enterprise teams could have ensured that necessary information was present in decision making.

## What is CMS doing now? 

CMS is taking several steps to address these takeaways. The BB2.0 team has implemented an enhanced quality review and validation process to ensure code issues like this one are caught before any new code is committed to BB2.0 or any CMS APIs. The team is implementing additional monitoring and alerting for BB2.0.  This will enhance CMS’s ability to track BB2.0’s use.

CMS is updating BB2.0 code to store the full user ID instead of a truncated version. All users will be asked to re-authenticate with BB2.0 to allow the system to generate a new user ID. In addition, the team is conducting a full code review and implementing any necessary changes to protect against this type of error in the future. 

This technical issue potentially affected less than 10,000 beneficiaries and 30 apps. It was contained to Blue Button 2.0 API authorized users and developers – not Medicare beneficiaries more broadly or outside entities. CMS will communicate directly with affected beneficiaries in the coming weeks through a letter. After the agency completes an in-depth analysis of the impact to affected beneficiaries, CMS will determine necessary additional protections to offer affected beneficiaries (e.g., credit monitoring, a Special Enrollment Period).

CMS will be contacting production apps directly in the next two weeks to provide more information about specific next steps for them to take.   

## What is CMS doing prior to restoring service? 

CMS has implemented new processes for documenting code changes, improvements include:
- All code changes use a template that surfaces the reason, intention, and consequences of the change.
- All code commits are descriptive and testing must be conducted for changes.
- A request for comment process has been implemented that requires developers to document system behavioral changes.
- Test scenarios are reviewed and documented to confirm code has the intended impact.

Before restoring the BB2.0 API, the team will be implementing a layered approach to audit tracking.
- Auditing will be enabled at the database level, to log from the bottom up, as well as at the API level. This additional logging will provide more details into user activity and provide more traceability into actions taken by the API. 
- Monitoring and alerting will be enhanced to notify CMS of any unexpected changes in the data to ensure unintended changes are prevented. 

A timeline is not yet available for when service will be restored, but we will continue to provide updates as they are available.

**Impacted Applications:**
- 1upHealth
- Achievement
- Advise delivered by Ascend Quote & Enrollment
- Allwell - Absolute Total Care delivered by Ascend Quote & Enrollment
- Allwell - Arizona Complete Health delivered by Ascend Quote & Enrollment
- Allwell - Arkansas Health & Wellness delivered by Ascend Quote & Enrollment
- Allwell - Buckeye Health Plan delivered by Ascend Quote & Enrollment
- Allwell - Home State Health delivered by Ascend Quote & Enrollment
- Allwell - Louisiana Healthcare Connections delivered by Ascend Quote & Enrollment
- Allwell - Magnolia Healthplan delivered by Ascend Quote & Enrollment
- Allwell - Sunflower Health Plan delivered by Ascend Quote & Enrollment
- Allwell - Superior Health Plan delivered by Ascend Quote & Enrollment
- Ascension Complete - Florida
- Ascension Complete - Kansas delivered by Ascend Quote & Enrollment
- BlueButtonPro
- DocSpera
- Enroll Hero
- Evidation on behalf of Heartline
- Get Your Health Record
- Human API
- Humana
- iBlueButton
- Medicare Suggest
- MedRecordsConnect
- myFHR
- Project Baseline
- Project Seamless
- Prominence Health Plan delivered by Ascend Quote & Enrollment
- Rush University Medical Center
- Trusty.care

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
