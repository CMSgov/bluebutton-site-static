# Developer Portal

| Build a Branch | Build a Release | Deploy a Release |
|----------------|-----------------|------------------|
|![](http://cloudbeesjenkins.cms.gov/prod-master/buildStatus/icon?job=wds/Developer%20Portal/build-a-branch) | ![](http://cloudbeesjenkins.cms.gov/prod-master/buildStatus/icon?job=wds/Developer%20Portal/Developer%20Portal) | ![](http://cloudbeesjenkins.cms.gov/prod-master/buildStatus/icon?job=wds/Developer%20Portal/Deploy) |

## Build a branch

Job runs on each pull request and comments with a link to the built site.
Job is available for editing [on jenkins here](https://cloudbeesjenkins.cms.gov/prod-master/job/wds/job/Developer%20Portal/job/build-a-branch/)

## Creating a release

To create a release, run `./ops/build_release.sh` from the project root. It will create a new tag, output a link to create a pull request, and a link to build that tag on jenkins

## Build a release

After creating a tag, visit https://cloudbeesjenkins.cms.gov/prod-master/job/wds/job/Developer%20Portal/job/Developer%20Portal/ and enter that tag when building


