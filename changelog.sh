#!/bin/bash
now=`date`
# STAGING_HASH=$1
# HASH=$2

STAGING_HASH="66e65ff7fe584c244c2817263bdfcd457c41327d"
HASH="HEAD"

CONVENTION=("feat" "fix" "perf" "refactor" "style" "test" "build" "ops" "docs" "chore" "merge" "revert")

echo "# Release Notes $now">wiki/changelog.md
echo "## Project: core-api">>wiki/changelog.md
echo "**commit:** [$STAGING_HASH](https://github.com/rafaelaraujo-ezops/test/commit/$STAGING_HASH)">>wiki/changelog.md

for ((x=0; x < ${#CONVENTION[@]}; x++)) ; do 
 if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; 
    then
        case ${CONVENTION[$x]} in
            "feat") echo "### Features">>wiki/changelog.md ;;
            "fix") echo "### Fix">>wiki/changelog.md ;;
            "perf") echo "### Performance">>wiki/changelog.md ;;
            "refactor") echo "### Refactor">>wiki/changelog.md ;;
            "style") echo "### Style">>wiki/changelog.md ;;
            "test") echo "### Test">>wiki/changelog.md ;;
            "build") echo "### Build">>wiki/changelog.md ;;
            "ops") echo "### Ops">>wiki/changelog.md ;;
            "docs") echo "### Docs">>wiki/changelog.md ;;
            "chore") echo "### Chore">>wiki/changelog.md ;;
            "merge") echo "### Merges">>wiki/changelog.md ;;
            "revert") echo "### Revert">>wiki/changelog.md ;;
        esac
        git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s *hash:%h* %n%n %n%n %N > \"%b\" %n">>wiki/changelog.md
    fi ;
done
