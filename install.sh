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


# ~/.bashrc
if grep -wq "export LS_COLORS"  ~/.bashrc; then
    echo "Exists"
else
    echo "Does not exist"
    cat <<EOF >> test.txt
. "$HOME/.local/motd.sh"
. "$HOME/IOTstackAliases/dot_iotstack_aliases"

# Fix for that bash_history isnt saved in ssh.
# https://superuser.com/questions/555310/bash-save-history-without-exit
export PROMPT_COMMAND='history -a'
LS_COLORS='di=0;36' ; export LS_COLORS
EOF
fi
