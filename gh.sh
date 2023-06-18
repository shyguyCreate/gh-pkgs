#!/bin/sh

#Add -f (force flag) to script
forceFlag=false
while getopts ":f" opt; do
  case $opt in
    f) forceFlag=true ;;
    *) echo "Use -f to force installation" ;;
  esac
done

#Reset getopts automatic variable
OPTIND=1


#Get latest tag_name
if $forceFlag || [ ! -f /tmp/tag_name_gh ]
then
  curl -s https://api.github.com/repos/cli/cli/releases/latest \
  | grep tag_name \
  | cut -d \" -f 4 \
  | xargs > /tmp/tag_name_gh
fi

#Save tag_name to variable
tag_name=$(cat /tmp/tag_name_gh)
#Set the install directory with github tag added to its name
installDir="/opt/gh $tag_name"


#Get the current version of the program
unset current_version; if [ -n "$(ls -d /opt/gh\ *)" ]
then
  current_version=$(basename /opt/gh\ * | awk '{print $2}')
fi


#Start installation if github version is not equal to installed version
if $forceFlag || [ "$tag_name" != "$current_version" ]
then
  #Download binaries
  curl -s https://api.github.com/repos/cli/cli/releases/latest \
  | grep "browser_download_url.*linux_amd64.tar.gz\"" \
  | cut -d \" -f 4 \
  | xargs curl -L -o /tmp/gh.tar.gz

  #Remove contents if already installed
  sudo rm -rf /opt/gh\ *

  #Create folder for contents
  sudo mkdir -p "$installDir"

  #Expand tar file to folder
  sudo tar zxf /tmp/gh.tar.gz --strip-components=1 -C "$installDir"

  #Change execute permissions
  sudo chmod +x "$installDir/bin/gh"

  #Create symbolic link to bin folder
  sudo ln -sf "$installDir/bin/gh" /usr/bin

  #Add completions for bash
  sudo mkdir -p /usr/share/bash-completion/completions
  gh completion -s bash | sudo tee /usr/share/bash-completion/completions/gh > /dev/null

  #Add completions for zsh
  sudo mkdir -p /usr/share/zsh/site-functions
  gh completion -s zsh | sudo tee /usr/share/zsh/site-functions/_gh > /dev/null
else
  echo "Github-Cli is up to date."
fi
