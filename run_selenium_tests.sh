#!/bin/bash

# Run the selenium tests against local or remote bb2 in docker
#

echo_msg () {
    echo "$(basename $0): $*"
}

display_usage() {
    echo
    echo "Usage:"
    echo "------------------"
    echo
    echo "Syntax: run_selenium_tests.sh [-h|d] [LOCAL|STAGING|PROD|<bb2 server url>]"
    echo
    echo "Options:"
    echo
    echo "-h     Print this Help."
    echo
    echo "Note, tests are in selenium debug mode (vnc view web UI interaction at http://localhost:5900)."
    echo
    echo "Examples:"
    echo
    echo "run_selenium_tests.sh  http://localhost:4000/ (or LOCAL)"
    echo
    echo "run_selenium_tests.sh  https://staging.bluebutton.cms.gov/ (or STAGING)"
    echo
    echo "run_selenium_tests.sh  https://bluebutton.cms.gov/ (or PROD)"
    echo
    echo "<bb2 server url> default to STAGING (https://staging.bluebutton.cms.gov/)"
    echo
    echo
}

# main
echo_msg
echo_msg RUNNING SCRIPT:  ${0}
echo_msg

# Set bash builtins for safety
set -e -u -o pipefail

export HOME_PAGE_URL="https://staging.bluebutton.cms.gov/"

while getopts "h" option; do
   case $option in
      h)
        display_usage;
        exit;;
     \?)
        display_usage;
        exit;;
   esac
done

if [[ -n ${1-''} ]]
then
    case "$1" in
        LOCAL)
            export HOME_PAGE_URL="http://web:4000/"
            ;;
        STAGING)
            export HOME_PAGE_URL="https://staging.bluebutton.cms.gov/"
            ;;
        PROD)
            export HOME_PAGE_URL="https://bluebutton.cms.gov/"
            ;;
        *)
            if [[ $1 == 'http*' ]]
            then
                export HOME_PAGE_URL=$1
            else
                echo "Invalid argument: " $1
                display_usage
                exit 1
            fi
            ;;
    esac
fi

# Set SYSTEM
SYSTEM=$(uname -s)

echo "BB2 Site Static URL=" ${HOME_PAGE_URL}

# stop all before run selenium tests
docker-compose -f docker-compose.selenium.yml down --remove-orphans

if [[ ${HOME_PAGE_URL} == "http://web:4000/" ]]
then
    echo "web server is a local instance...."
    docker-compose -f docker-compose.selenium.yml --profile local-web up --abort-on-container-exit
else
    echo "web server is a remote instance...."
    docker-compose -f docker-compose.selenium.yml --profile remote-web up --abort-on-container-exit
fi

# Stop containers after use
echo_msg
echo_msg "Stopping containers..."
echo_msg

docker-compose -f docker-compose.selenium.yml stop
