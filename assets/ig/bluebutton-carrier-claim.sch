<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="https://bluebutton.cms.gov/assets/ig"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ExplanationOfBenefit
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit</sch:title>
    <sch:rule context="f:ExplanationOfBenefit">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prpayamt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prpayamt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prpayamt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prpayamt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-num-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-num-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-num-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-num-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-asgmntcd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-asgmntcd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-asgmntcd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-asgmntcd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-cash-ddctbl-apld-amt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-cash-ddctbl-apld-amt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-cash-ddctbl-apld-amt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-cash-ddctbl-apld-amt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-pmt-dnl-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-pmt-dnl-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-pmt-dnl-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-clm-pmt-dnl-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-alowd-amt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-alowd-amt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-alowd-amt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-alowd-amt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-sbmtd-chrg-amt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-sbmtd-chrg-amt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-sbmtd-chrg-amt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-carr-clm-sbmtd-chrg-amt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-bene-pmt-amt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-bene-pmt-amt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-bene-pmt-amt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-bene-pmt-amt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-prvdr-pmt-amt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-prvdr-pmt-amt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-prvdr-pmt-amt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-nch-clm-prvdr-pmt-amt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-clm-clncl-tril-num-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-clm-clncl-tril-num-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-clm-clncl-tril-num-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-clm-clncl-tril-num-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:status) &gt;= 1">status: minimum cardinality of 'status' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:subType) &lt;= 0">subType: maximum cardinality of 'subType' is 0</sch:assert>
      <sch:assert test="count(f:patient) &gt;= 1">patient: minimum cardinality of 'patient' is 1</sch:assert>
      <sch:assert test="count(f:billablePeriod) &gt;= 1">billablePeriod: minimum cardinality of 'billablePeriod' is 1</sch:assert>
      <sch:assert test="count(f:created) &lt;= 0">created: maximum cardinality of 'created' is 0</sch:assert>
      <sch:assert test="count(f:enterer) &lt;= 0">enterer: maximum cardinality of 'enterer' is 0</sch:assert>
      <sch:assert test="count(f:insurer) &lt;= 0">insurer: maximum cardinality of 'insurer' is 0</sch:assert>
      <sch:assert test="count(f:provider) &lt;= 0">provider: maximum cardinality of 'provider' is 0</sch:assert>
      <sch:assert test="count(f:organization) &lt;= 0">organization: maximum cardinality of 'organization' is 0</sch:assert>
      <sch:assert test="count(f:facility) &lt;= 0">facility: maximum cardinality of 'facility' is 0</sch:assert>
      <sch:assert test="count(f:claim) &lt;= 0">claim: maximum cardinality of 'claim' is 0</sch:assert>
      <sch:assert test="count(f:claimResponse) &lt;= 0">claimResponse: maximum cardinality of 'claimResponse' is 0</sch:assert>
      <sch:assert test="count(f:outcome) &lt;= 0">outcome: maximum cardinality of 'outcome' is 0</sch:assert>
      <sch:assert test="count(f:disposition) &lt;= 0">disposition: maximum cardinality of 'disposition' is 0</sch:assert>
      <sch:assert test="count(f:related) &lt;= 0">related: maximum cardinality of 'related' is 0</sch:assert>
      <sch:assert test="count(f:prescription) &lt;= 0">prescription: maximum cardinality of 'prescription' is 0</sch:assert>
      <sch:assert test="count(f:originalPrescription) &lt;= 0">originalPrescription: maximum cardinality of 'originalPrescription' is 0</sch:assert>
      <sch:assert test="count(f:payee) &lt;= 0">payee: maximum cardinality of 'payee' is 0</sch:assert>
      <sch:assert test="count(f:information) &lt;= 0">information: maximum cardinality of 'information' is 0</sch:assert>
      <sch:assert test="count(f:procedure) &lt;= 0">procedure: maximum cardinality of 'procedure' is 0</sch:assert>
      <sch:assert test="count(f:precedence) &lt;= 0">precedence: maximum cardinality of 'precedence' is 0</sch:assert>
      <sch:assert test="count(f:insurance) &gt;= 1">insurance: minimum cardinality of 'insurance' is 1</sch:assert>
      <sch:assert test="count(f:accident) &lt;= 0">accident: maximum cardinality of 'accident' is 0</sch:assert>
      <sch:assert test="count(f:employmentImpacted) &lt;= 0">employmentImpacted: maximum cardinality of 'employmentImpacted' is 0</sch:assert>
      <sch:assert test="count(f:hospitalization) &lt;= 0">hospitalization: maximum cardinality of 'hospitalization' is 0</sch:assert>
      <sch:assert test="count(f:item) &gt;= 1">item: minimum cardinality of 'item' is 1</sch:assert>
      <sch:assert test="count(f:addItem) &lt;= 0">addItem: maximum cardinality of 'addItem' is 0</sch:assert>
      <sch:assert test="count(f:totalCost) &lt;= 0">totalCost: maximum cardinality of 'totalCost' is 0</sch:assert>
      <sch:assert test="count(f:unallocdeductible) &lt;= 0">unallocdeductible: maximum cardinality of 'unallocdeductible' is 0</sch:assert>
      <sch:assert test="count(f:totalBenefit) &lt;= 0">totalBenefit: maximum cardinality of 'totalBenefit' is 0</sch:assert>
      <sch:assert test="count(f:payment) &gt;= 1">payment: minimum cardinality of 'payment' is 1</sch:assert>
      <sch:assert test="count(f:form) &lt;= 0">form: maximum cardinality of 'form' is 0</sch:assert>
      <sch:assert test="count(f:processNote) &lt;= 0">processNote: maximum cardinality of 'processNote' is 0</sch:assert>
      <sch:assert test="count(f:benefitBalance) &lt;= 0">benefitBalance: maximum cardinality of 'benefitBalance' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:identifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:identifier">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:use) &lt;= 0">use: maximum cardinality of 'use' is 0</sch:assert>
      <sch:assert test="count(f:type) &lt;= 0">type: maximum cardinality of 'type' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 0">period: maximum cardinality of 'period' is 0</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 0">assigner: maximum cardinality of 'assigner' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:identifier/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:identifier/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:identifier/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:identifier/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:identifier/f:period</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:identifier/f:period">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:identifier/f:assigner</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:identifier/f:assigner">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:type">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:subType</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:subType">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:subType/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:subType/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:patient</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:patient">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:reference) &gt;= 1">reference: minimum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:billablePeriod</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:billablePeriod">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:start) &gt;= 1">start: minimum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &gt;= 1">end: minimum cardinality of 'end' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:enterer</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:enterer">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:insurer</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:insurer">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:provider</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:provider">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:organization</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:organization">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:referral</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:referral">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:reference) &gt;= 1">reference: minimum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:facility</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:facility">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:claim</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:claim">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:claimResponse</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:claimResponse">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:outcome</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:outcome">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:outcome/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:outcome/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:claim</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:claim">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:relationship</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:relationship">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:relationship/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:relationship/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:reference</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:reference">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 1">assigner: maximum cardinality of 'assigner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:reference/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:reference/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:reference/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:reference/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:reference/f:period</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:reference/f:period">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:related/f:reference/f:assigner</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:related/f:reference/f:assigner">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:prescription</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:prescription">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:originalPrescription</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:originalPrescription">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payee/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payee/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payee/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payee/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payee/f:resourceType</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payee/f:resourceType">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payee/f:resourceType/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payee/f:resourceType/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payee/f:party</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payee/f:party">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:information/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:information/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:information/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:information/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:information/f:code</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:information/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:information/f:code/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:information/f:code/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:information/f:reason</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:information/f:reason">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prvdr-type-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prvdr-type-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prvdr-type-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prvdr-type-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prtcptng-ind-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prtcptng-ind-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prtcptng-ind-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prtcptng-ind-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-us-npi-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-us-npi-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-us-npi-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-us-npi-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:responsible) &lt;= 0">responsible: maximum cardinality of 'responsible' is 0</sch:assert>
      <sch:assert test="count(f:role) &gt;= 1">role: minimum cardinality of 'role' is 1</sch:assert>
      <sch:assert test="count(f:qualification) &gt;= 1">qualification: minimum cardinality of 'qualification' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam/f:provider</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam/f:provider">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 0">reference: maximum cardinality of 'reference' is 0</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam/f:role</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam/f:role">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam/f:role/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam/f:role/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam/f:qualification</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam/f:qualification">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:careTeam/f:qualification/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:careTeam/f:qualification/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:diagnosis</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:diagnosis">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:packageCode) &lt;= 0">packageCode: maximum cardinality of 'packageCode' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:diagnosis/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:diagnosis/f:type">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:diagnosis/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:diagnosis/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:diagnosis/f:packageCode</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:diagnosis/f:packageCode">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:diagnosis/f:packageCode/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:diagnosis/f:packageCode/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:insurance</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:insurance">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:coverage) &gt;= 1">coverage: minimum cardinality of 'coverage' is 1</sch:assert>
      <sch:assert test="count(f:preAuthRef) &lt;= 0">preAuthRef: maximum cardinality of 'preAuthRef' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:insurance/f:coverage</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:insurance/f:coverage">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:reference) &gt;= 1">reference: minimum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:accident/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:accident/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:accident/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:accident/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:employmentImpacted</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:employmentImpacted">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:hospitalization</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:hospitalization">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cnt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cnt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cnt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-mtus-cnt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-betos-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-betos-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-betos-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-betos-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-bene-prmry-pyr-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-bene-prmry-pyr-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-bene-prmry-pyr-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-bene-prmry-pyr-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-service-deductible-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-service-deductible-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-service-deductible-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-service-deductible-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-hct-hgb-rslt-num-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-hct-hgb-rslt-num-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-hct-hgb-rslt-num-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-hct-hgb-rslt-num-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-ndc-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-ndc-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-ndc-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-ndc-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:careTeamLinkId) &lt;= 0">careTeamLinkId: maximum cardinality of 'careTeamLinkId' is 0</sch:assert>
      <sch:assert test="count(f:procedureLinkId) &lt;= 0">procedureLinkId: maximum cardinality of 'procedureLinkId' is 0</sch:assert>
      <sch:assert test="count(f:informationLinkId) &lt;= 0">informationLinkId: maximum cardinality of 'informationLinkId' is 0</sch:assert>
      <sch:assert test="count(f:revenue) &lt;= 0">revenue: maximum cardinality of 'revenue' is 0</sch:assert>
      <sch:assert test="count(f:modifier) &lt;= 1">modifier: maximum cardinality of 'modifier' is 1</sch:assert>
      <sch:assert test="count(f:programCode) &lt;= 0">programCode: maximum cardinality of 'programCode' is 0</sch:assert>
      <sch:assert test="count(f:unitPrice) &lt;= 0">unitPrice: maximum cardinality of 'unitPrice' is 0</sch:assert>
      <sch:assert test="count(f:factor) &lt;= 0">factor: maximum cardinality of 'factor' is 0</sch:assert>
      <sch:assert test="count(f:net) &lt;= 0">net: maximum cardinality of 'net' is 0</sch:assert>
      <sch:assert test="count(f:udi) &lt;= 0">udi: maximum cardinality of 'udi' is 0</sch:assert>
      <sch:assert test="count(f:bodySite) &lt;= 0">bodySite: maximum cardinality of 'bodySite' is 0</sch:assert>
      <sch:assert test="count(f:subSite) &lt;= 0">subSite: maximum cardinality of 'subSite' is 0</sch:assert>
      <sch:assert test="count(f:encounter) &lt;= 0">encounter: maximum cardinality of 'encounter' is 0</sch:assert>
      <sch:assert test="count(f:noteNumber) &lt;= 0">noteNumber: maximum cardinality of 'noteNumber' is 0</sch:assert>
      <sch:assert test="count(f:detail) &lt;= 0">detail: maximum cardinality of 'detail' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:revenue</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:revenue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:revenue/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:revenue/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:category">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:service</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:service">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-ansthsa-unit-cnt-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-ansthsa-unit-cnt-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-ansthsa-unit-cnt-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-ansthsa-unit-cnt-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:service/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:service/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &gt;= 1">version: minimum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:modifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:modifier">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:modifier/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:modifier/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &gt;= 1">version: minimum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:programCode</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:programCode">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:programCode/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:programCode/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:locationCodeableConcept</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:locationCodeableConcept">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prvdr-state-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prvdr-state-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prvdr-zip-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-prvdr-zip-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prcng-lclty-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-prcng-lclty-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-clia-lab-num-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-carr-line-clia-lab-num-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:locationCodeableConcept/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:locationCodeableConcept/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:quantity</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:quantity">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 0">unit: maximum cardinality of 'unit' is 0</sch:assert>
      <sch:assert test="count(f:system) &lt;= 0">system: maximum cardinality of 'system' is 0</sch:assert>
      <sch:assert test="count(f:code) &lt;= 0">code: maximum cardinality of 'code' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:unitPrice</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:unitPrice">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:net</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:net">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:udi</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:udi">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:bodySite</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:bodySite">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:bodySite/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:bodySite/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:subSite</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:subSite">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:subSite/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:subSite/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:encounter</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:encounter">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-pmt-80-100-cd-extension']) &gt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-pmt-80-100-cd-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-pmt-80-100-cd-extension']) &lt;= 1">extension with URL = 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton-carrier-line-pmt-80-100-cd-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 0">value: maximum cardinality of 'value' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication/f:category">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication/f:reason</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication/f:reason">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication/f:reason/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication/f:reason/f:coding">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:adjudication/f:amount</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:adjudication/f:amount">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 0">unit: maximum cardinality of 'unit' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:revenue</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:revenue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:revenue/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:revenue/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:service</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:service">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:service/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:service/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:modifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:modifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:modifier/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:modifier/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:programCode</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:programCode">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:programCode/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:programCode/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:quantity</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:quantity">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:unitPrice</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:unitPrice">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:net</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:net">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:udi</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:udi">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:revenue</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:revenue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:revenue/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:revenue/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:service</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:service">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:service/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:service/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:modifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:modifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:modifier/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:modifier/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:programCode</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:programCode">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:programCode/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:programCode/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:quantity</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:quantity">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:unitPrice</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:unitPrice">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:net</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:net">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:udi</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:item/f:detail/f:subDetail/f:udi">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:revenue</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:revenue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:revenue/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:revenue/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:service</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:service">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:service/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:service/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:modifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:modifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:modifier/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:modifier/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:fee</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:fee">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:revenue</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:revenue">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:revenue/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:revenue/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:service</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:service">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:service/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:service/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:modifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:modifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:modifier/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:modifier/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:addItem/f:detail/f:fee</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:addItem/f:detail/f:fee">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:totalCost</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:totalCost">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:unallocdeductible</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:unallocdeductible">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:totalBenefit</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:totalBenefit">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:type) &lt;= 0">type: maximum cardinality of 'type' is 0</sch:assert>
      <sch:assert test="count(f:adjustment) &lt;= 0">adjustment: maximum cardinality of 'adjustment' is 0</sch:assert>
      <sch:assert test="count(f:adjustmentReason) &lt;= 0">adjustmentReason: maximum cardinality of 'adjustmentReason' is 0</sch:assert>
      <sch:assert test="count(f:date) &lt;= 0">date: maximum cardinality of 'date' is 0</sch:assert>
      <sch:assert test="count(f:amount) &gt;= 1">amount: minimum cardinality of 'amount' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 0">identifier: maximum cardinality of 'identifier' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:adjustment</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:adjustment">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 1">comparator: maximum cardinality of 'comparator' is 1</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 1">unit: maximum cardinality of 'unit' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:adjustmentReason</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:adjustmentReason">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:adjustmentReason/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:adjustmentReason/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:amount</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:amount">
      <sch:assert test="count(f:id) &lt;= 0">id: maximum cardinality of 'id' is 0</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:comparator) &lt;= 0">comparator: maximum cardinality of 'comparator' is 0</sch:assert>
      <sch:assert test="count(f:unit) &lt;= 0">unit: maximum cardinality of 'unit' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 0">code: maximum cardinality of 'code' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:identifier</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:identifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 1">assigner: maximum cardinality of 'assigner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:identifier/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:identifier/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:identifier/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:identifier/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:identifier/f:period</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:identifier/f:period">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:payment/f:identifier/f:assigner</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:payment/f:identifier/f:assigner">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:reference) &lt;= 1">reference: maximum cardinality of 'reference' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:form</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:form">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:form/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:form/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:processNote/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:processNote/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:processNote/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:processNote/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:processNote/f:language</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:processNote/f:language">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:processNote/f:language/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:processNote/f:language/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:category</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:category">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:category/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:category/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:subCategory</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:subCategory">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:subCategory/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:subCategory/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:network</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:network">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:network/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:network/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:unit</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:unit">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:unit/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:unit/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:term</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:term">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:term/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:term/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:financial/f:type</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:financial/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ExplanationOfBenefit/f:benefitBalance/f:financial/f:type/f:coding</sch:title>
    <sch:rule context="f:ExplanationOfBenefit/f:benefitBalance/f:financial/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
