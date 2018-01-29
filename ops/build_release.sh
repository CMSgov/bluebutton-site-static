#!/usr/bin/env bash
set -euo pipefail
usage() {
    cat <<EOF >&2
Start a new Developer Portal release.

Usage: $(basename "$0") [-ch] [-t previous-tag new-tag]

Options:
  -c    wait for confirmation before committing and pushing to GitHub
  -h    print this help text and exit
  -t    manually specify tags
EOF
}

CONFIRM=
MANUAL_TAGS=
while getopts ":cht" opt; do
    case "$opt" in
        c)
            CONFIRM=1
            ;;
        t)
            MANUAL_TAGS=1
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ $# -lt 2 ] && [ -n "$MANUAL_TAGS" ]; then
  usage
  exit 1
fi

# fetch tags before any tag lookups so we have the most up-to-date list
# and generate the correct next release number
git fetch --tags

if [ -n "$MANUAL_TAGS" ]; then
  PREVTAG="$1"
  NEWTAG="$2"
  PREVRELEASENUM=${PREVTAG//^r/}
  NEWRELEASENUM=${NEWTAG//^r/}
else
  PREVTAG=$(git tag | sort -n | tail -1)
  PREVRELEASENUM=$(git tag | grep '^r[0-9]' | sed 's/^r//' | sort -n | tail -1)
  NEWRELEASENUM=$(($PREVRELEASENUM + 1))
  PREVTAG="r$PREVRELEASENUM"
  NEWTAG="r$NEWRELEASENUM"
fi

RELEASE_NOTES="RELEASE.txt"
[ ! -f $RELEASE_NOTES ] && echo "Must run script in top-level Developer Portal directory." >&2 && exit 1
tempfoo=$(basename $0)
TMPFILE=$(mktemp "/tmp/${tempfoo}.XXXXXX") || exit 1

commits=$(git log --pretty=format:"- %s" $PREVTAG..HEAD)

echo "$NEWTAG - $(date +%Y-%m-%d)" > "$TMPFILE"
echo "================" >> "$TMPFILE"
echo "" >> "$TMPFILE"
echo "$commits" >> "$TMPFILE"
echo "" >> "$TMPFILE"

cat $RELEASE_NOTES >> "$TMPFILE"

if [ -n "$CONFIRM" ]; then
    echo "===> git status"
    git --no-pager status

    echo
    echo "===> git diff"
    git --no-pager diff

    echo
    echo -n "OK to continue? (y/N) "
    read -r answer
    case "$answer" in
        y|Y) ;; # nop
        *) exit 1 ;;
    esac
fi

git checkout -b "release-$NEWRELEASENUM"

mv "$TMPFILE" "$RELEASE_NOTES"

# Add release notes and push that commit to github

git add $RELEASE_NOTES

git commit -m"Update release notes for $NEWTAG"

git tag -a -m"Developer Portal release $NEWTAG" -s "$NEWTAG"

git push --tags

git push origin "release-$NEWRELEASENUM"

echo "Release $NEWTAG created."
echo
echo "Create PR at https://github.cms.gov/CMS-WDS/developer-portal/compare/release-$NEWRELEASENUM?expand=1"
echo
echo "Trigger build at https://cloudbeesjenkins.cms.gov/prod-master/job/wds/job/Developer%20Portal/job/Developer%20Portal/"
echo
