#!/usr/bin/env bash
set -x

rbenv local 2.3.0
gem install  --no-ri --no-rdoc bundler
bundle install
TMPFILE=$(mktemp)
mv $TMPFILE $TMPFILE.yml
echo "baseurl: /${ghprbPullId}" >> $TMPFILE.yml
echo "file contents"
cat $TMPFILE.yml
echo "building"
bundle exec jekyll build --verbose --trace --config _config.yml,$TMPFILE.yml

echo "build completed"
ls -lh _site
rm $TMPFILE.yml