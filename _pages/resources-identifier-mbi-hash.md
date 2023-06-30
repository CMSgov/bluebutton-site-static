---
layout: basic
title: 'Hicn Hash'
permalink: '/resources/identifier/mbi-hash/'
---

# Coding System: Mbi Hash

## Usage

**System URI**: ` https://bluebutton.cms.gov/resources/identifier/mbi-hash`

## Description 

The Medicare Beneficiary Identifier (MBI) is the new identification number that has replaced SSN-based health insurance claim numbers (HICNs) on all Medicare transactions, such as billing, claim submissions and appeals. The purpose of this randomly generated series of numbers and letters is to improve patient identity protection and prevent identity theft.

## How many characters will the MBI have?
The MBI has 11 characters, like the Health Insurance Claim Number (HICN), which can have up to 11.

## Will the MBI's characters have any meaning?
Each MBI is randomly generated. This makes MBIs different from HICNs, which are based on the Social Security Numbers (SSNs) of people with Medicare. The MBI's characters are "non-intelligent" so they don't have any hidden or special meaning.

## What kinds of characters will used in the MBI?
MBIs are numbers and upper-case letters. We’ll use numbers 0-9 and all letters from A to Z, except for S, L, O, I, B, and Z. This will help the
characters be easier to read. If you use lowercase letters, our system will convert them to uppercase letters.
```
| Pos  | 1 | 2 | 3  | 4 | 5 | 6 | 7  | 8 | 9 | 10 | 11 |
|------|---|---|----|---|---|---|----|---|---|----|----|
| Type | C | A | AN | N | N | A | AN | A | A | N  | N  |
```

## Where will the MBI’s characters go?
* C – Numeric 1 thru 9 
* N – Numeric 0 thru 9 
* AN – Either A or N 
* A – Alphabetic Character (A...Z); Excluding (S, L, O, I, B, Z)

* Position 1 – numeric values 1 thru 9 
* Position 2 – alphabetic values A thru Z (minus S, L, O, I, B, Z)
* Position 3 – alpha-numeric values 0 thru 9 and A thru Z (minus S, L, O, I, B, Z)
* Position 4 – numeric values 0 thru 9 
* Position 5 – alphabetic values A thru Z (minus S, L, O, I, B, Z)
* Position 6 – alpha-numeric values 0 thru 9 and A thru Z (minus S, L, O, I, B, Z)
* Position 7 – numeric values 0 thru 9 
* Position 8 – alphabetic values A thru Z (minus S, L, O, I, B, Z)
* Position 9 – alphabetic values A thru Z (minus S, L, O, I, B, Z)
* Position 10 – numeric values 0 thru 9 
* Position 11 – numeric values 0 thru 9

## How will the MBI fit on forms?
MBIs will fit on forms the same way HICNs do. You don’t need spaces for dashes.

## Who will get a new MBI?
Each person with Medicare will get their own randomly-generated MBI. Spouses or dependents who may have had similar HICNs will each get
their own different MBI.



