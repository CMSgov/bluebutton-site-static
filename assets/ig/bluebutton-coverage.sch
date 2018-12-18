<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="https://bluebutton.cms.gov/assets/ig"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Coverage
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Coverage</sch:title>
    <sch:rule context="f:Coverage">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:meta) &lt;= 0">meta: maximum cardinality of 'meta' is 0</sch:assert>
      <sch:assert test="count(f:implicitRules) &lt;= 0">implicitRules: maximum cardinality of 'implicitRules' is 0</sch:assert>
      <sch:assert test="count(f:language) &lt;= 0">language: maximum cardinality of 'language' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:contained) &lt;= 0">contained: maximum cardinality of 'contained' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-a-trm-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-a-trm-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-b-trm-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-b-trm-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-crec-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-crec-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-esrd-ind-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-esrd-ind-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-ms-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-ms-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-orec-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-coverage-orec-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:status) &gt;= 1">status: minimum cardinality of 'status' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:policyHolder) &lt;= 0">policyHolder: maximum cardinality of 'policyHolder' is 0</sch:assert>
      <sch:assert test="count(f:subscriber) &lt;= 0">subscriber: maximum cardinality of 'subscriber' is 0</sch:assert>
      <sch:assert test="count(f:subscriberId) &lt;= 0">subscriberId: maximum cardinality of 'subscriberId' is 0</sch:assert>
      <sch:assert test="count(f:beneficiary) &gt;= 1">beneficiary: minimum cardinality of 'beneficiary' is 1</sch:assert>
      <sch:assert test="count(f:relationship) &lt;= 0">relationship: maximum cardinality of 'relationship' is 0</sch:assert>
      <sch:assert test="count(f:period) &lt;= 0">period: maximum cardinality of 'period' is 0</sch:assert>
      <sch:assert test="count(f:payor) &lt;= 0">payor: maximum cardinality of 'payor' is 0</sch:assert>
      <sch:assert test="count(f:grouping) &gt;= 1">grouping: minimum cardinality of 'grouping' is 1</sch:assert>
      <sch:assert test="count(f:dependent) &lt;= 0">dependent: maximum cardinality of 'dependent' is 0</sch:assert>
      <sch:assert test="count(f:sequence) &lt;= 0">sequence: maximum cardinality of 'sequence' is 0</sch:assert>
      <sch:assert test="count(f:order) &lt;= 0">order: maximum cardinality of 'order' is 0</sch:assert>
      <sch:assert test="count(f:network) &lt;= 0">network: maximum cardinality of 'network' is 0</sch:assert>
      <sch:assert test="count(f:contract) &lt;= 0">contract: maximum cardinality of 'contract' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:type</sch:title>
    <sch:rule context="f:Coverage/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:type/f:coding</sch:title>
    <sch:rule context="f:Coverage/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.policyHolder</sch:title>
    <sch:rule context="f:Coverage/f:policyHolder">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.subscriber</sch:title>
    <sch:rule context="f:Coverage/f:subscriber">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:beneficiary</sch:title>
    <sch:rule context="f:Coverage/f:beneficiary">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &gt;= 1">reference: minimum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.beneficiary</sch:title>
    <sch:rule context="f:Coverage/f:beneficiary">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.period</sch:title>
    <sch:rule context="f:Coverage/f:period">
      <sch:assert test="not(exists(f:start)) or not(exists(f:end)) or (f:start/@value &lt;= f:end/@value)">If present, start SHALL have a lower value than end</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.payor</sch:title>
    <sch:rule context="f:Coverage/f:payor">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:grouping</sch:title>
    <sch:rule context="f:Coverage/f:grouping">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:group) &lt;= 0">group: maximum cardinality of 'group' is 0</sch:assert>
      <sch:assert test="count(f:groupDisplay) &lt;= 0">groupDisplay: maximum cardinality of 'groupDisplay' is 0</sch:assert>
      <sch:assert test="count(f:subGroup) &gt;= 1">subGroup: minimum cardinality of 'subGroup' is 1</sch:assert>
      <sch:assert test="count(f:subGroupDisplay) &lt;= 0">subGroupDisplay: maximum cardinality of 'subGroupDisplay' is 0</sch:assert>
      <sch:assert test="count(f:plan) &lt;= 0">plan: maximum cardinality of 'plan' is 0</sch:assert>
      <sch:assert test="count(f:planDisplay) &lt;= 0">planDisplay: maximum cardinality of 'planDisplay' is 0</sch:assert>
      <sch:assert test="count(f:subPlan) &gt;= 1">subPlan: minimum cardinality of 'subPlan' is 1</sch:assert>
      <sch:assert test="count(f:subPlanDisplay) &lt;= 0">subPlanDisplay: maximum cardinality of 'subPlanDisplay' is 0</sch:assert>
      <sch:assert test="count(f:class) &lt;= 0">class: maximum cardinality of 'class' is 0</sch:assert>
      <sch:assert test="count(f:classDisplay) &lt;= 0">classDisplay: maximum cardinality of 'classDisplay' is 0</sch:assert>
      <sch:assert test="count(f:subClass) &lt;= 0">subClass: maximum cardinality of 'subClass' is 0</sch:assert>
      <sch:assert test="count(f:subClassDisplay) &lt;= 0">subClassDisplay: maximum cardinality of 'subClassDisplay' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Coverage.contract</sch:title>
    <sch:rule context="f:Coverage/f:contract">
      <sch:assert test="not(starts-with(f:reference/@value, '#')) or exists(ancestor::*[self::f:entry or self::f:parameter]/f:resource/f:*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')]|/*/f:contained/f:*[f:id/@value=substring-after(current()/f:reference/@value, '#')])">SHALL have a contained resource if a local reference is provided</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
