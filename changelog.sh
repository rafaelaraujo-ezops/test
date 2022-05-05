#!/bin/sh
now=`date`
STAGING_HASH=$1
HASH=$2

echo "# Release Notes $now">wiki/changelog.md
echo "## Project: core-api">>wiki/changelog.md
echo "**commit:** [$STAGING_HASH]((https://github.com/rafaelaraujo-ezops/test/commit/$STAGING_HASH)">>wiki/changelog.md
echo "### Features">>wiki/changelog.md
git log $STAGING_HASH..$HASH -i -E --grep="^(feat)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n">>wiki/changelog.md 
echo "### Fixes">>wiki/changelog.md
git log $STAGING_HASH..$HASH -i -E --grep="^(fix)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n">>wiki/changelog.md
echo "### Styles">>wiki/changelog.md
git log $STAGING_HASH..$HASH -i -E --grep="^(style)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n">>wiki/changelog.md
echo "### OPS">>wiki/changelog.md
git log $STAGING_HASH..$HASH -i -E --grep="^(ops)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n">>wiki/changelog.md
cat wiki/changelog.md


# ORIGINAL COMMAND
# echo "# Release Notes x ${{ steps.date.outputs.date }}">wiki/changelog.md
# echo "## Project ${{github.repository}}">>wiki/changelog.md
# echo "**commit:** [${{github.sha}}](${{github.server_url}}/${{github.repository}}/commit/${{github.sha}})">>wiki/changelog.md
# echo "### Features" >> wiki/changelog.md
# git log ${{env.STAGING_HASH}}..${{env.HASH}} -i -E --grep="^(feat)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n" > wiki/changelog.md 
# echo "### Fixes" >> wiki/changelog.md
# git log ${{env.STAGING_HASH}}..${{env.HASH}} -i -E --grep="^(fix)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n" > wiki/changelog.md
# echo "### Styles" >> wiki/changelog.md
# git log ${{env.STAGING_HASH}}..${{env.HASH}} -i -E --grep="^(style)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n" > wiki/changelog.md
# echo "### OPS" >> wiki/changelog.md
# git log ${{env.STAGING_HASH}}..${{env.HASH}} -i -E --grep="^(ops)" --pretty=format:"**Author: %an** %n%n **commit message:** %s *at %ah* %n%n %N %n" > wiki/changelog.md
# cat wiki/changelog.md