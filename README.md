CMS Blue Button 2.0 API Static Site
=====================================================

## Project Description
A static Astro site for the Blue Button 2.0 API: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/).

## About the Project
The [Blue Button 2.0 API](https://bluebutton.cms.gov/) provides Medicare enrollee claims data to applications using the [OAuth2.0 authorization flow](https://datatracker.ietf.org/doc/html/rfc6749). We aim to provide a developer-friendly, standards-based API that enables people with Medicare to connect their claims data to the applications, services, and research programs they trust.

### Core Team
A list of core team members responsible for the code and documentation in this repository can be found in [COMMUNITY.md](COMMUNITY.md).

## Development and Software Delivery Lifecycle
The following guide is for members of the project team who have access to the repository as well as code contributors. The main difference between internal and external contributions is that external contributors will need to fork the project and will not be able to merge their own pull requests. For more information on contributing, see: [CONTRIBUTING.md](./CONTRIBUTING.md).

## Local Development

### Requirements

It is assumed that the environment already has these installed:

- [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) to install versioned ruby
- [ruby](https://www.ruby-lang.org/en/) currently using 2.7.1
- [jekyll](https://jekyllrb.com/) currently using 4.2.0

* [npm](https://www.npmjs.com/) currently using 6.13.4

- [Docker](https://docs.docker.com/install/) to standardize builds across all contributors' local machines
- [Docker Compose](https://docs.docker.com/compose/install/) to define and run multi-container Docker applications

### Installation

Navigate to the repository, and install the appropriate Gem file (a Gem file includes the dependencies for Ruby apps):

1. `$ gem install bundler` <— install Gem bundler
2. `$ bundle install` <— install Gem bundles
3. `$ npm install` <- install node dependancies

### Local builds

Jekyll builds the CSS and HTML pages. Run `bundle exec jekyll serve` from the project root for a local build. By default, the site will run in `http://localhost:4000/`. You can also run `bundle exec jekyll build` to compile the site files into the `_site` directory.

#### Using Docker for distributed builds

Every contributor that uses Docker will have the exact same build as every other contributor. The command for a consistent and simple build process is:

```
docker compose -f docker-compose.yml build static_site
docker compose -f docker-compose.yml run --rm static_site
```

This process uses a Docker container to execute `bundle exec jekyll build` , compiling site files into the same `_site` directory used when executing this command on the Docker host. The advantage here is that there's no need to install ruby or any dependencies on the machine building the static site — Docker takes care of all that.

#### Using Docker for serving

To host the site in Docker, accessible at `http://localhost:4000/`:

```
docker compose run --publish 4000:4000 --rm --entrypoint "bundle exec jekyll serve -H 0.0.0.0" static_site
```

This is a convenience meant to ease integration of static site builds with the larger BCDA CI/CD pipeline.

## Coding Style and Linters

<!-- TODO - Add the repo's linting and code style guidelines -->

## Branching Model

<!--- TODO - Add the repo's branching model -->

## Contributing

Thank you for considering contributing to an Open Source project of the US Government! For more information about our contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md).

### Installing and Using Pre-commit

Anyone committing to this repo must use the pre-commit hook to lower the likelihood that secrets will be exposed.

#### Step 1: Install pre-commit

You can install pre-commit using the MacOS package manager Homebrew:

```sh
brew install pre-commit
```

Other installation options can be found in the [pre-commit documentation](https://pre-commit.com/#install).

#### Step 2: Install the hooks

Run the following command to install the gitleaks hook:

```sh
pre-commit install
```

This will download and install the pre-commit hooks specified in `.pre-commit-config.yaml`.

## Community
The Blue Button Web Server team is taking a community-first and open source approach to the product development of this tool. We believe government software should be made in the open and be built and licensed such that anyone can download the code, run it themselves without paying money to third parties or using proprietary software, and use it as they will.

We know that we can learn from a wide variety of communities, including those who will use or will be impacted by the tool, who are experts in technology, or who have experience with similar technologies deployed in other spaces. We are dedicated to creating forums for continuous conversation and feedback to help shape the design and development of the tool.

We also recognize capacity building as a key part of involving a diverse open source community. We are doing our best to use accessible language, provide technical and process documents, and offer support to community members with a wide variety of backgrounds and skillsets.

## Community Guidelines
Principles and guidelines for participating in our open source community are can be found in [COMMUNITY.md](COMMUNITY.md). Please read them before joining or starting a conversation in this repo or one of the channels listed below. All community members and participants are expected to adhere to the community guidelines and code of conduct when participating in community spaces including: code repositories, communication channels and venues, and events.

## Governance
For more information about our governance, see [GOVERNANCE.md](GOVERNANCE.md).

## Feedback
If you have ideas for how we can improve or add to our capacity building efforts and methods for welcoming people into our community, please let us know at **opensource@cms.hhs.gov**. If you would like to comment on the tool itself, please let us know by filing an **issue on our GitHub repository.**

## Policies

### Open Source Policy

We adhere to the [CMS Open Source Policy](https://github.com/CMSGov/cms-open-source-policy). If you have any questions, just [shoot us an email](mailto:opensource@cms.hhs.gov).

### Security and Responsible Disclosure Policy
_Submit a vulnerability:_ Vulnerability reports can be submitted through [Bugcrowd](https://bugcrowd.com/cms-vdp). Reports may be submitted anonymously. If you share contact information, we will acknowledge receipt of your report within 3 business days.

For more information about our Security, Vulnerability, and Responsible Disclosure Policies, see [SECURITY.md](SECURITY.md).

### Software Bill of Materials (SBOM)
A Software Bill of Materials (SBOM) is a formal record containing the details and supply chain relationships of various components used in building software.

In the spirit of [Executive Order 14028 - Improving the Nation's Cyber Security](https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028), a SBOM for this repository is provided here: https://github.com/CMSGov/bluebutton-web-server/network/dependencies.

For more information and resources about SBOMs, visit: https://www.cisa.gov/sbom.

## Public Domain
This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/) as indicated in [LICENSE](LICENSE).

All contributions to this project will be released under the CC0 dedication. By submitting a pull request or issue, you are agreeing to comply with this waiver of copyright interest.

--- 

## Astro Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |
| `npm run astro sync`.     | Update new pages, metadate, urls added           |

