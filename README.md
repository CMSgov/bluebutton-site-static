# CMS Blue Button 2.0 API Static Site
A static Jekyll site for the Blue Button 2.0 API splash page: [https://bluebutton.cms.gov](https://bluebutton.cms.gov/)

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

## Get CSS/Styles Working
We've moved the CSS for this application and our Sandbox application into a consolidated [Blue Button 2.0 API CSS repository](https://github.com/CMSgov/bluebutton-css) so that we can more easily keep things consistent and deploy changes more quickly.

You'll need to clone/download the BlueButton CSS repository to get started. If you're using a terminal on a Mac/Linux machine, navigate into the `bluebutton-site-static` repository and then run the following command:

```bash
git clone git@github.com:CMSgov/bluebutton-css.git
```

If you need to make CSS changes, make them within this directory and commit them to that repository. These changes will be ignored by the git status of the `bluebutton-site-static` project, but you will see any CSS changes take effect locally.

For more instructions on how to make changes, view the readme inside of the `bluebutton-css` directory.

## Deploy

Use the [deploy static site](https://cloudbeesjenkins.cms.gov/dev-master/job/Blue%20Button/job/deploy%20static%20site/) job.
