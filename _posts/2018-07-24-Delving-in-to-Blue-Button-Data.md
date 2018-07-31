---
layout: post_with_category
title: Delving in to Blue Button Data
date:  2018-07-24 2:30 PM -0600
categories: latest code
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
# Delving into Blue Button 2.0 Data
The Blue Button 2.0 API publishes detailed claims information for a beneficiary. As a developer I want to be able to understand the data and be able to easily delve into the data that the API returns.

The challenge is that the data we may be looking for can be buried many layers deep inside FHIR resources in a json data structure.

Digging into the data can take some effort.  There must be an easy way to work with this data without having to build complex custom code.  I tend to work with Python as my primary computer language. So I went looking for a library that would work on Python 3 and enable the equivalent of XML's XPath. What i found was the jsonpath_rw_ext library. It can be installed with pip install.

I also added some code to the BlueButton-sample-client-django app. Check out the "fhir-probe-viewer-v2" code branch. The "probe" app has a file fhirpath.py. There is a function in this file: get_fhir_jdict(). 

## get_fhir_jdict()
If you pass a FHIR resource as a json dictionary to this function it will drill down through the resource and return a list of dictionary entries that describes each element in the FHIR resource.
Let's see how we could use this.

First download a copy of the bluebutton-sample-django-client app.

You can follow the install procedures for this app in an [earlier blog post](https://bluebutton.cms.gov/blog/Installing-a-Django-client-application.html): [https://bluebutton.cms.gov/blog/Installing-a-Django-client-application.html](https://bluebutton.cms.gov/blog/Installing-a-Django-client-application.html)

Once your environment is setup  switch to the fhir-probie-viewer-v2 branch:
```bash
git checkout -b fhir-probie-viewer-v2
pip install jsonpath-rw-ext

```

Now let's run a python shell:
```bash
python manage.py shell
```

 Once we have the Python2 interactive shell loaded we can try load the code we need:
```python
# we will want to work with json so...
import json

# we will want to use the Blue Button 2.0 CapabilityStatement
# so let's use the requests library
import requests
url = "https://sandbox.bluebutton.cms.gov/v1/fhir/metadata"
response = requests.get(url)

# let's check we got a page back
response.status_code

# This should report a 200.
# let's get the json output
json_data = response.json()

# we can take a look if we want...
print(json_data)
```

We should see something like this:
```json
{'resourceType': 'CapabilityStatement', 'status': 'active', 'date': '2018-06-29T17:43:13-04:00', 'publisher': 'Centers for Medicare & Medicaid Services', 'kind': 'instance', 'software': {'name': 'Blue Button API: Direct', 'version': '1.0.0-SNAPSHOT'}, 'implementation': {'description': 'gov.hhs.cms.bluebutton.fhir:bluebutton-server-app'}, 'fhirVersion': '3.0.1', 'acceptUnknown': 'extensions', 'format': ['application/json', 'application/fhir+json'], 'rest': [{'mode': 'server', 'resource': [{'type': 'Coverage', 'profile': {'reference': 'http://hl7.org/fhir/Profile/Coverage'}, 'interaction': [{'code': 'read'}, {'code': 'search-type'}], 'searchParam': [{'name': 'beneficiary', 'type': 'reference', 'documentation': 'Covered party'}]}, {'type': 'ExplanationOfBenefit', 'profile': {'reference': 'http://hl7.org/fhir/Profile/ExplanationOfBenefit'}, 'interaction': [{'code': 'read'}, {'code': 'search-type'}], 'searchParam': [{'name': 'patient', 'type': 'reference', 'documentation': 'The reference to the patient'}]}, {'type': 'Patient', 'profile': {'reference': 'http://hl7.org/fhir/Profile/Patient'}, 'interaction': [{'code': 'read'}, {'code': 'search-type'}], 'searchParam': [{'name': '_id', 'type': 'token', 'documentation': 'The ID of the resource'}, {'name': 'identifier', 'type': 'token', 'documentation': 'A patient identifier'}]}], 'security': {'cors': True, 'service': [{'text': 'OAuth', 'coding': [{'code': 'OAuth', 'system': 'http://hl7.org/fhir/ValueSet/restful-security-service', 'display': 'OAuth'}]}, {'text': 'SMART-on-FHIR', 'coding': [{'code': 'SMART-on-FHIR', 'system': 'http://hl7.org/fhir/ValueSet/restful-security-service', 'display': 'SMART-on-FHIR'}]}], 'extension': [{'url': 'http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris', 'extension': [{'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/token/', 'url': 'token'}, {'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/authorize/', 'url': 'authorize'}]}]}}]}
```

```python
# if we want to pretty print the json we can do this:
import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(json_data)
```

This should give us a more readable output.
```json
{   'acceptUnknown': 'extensions',
    'date': '2018-06-29T17:43:13-04:00',
    'fhirVersion': '3.0.1',
    'format': ['application/json', 'application/fhir+json'],
    'implementation': {   'description': 'gov.hhs.cms.bluebutton.fhir:bluebutton-server-app'},
    'kind': 'instance',
    'publisher': 'Centers for Medicare & Medicaid Services',
    'resourceType': 'CapabilityStatement',
    'rest': [   {   'mode': 'server',
                    'resource': [   {   'interaction': [   {'code': 'read'},
                                                           {   'code': 'search-type'}],
                                        'profile': {   'reference': 'http://hl7.org/fhir/Profile/Coverage'},
                                        'searchParam': [   {   'documentation': 'Covered '
                                                                                'party',
                                                               'name': 'beneficiary',
                                                               'type': 'reference'}],
                                        'type': 'Coverage'},
                                    {   'interaction': [   {'code': 'read'},
                                                           {   'code': 'search-type'}],
                                        'profile': {   'reference': 'http://hl7.org/fhir/Profile/ExplanationOfBenefit'},
                                        'searchParam': [   {   'documentation': 'The '
                                                                                'reference '
                                                                                'to '
                                                                                'the '
                                                                                'patient',
                                                               'name': 'patient',
                                                               'type': 'reference'}],
                                        'type': 'ExplanationOfBenefit'},
                                    {   'interaction': [   {'code': 'read'},
                                                           {   'code': 'search-type'}],
                                        'profile': {   'reference': 'http://hl7.org/fhir/Profile/Patient'},
                                        'searchParam': [   {   'documentation': 'The '
                                                                                'ID '
                                                                                'of '
                                                                                'the '
                                                                                'resource',
                                                               'name': '_id',
                                                               'type': 'token'},
                                                           {   'documentation': 'A '
                                                                                'patient '
                                                                                'identifier',
                                                               'name': 'identifier',
                                                               'type': 'token'}],
                                        'type': 'Patient'}],
                    'security': {   'cors': True,
                                    'extension': [   {   'extension': [   {   'url': 'token',
                                                                              'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/token/'},
                                                                          {   'url': 'authorize',
                                                                              'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/authorize/'}],
                                                         'url': 'http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris'}],
                                    'service': [   {   'coding': [   {   'code': 'OAuth',
                                                                         'display': 'OAuth',
                                                                         'system': 'http://hl7.org/fhir/ValueSet/restful-security-service'}],
                                                       'text': 'OAuth'},
                                                   {   'coding': [   {   'code': 'SMART-on-FHIR',
                                                                         'display': 'SMART-on-FHIR',
                                                                         'system': 'http://hl7.org/fhir/ValueSet/restful-security-service'}],
                                                       'text': 'SMART-on-FHIR'}]}}],
    'software': {   'name': 'Blue Button API: Direct',
                    'version': '1.0.0-SNAPSHOT'},
    'status': 'active'}
```
This is a little easier to read.

now let's try the get_fhir_jdict() function:
```python
from apps.probie.fhirpath import get_fhir_jdict
probe = get_fhir_jdict(json_data)
pp.pprint(probe)
```

This creates a flattened view of the FHIR resource.
You should see an output something like this:

```json
[   {   'level': 0,
        'name': 'resourceType',
        'pathName': '$.resourceType',
        'type': 'str',
        'value': 'CapabilityStatement'},
    {   'level': 0,
        'name': 'status',
        'pathName': '$.status',
        'type': 'str',
        'value': 'active'},
    {   'level': 0,
        'name': 'date',
        'pathName': '$.date',
        'type': 'str',
        'value': '2018-06-29T17:43:13-04:00'},
    {   'level': 0,
        'name': 'publisher',
        'pathName': '$.publisher',
        'type': 'str',
        'value': 'Centers for Medicare & Medicaid Services'},
    {   'level': 0,
        'name': 'kind',
        'pathName': '$.kind',
        'type': 'str',
        'value': 'instance'},
    {   'level': 0,
        'name': 'software',
        'pathName': '$.software',
        'type': 'dict',
        'value': {   'name': 'Blue Button API: Direct',
                     'version': '1.0.0-SNAPSHOT'}},
    {   'level': 1,
        'name': 'name',
        'pathName': '$.software.name',
        'type': 'str',
        'value': 'Blue Button API: Direct'},
    {   'level': 1,
        'name': 'version',
        'pathName': '$.software.version',
        'type': 'str',
        'value': '1.0.0-SNAPSHOT'},
    {   'level': 0,
        'name': 'implementation',
        'pathName': '$.implementation',
        'type': 'dict',
        'value': {   'description': 'gov.hhs.cms.bluebutton.fhir:bluebutton-server-app'}},
    {   'level': 1,
        'name': 'description',
        'pathName': '$.implementation.description',
        'type': 'str',
        'value': 'gov.hhs.cms.bluebutton.fhir:bluebutton-server-app'},
    {   'level': 0,
        'name': 'fhirVersion',
        'pathName': '$.fhirVersion',
        'type': 'str',
        'value': '3.0.1'},
    {   'level': 0,
        'name': 'acceptUnknown',
        'pathName': '$.acceptUnknown',
        'type': 'str',
        'value': 'extensions'},
    {   'level': 0,
        'name': 'format',
        'pathName': '$.format',
        'type': 'list',
        'value': ['application/json', 'application/fhir+json']},
    {   'level': 1,
        'name': '0',
        'pathName': '$.format.0',
        'type': 'str',
        'value': 'application/json'},
    {   'level': 1,
        'name': '1',
        'pathName': '$.format.1',
        'type': 'str',
        'value': 'application/fhir+json'},
    {   'level': 0,
        'name': 'rest',
        'pathName': '$.rest',
        'type': 'list',
        'value': [   {   'mode': 'server',
                         'resource': [   {   'interaction': [   {   'code': 'read'},
                                                                {   'code': 'search-type'}],
                                             'profile': {   'reference': 'http://hl7.org/fhir/Profile/Coverage'},
                                             'searchParam': [   {   'documentation': 'Covered '
                                                                                     'party',
                                                                    'name': 'beneficiary',
                                                                    'type': 'reference'}],
                                             'type': 'Coverage'},
                                         {   'interaction': [   {   'code': 'read'},
                                                                {   'code': 'search-type'}],
                                             'profile': {   'reference': 'http://hl7.org/fhir/Profile/ExplanationOfBenefit'},
                                             'searchParam': [   {   'documentation': 'The '
                                                                                     'reference '
                                                                                     'to '
                                                                                     'the '
                                                                                     'patient',
                                                                    'name': 'patient',
                                                                    'type': 'reference'}],
                                             'type': 'ExplanationOfBenefit'},
                                         {   'interaction': [   {   'code': 'read'},
                                                                {   'code': 'search-type'}],
                                             'profile': {   'reference': 'http://hl7.org/fhir/Profile/Patient'},
                                             'searchParam': [   {   'documentation': 'The '
                                                                                     'ID '
                                                                                     'of '
                                                                                     'the '
                                                                                     'resource',
                                                                    'name': '_id',
                                                                    'type': 'token'},
                                                                {   'documentation': 'A '
                                                                                     'patient '
                                                                                     'identifier',
                                                                    'name': 'identifier',
                                                                    'type': 'token'}],
                                             'type': 'Patient'}],
                         'security': {   'cors': True,
                                         'extension': [   {   'extension': [   {   'url': 'token',
                                                                                   'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/token/'},
                                                                               {   'url': 'authorize',
                                                                                   'valueUri': 'https://sandbox.bluebutton.cms.gov/v1/o/authorize/'}],
                                                              'url': 'http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris'}],
                                         'service': [   {   'coding': [   {   'code': 'OAuth',
                                                                              'display': 'OAuth',
                                                                              'system': 'http://hl7.org/fhir/ValueSet/restful-security-service'}],
                                                            'text': 'OAuth'},
                                                        {   'coding': [   {   'code': 'SMART-on-FHIR',
                                                                              'display': 'SMART-on-FHIR',
                                                                              'system': 'http://hl7.org/fhir/ValueSet/restful-security-service'}],
                                                            'text': 'SMART-on-FHIR'}]}}]},
    ...... Trimmed
```

### get_fhir_jdict dictionary structure
Each dictionary entry in the list has the following attributes:
```json
{'level': *number*,
 'name': '*fieldname',
 'pathName':  '*jsonpath_syntax_to_field*',
 'type': '*field_type*',
 'value': '*field_content*'
}
```

We could browse this code but an alternative is to use the pathName information to construct  a query into the json data and get results back.

One advantage of jsonpath is the ability to do wildcard searches. 
Let's try an example:
```python
from apps.probie.fhirpath import get_jpath
# let's see what resources are available
resource_probe = '$.rest.[*].resource.[*].type'
resource = get_jpath(resource_probe, json_data)
print(resource)
```

We should see the following list returned:
```json
['Coverage', 'ExplanationOfBenefit', 'Patient']
```

The advantage of jsonpath is the ability to pass wildcards to the query without creating an error.

I have found that the flattened view provided by get_fhir_jdict() is helpful for drilling down through a resource. I can then use  the get_jpath() function to query the data quickly and easily.

---
## Earlier Blog Posts

[Blog Index](/blog/)

## Latest
[Category:Latest](/blog/category/latest.html)

## General
[Category:General](/blog/category/general.html)

## Code
[Category:Code](/blog/category/code.html)
