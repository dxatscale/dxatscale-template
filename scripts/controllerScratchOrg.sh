#!/usr/bin/env sh
# Function to delete scratchOrg and feature branch in case of failure
clearSetup(){
    git checkout main
    git branch -D feature/$1
    echo "An error occured while fetching your scratch org. Please ask your Salesforce/GitHub Admin for help."
    exit 1
}

# Echos a message in case the argument fo $1 is not given
if [ -z $1 ]
  then
    echo "Please add argument for the branch name. Recommended format is <initials of developer>-<User story id>"
    exit 1
fi

# This is command should be then the real command used when the PR is merged.
# Checkouts to new feature branch and fetch the scratch Org from the dev Pool
#git checkout main && git pull origin main && git checkout -b feature/$1 || {
#    echo "Something went wrong. Make a screenshot from the console and send to your admin."
#    exit 1
#}

# Remove this command (25-28) after testing the PR
git checkout -b feature/$1 || {
    echo "Something went wrong. Make a screenshot from the console and send to your admin."
    exit 1
}

# Adds permission to the sub-scripts that fetches the scratch Org
chmod +x ./scripts/fetchScratchOrg.sh

# Calls the sub-script
bash ./scripts/fetchScratchOrg.sh $1 ||
    clearSetup $1

# Publishes the new branch    
git push --set-upstream origin feature/$1
