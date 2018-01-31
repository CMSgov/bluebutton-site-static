#!/bin/bash

##
# Run this script from the root of the project:
#
#   ./ops/deploy_s3.sh <site-dir> <s3-bucket>
##

set -e

SITE_DIR=${1:-"_site"}
S3_BUCKET=${2:-"bluebutton.cms.gov"}

gem install  --no-ri --no-rdoc bundler
bundle install
bundle exec jekyll build
aws s3 sync --delete ./$SITE_DIR/ s3://$S3_BUCKET
