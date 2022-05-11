#!/bin/bash
now=$(date +"%m-%d-%Y")
# STAGING_HASH=$1
# HASH=$2

STAGING_HASH="66e65ff7fe584c244c2817263bdfcd457c41327d"
HASH="HEAD"
CONVENTION=("feat" "fix" "perf" "refactor" "style" "test" "build" "ops" "docs" "chore" "merge" "revert")

echo "# Release Notes $now">wiki/changelog.md
echo "## Project: core-api">>wiki/changelog.md
echo "**commit:** [$STAGING_HASH](https://github.com/rafaelaraujo-ezops/test/commit/$STAGING_HASH)">>wiki/$now-changelog.md


for ((x=0; x <= ${#CONVENTION[@]}; x++)) ; do         
        case ${CONVENTION[$x]} in
            "feat") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Features">>wiki/changelog.md 
                    
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author:**[%an](%ae) %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "fix") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                   echo "### Fix">>wiki/changelog.md  
                   body=$( [[ -z $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"%b")  ]] && echo "> \"%b\" %n" || echo "")
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "perf") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Performance">>wiki/changelog.md  
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "refactor")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Refactor">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "style") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Style">>wiki/changelog.md
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
             ;;
            "test")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Test">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
                ;;
            "build")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Build">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "ops")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Ops">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "docs")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Docs">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "chore") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Chore">>wiki/changelog.md 
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
             ;;
            "merge")  
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Merges">>wiki/changelog.md
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
            ;;
            "revert") 
                if [[ -n $(git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})") ]]; then
                    echo "### Revert">>wiki/changelog.md                
                    git log $STAGING_HASH..$HASH -i -E --grep="^(${CONVENTION[$x]})" --pretty=format:"**Author: %an** %n%n **commit message:** %s  %n%n %n%n **Notes:** %N %n">>wiki/changelog.md
                fi
             ;;
        esac        
        
done

