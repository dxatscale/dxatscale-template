#!/usr/bin/env sh
# Checks if the feature branch name is entered or not by the user
if [ -z $1 ]
  then
    echo "No argument for a branch name. Recommended format is <initials of developer>.<User story id>"
    exit 1
fi

# Fetch Scratch Org from DEV Pool
# Add authInfo.txt to the .gitignore so it is not saved in the repo just to be sure
# The script will remove the files anyway (line 43)
# I couldn't use the standard json file that sfpowerscipt uses for the authentication because of the timing
sfdx sfpowerscripts:pool:fetch -t dev > authInfo.txt

# Find the username of the fetched Scratch Org and assign it to a variable 
# File to search
file="authInfo.txt"

# Searching for an email format which corresponds with the scratch org username and saves it in a variable to be used later
usernameSO="$(grep -o -E "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,6}\b" $file | head -n 1)"
echo $usernameSO

# Sets alias for scratch Org the same as the feature branch for matching and better visibility
sfdx force:alias:set $1=$usernameSO

# Assigns the scratch Org as deafult Org in vsCode project
sfdx config:set defaultusername=$1

# Pushes metadata to the empty scratch org
# Remove the # belo if you wish to push the metadata again after fetching the dev Scratch Org
#sfdx force:source:push -f -u $1 -w 60 || {
#    exit 1
#}

# Resets source tracking to avoid unnessesary changes like layouts being pulled
sfdx force:source:tracking:reset -u $1 --noprompt

# Opens the scratch Org in a browser tab
echo "Your new scratch org will open in your browser within a few seconds... ✅"
sfdx force:org:open -u $1

# Removes the authInfo.txt file from line 13 so the credentials are not saved in repo
rm authInfo.txt
