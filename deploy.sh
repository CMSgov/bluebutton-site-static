#!/bin/bash

set -e

SITE_DIR=${1:-"_site"}
S3_BUCKET=${2:-"bluebutton.cms.gov"}

if [ -z "$(which aws)" ]
then
  echo "AWS cli tools are required. See: https://docs.aws.amazon.com/cli/latest/userguide/installing.html"
  exit 1
fi

echo "aws s3 sync --delete ./$SITE_DIR/ s3://$S3_BUCKET"
