# CMS Blue Button 2.0 API Static Site
A static Jekyll site for the Blue Button 2.0 API splash page: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/).

See below for instructions to install locally and make changes to the code.

NOTE:  Internal software engineers or other interested parties should follow the documentation for running a Dockerized local development enviornment. For more information see the [Dockerized Setup](#dockerized-setup) section.

## Get CSS/Styles Working
We've moved the CSS for this application and our Sandbox application into a consolidated [Blue Button 2.0 API CSS repository](https://github.com/CMSgov/bluebutton-css) so that we can more easily keep things consistent and deploy changes more quickly.

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
* [Jekyll](https://jekyllrb.com/docs/installation/) currently using 4.2.0
* [chruby](https://github.com/postmodern/chruby) or [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) to install versioned ruby - as mentioned in [Jekyll installation guide](https://jekyllrb.com/docs/installation/). Currently using ruby version 3.1.2

### Installation
1. `$ gem install bundler` <—install Gem bundler
2. `$ bundle install` <—install Gem bundles

### Build
Jekyll builds the CSS and HTML pages. Run `bundle exec jekyll serve` from the project root for a local build. By default, the site will run in `http://localhost:4000/`. You can also run `bundle exec jekyll build` to compile the site files into the `_site` directory.

#### Resolving potential errors
When running `bundle exec jekyll serve`, if you get an error including `cannot load such file -- webrick (LoadError)`, run `bundle add webrick && bundle install` to resolve it.

## Making changes
Make changes on a new branch and create pull requests to merge them into the master branch when ready.

You'll need to [use a Github Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) instead of a password in order to push changes.

## Deploy

For information about deploying to the static site, please referernce the following document in confluence: [HOW-TO Static Site Updates](https://confluence.cms.gov/x/84P0Fw).

## Codebook
The [`_codebook` directory](_codebooks/) and the [corresponding Jekyll plugin](_plugins/api_codings.rb) are used to create the variables resources, such as [this one](https://bluebutton.cms.gov/resources/variables/clm_non_utlztn_days_cnt/). Although these *URLs* show little to no usage from analytics, they are used as *URIs* and are **integral to the [Beneficiary FHIR Data (BFD) endpoint responses](https://github.com/CMSgov/beneficiary-fhir-data/tree/b1ca6c4b630f6b0e5aa7e812addabf72bc334fe3/apps/bfd-server/bfd-server-war/src/test/resources/endpoint-responses)**. For now (Dec 2021), changing the URIs would require completely retiring all of the BFD v1 and v2 APIs and releasing a new v3 with different URIs. Any additions or changes to these URIs should involve the BFD team.
