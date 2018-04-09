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

Use the [deploy static site](https://cloudbeesjenkins.cms.gov/dev-master/job/Blue%20Button/job/deploy%20static%20site/) job.
