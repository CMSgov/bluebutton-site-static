CMS Blue Button API Static Site
=====================================================

# Project Description
A static Jekyll site for the Blue Button API splash page: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/).

# About the Project
The [Blue Button API](https://bluebutton.cms.gov/) provides Medicare enrollee claims data to applications using the [OAuth2.0 authorization flow](https://datatracker.ietf.org/doc/html/rfc6749). We aim to provide a developer-friendly, standards-based API that enables people with Medicare to connect their claims data to the applications, services, and research programs they trust.

# Core Team
A list of core team members responsible for the code and documentation in this repository can be found in [COMMUNITY.md](COMMUNITY.md).

# Repository Structure
```
├── assets
│   ├── csv
│   ├── developer-resources
│   ├── ig
│   ├── img
│   ├── js
│   ├── public_open_source
│   ├── zip
├── blog
├── css
├── fhir
│   ├── CodeSystem
│   ├── StructureDefinition
├── ops
├── resources
├── selenium_tests
```

## Development and Software Delivery Lifecycle
The following guide is for members of the project team who have access to the repository as well as code contributors. The main difference between internal and external contributions is that external contributors will need to fork the project and will not be able to merge their own pull requests. For more information on contributing, see: [CONTRIBUTING.md](./CONTRIBUTING.md).

# Local Development

## Setup
See below for instructions to install locally and make changes to the code.

NOTE:  Internal software engineers or other interested parties should follow the documentation for running a Dockerized local development enviornment. For more information see the [Dockerized Setup](#dockerized-setup) section.

## Get CSS/Styles Working
We've moved the CSS for this application and our Sandbox application into a consolidated [Blue Button API CSS repository](https://github.com/CMSgov/bluebutton-css) so that we can more easily keep things consistent and deploy changes more quickly.

You'll need to clone/download the BlueButton CSS repository to get started. If you're using a terminal on a Mac/Linux machine, navigate into the `bluebutton-site-static` repository and then run the following command:

```bash
git clone git@github.com:CMSgov/bluebutton-css.git
```

If you need to make CSS changes, make them within this directory and commit them to that repository. These changes will be ignored by the git status of the `bluebutton-site-static` project, but you will see any CSS changes take effect locally.

For more instructions on how to make changes to this css, view the readme inside of the `bluebutton-css` directory.

## Dockerized Setup

### Requirements for Docker

It is assumed that you have the following installed on your local machine:
* [Docker Compose](https://docs.docker.com/compose/install/)

### Running the local site using Docker

To startup the Docker containerized BB2 server, run the following command:

```
docker-compose up -d

```

Alternatively, to also monitor the web server logging:

```
docker-compose up -d
docker-compose logs -f | grep web

```
press Ctrl C will stop monitor logging.

For static site development, open the following in your browser to view the changes being developed:  http://localhost:4000

After making changes, you may need to refresh your browser a few times for them to show up. You may also need to restart the web service using the following command:

```
docker-compose restart web
```

To cleanup/remove the setup run the following:

```
docker-compose down
docker rmi bluebutton-site-static_web
```

## Setup without Docker
We recommend [using Docker](#dockerized-setup), but if this is a barrier, you can set up your local environment manually.

### Requirements for non-Docker setup
* [Jekyll](https://jekyllrb.com/docs/installation/) currently using 4.3.4
* [chruby](https://github.com/postmodern/chruby) or [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) to install versioned ruby - as mentioned in [Jekyll installation guide](https://jekyllrb.com/docs/installation/). Currently using ruby version 3.3.5

### Installation
1. `$ gem install bundler` <—install Gem bundler
2. `$ bundle install` <—install Gem bundles

### Build
Jekyll builds the CSS and HTML pages. Run `bundle exec jekyll serve` from the project root for a local build. By default, the site will run in `http://localhost:4000/`. You can also run `bundle exec jekyll build` to compile the site files into the `_site` directory.

#### Resolving potential errors
When running `bundle exec jekyll serve`, if you get an error including `cannot load such file -- webrick (LoadError)`, run `bundle add webrick && bundle install` to resolve it.

## Deploy

For information about deploying to the static site, please referernce the following document in confluence: [HOW-TO Static Site Updates](https://confluence.cms.gov/x/84P0Fw).

## Codebook
The [`_codebook` directory](_codebooks/) and the [corresponding Jekyll plugin](_plugins/api_codings.rb) are used to create the variables resources. Example: [Claim Medicare Non Utilization Days Count](https://bluebutton.cms.gov/resources/variables/clm_non_utlztn_days_cnt/). Although these *URLs* show little to no usage from analytics, they are used as *URIs* and are **integral to the [Beneficiary FHIR Data (BFD) endpoint responses](https://github.com/CMSgov/beneficiary-fhir-data/tree/b1ca6c4b630f6b0e5aa7e812addabf72bc334fe3/apps/bfd-server/bfd-server-war/src/test/resources/endpoint-responses)**  Changing the URIs requires retiring all of the BFD v1 and v2 APIs and releasing a new v3 with different URIs. Any additions or changes to these URIs should involve the BFD team.

## RDA API Data Dictionary
Partially adjudicated claims data (FISS and MCS) sourced from the RDA API has its own data dictionary published as a spreadsheet.
A CSV file exported from the spreadsheet and stored in the [`_data` directory](_data/rda_api_data_dictionary.csv) and its
[corresponding Jekyll plugin](_plugins/rda_api_variables.rb) are used to create the variables resources. Example:
[Billing Type Code](https://bluebutton.cms.gov/resources/variables/fiss/bill-typ-cd/).  The plugin is similar to the one for
codebooks but uses Jekyll's built-in support for parsing CSV data rather than parsing XML files.
As with the codebook, any additions or changes to these URIs should involve the BFD team.


# Branching Model
This project follows standard GitHub flow practices:

* Make changes in feature branches and merge to `main` frequently
* Pull-requests are reviewed before merging
* Tests should be written for changes introduced
* Each change should be deployable to production

Make changes on a new branch and create pull requests to merge them into the master branch when ready.

When creating a new branch, use the naming convention `[your-github-username]/[jira-ticket-number]-[description]`. For example, `mrengy/BB2-1511-layout-narrow-browser`.

You'll need to [use a Github Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) instead of a password in order to push changes.

# Contributing
Thank you for considering contributing to an Open Source project of the US Government! For more information about our contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

# Community
The Blue Button Web Server team is taking a community-first and open source approach to the product development of this tool. We believe government software should be made in the open and be built and licensed such that anyone can download the code, run it themselves without paying money to third parties or using proprietary software, and use it as they will.

We know that we can learn from a wide variety of communities, including those who will use or will be impacted by the tool, who are experts in technology, or who have experience with similar technologies deployed in other spaces. We are dedicated to creating forums for continuous conversation and feedback to help shape the design and development of the tool.

We also recognize capacity building as a key part of involving a diverse open source community. We are doing our best to use accessible language, provide technical and process documents, and offer support to community members with a wide variety of backgrounds and skillsets.

# Community Guidelines
Principles and guidelines for participating in our open source community are can be found in [COMMUNITY.md](COMMUNITY.md). Please read them before joining or starting a conversation in this repo or one of the channels listed below. All community members and participants are expected to adhere to the community guidelines and code of conduct when participating in community spaces including: code repositories, communication channels and venues, and events.

# Governance
For more information about our governance, see [GOVERNANCE.md](GOVERNANCE.md).

# Feedback
If you have ideas for how we can improve or add to our capacity building efforts and methods for welcoming people into our community, please let us know at **opensource@cms.hhs.gov**. If you would like to comment on the tool itself, please let us know by filing an **issue on our GitHub repository.**

# Policites

### Open Source Policy

We adhere to the [CMS Open Source Policy](https://github.com/CMSGov/cms-open-source-policy). If you have any questions, just [shoot us an email](mailto:opensource@cms.hhs.gov).

### Security and Responsible Disclosure Policy
_Submit a vulnerability:_ Vulnerability reports can be submitted through [Bugcrowd](https://bugcrowd.com/cms-vdp). Reports may be submitted anonymously. If you share contact information, we will acknowledge receipt of your report within 3 business days.

For more information about our Security, Vulnerability, and Responsible Disclosure Policies, see [SECURITY.md](SECURITY.md).

### Software Bill of Materials (SBOM)
A Software Bill of Materials (SBOM) is a formal record containing the details and supply chain relationships of various components used in building software.

In the spirit of [Executive Order 14028 - Improving the Nation's Cyber Security](https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028), a SBOM for this repository is provided here: https://github.com/CMSGov/bluebutton-web-server/network/dependencies.

For more information and resources about SBOMs, visit: https://www.cisa.gov/sbom.

# Public Domain
This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/) as indicated in [LICENSE](LICENSE).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request or issue, you are agreeing to comply with this waiver of copyright interest.