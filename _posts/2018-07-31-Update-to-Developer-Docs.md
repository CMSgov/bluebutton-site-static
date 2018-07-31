---
layout: post_with_category
title: Update to Developer Documentation
date:  2018-07-31 2:30 PM -0600
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
extra_links:
 - title: Blog Index
   link: /blog/index.html
---
# Accessing Synthetic Sandbox Data

The Google Support forum is a vibrant place. 
We are always monitoring comments and questions there. 

A question that has come up on a number of occasions has been when developers first 
start working with the Blue Button 2.0 API because it requires authentication and
authorization using the OAuth2.0 protocol.

We have updated the [Developer Documentation](https://bluebutton.cms.gov/developers/) to
make **Step 5** - Accessing Synthetic Data easier to understand.

The problem appears to be that if you attempt to authenticate by going directly to 
[accounts.mymedicare.gov](https://mymedicare.gov) the authentication will fail. 
Instead you should login by going to [https://sandbox.bluebutton.cms.gov/v1/o/authorize/](https://sandbox.bluebutton.cms.gov/v1/o/authorize/).

Here is the new **Step 5** from the Developer Documentation. Give it a try and 
let us know if we can make the steps more bulletproof.

**Step 5:** Accessing Synthetic Data
In order to access the full synthetic dataset, you can do the following:
1. Set up your sandbox application
2. Log out of [https://sandbox.bluebutton.cms.gov](https://sandbox.bluebutton.cms.gov).
3. Access the authorization url at [https://sandbox.bluebutton.cms.gov/v1/o/authorize/](https://sandbox.bluebutton.cms.gov/v1/o/authorize/) 

    *Note: The last backslash is important*.
    *Also remember to append ?client_id={your client_id asigned to the application you registered}*

4. You will be redirected to the Medicare authentication screen on. DO NOT ACCESS THIS PAGE DIRECTLY. 
5. Use one of thirty thousand provided usernames and passwords. 

    The first user is BBUser00000, with password PW00000!, and these sample users continue all the way to BBUser29999, with password PW29999!. 
    
    *Note: the ! at the end of the password is required*.

6. Approve access for your application, which will now receive an access token, which can be used in the requests described above.

7. The authorization completes when you are redirected back to the Redirect_URI you specified when you registered your application.

If you have questions, or comments, head over to the 
[Google Support Forum](https://groups.google.com/forum/#!forum/developer-group-for-cms-blue-button-api) and post it there.


---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
