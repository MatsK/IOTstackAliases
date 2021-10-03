#!/bin/bash


# Check if git is installed
GIT_VERSION="$(git --version)"

if [ "$GIT_VERSION" != "command not found" ]; then
   printf "\n"
   echo "git is already installed"
   printf "\n"
else
   printf "\n"
   echo "git needs to be installed"
   echo "sudo apt install git"
   printf "\n"
fi


# Get install script from github
echo "Get IOTstackAlias from github.com"


# Change 
echo "Change ~/.bashrc and/or ~/.profile so the aliases is availabe after a logout/reboot"


