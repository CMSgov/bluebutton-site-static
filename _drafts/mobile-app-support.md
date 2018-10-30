---
layout: default
---
# Native Mobile App Support
Native Mobile App Support follows the  [RFC 8252 - OAuth 2.0 for Native Apps](https://tools.ietf.org/html/rfc8252)  authentication flow utilizing the  [PKCE](https://tools.ietf.org/html/rfc7636)  extension and enables a custom URI scheme redirect.

The implementation of the  [RFC 8252](https://tools.ietf.org/html/rfc8252) specification enables developers to build mobile applications without requiring a proxy server to route  redirect calls to their mobile app.

The  [PKCE](https://tools.ietf.org/html/rfc7636)  extension provides a technique for public clients to mitigate the threat of a “man-in-the-middle” attack. This involves creating a  secret that is used when exchanging the authorization code to obtain an access token.

More details can be found about this flow on oauth.com. Check out this link: [Protecting Mobile Apps with PKCE - OAuth 2.0 Servers](https://www.oauth.com/oauth2-servers/pkce/).

## Registering your App for Mobile App Support
When you register you application you will want to specify a unique Custom URI Scheme. This should be a unique value that will not conflict with other Custom URI Schemes implemented on a user’s mobile device.

We recommend that you define your custom URI scheme using a reverse domain name notation. As we developed our own testing application we implemented a custom uri scheme of:

	- gov.cms.bluebutton.oauthtester

This equated to an oauthtester subdomain for the Bluebutton.cms.gov domain.

The reverse dns style custom uri scheme should then be coupled with the re-direct path on the mobile device that will handle the call back from the Blue Button 2.0 API.

For example:
	- tld.app.subdomain[.subsubdomain]:/callback/path/endpoint

A coding example of an OAuth 2.0 and PKCE flow is available here: [Authorization Code with PKCE Flow - OAuth 2.0 Playground](https://www.oauth.com/playground/authorization-code-with-pkce.html)

The Blue Button engineering team has also created a sample Android application. Ou can review or fork the code here:
[bluebutton-sample-client-android/README.md at master · dtisza1/bluebutton-sample-client-android · GitHub](https://github.com/dtisza1/bluebutton-sample-client-android/blob/master/README.md)

