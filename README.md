# Blue Button API
A static Jekyll site for the Blue Button API splash page: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/)

## Requirements
It is assumed that the environment already has these installed:
* [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/) to install versioned ruby
* [ruby](https://www.ruby-lang.org/en/) currently using 2.4
* [jekyll](https://jekyllrb.com/) currently using 3.5.2

## Installation
1. `$ gem install bundler` <—install Gem bundler
2. `$ bundle install` <—install Gem bundles

## Build
Jekyll builds the CSS and HTML pages. Run `bundle exec jekyll serve` from the project root for a local build. By default, the site will run in `http://localhost:4000/`. You can also run `bundle exec jekyll build` to compile the site files into the `_site` directory.

## Deploy
From the project root, run `$ ./ops/build_release.sh`. This outputs two links:

1. Takes you to a branch where you can make a release PR
2. Takes you to a Jenkins job

Make the release PR, then log in to [CBJ](https://cloudbeesjenkins.cms.gov). (You need to be on OpenVPN to do this part.)

On [CBJ](https://cloudbeesjenkins.cms.gov):
1. Go to Prod master / WDS / Developer Portal
2. Click "Build with parameters" on the left side
3. Add `r#`, with # being the release number from the PR
4. Click build

If it fails, or if you want to deploy to imp or production rather than test:
1. Navigate back to Prod master / WDS / Developer Portal and *go to Deploy instead*
2. Click "Build with parameters" on the left side
3. Add `r#`, with # being the release number from the PR
4. *Choose test, imp or prod from the dropdown*
5. *Check the deploy box*
6. *Click build*
