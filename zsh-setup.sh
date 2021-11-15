#!/bin/bash

RED='\033[1;31m'
GRN='\033[1;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
WHT='\033[1;37m'
MGT='\033[1;95m'
CYA='\033[1;96m'
END='\033[0m'
BLOCK='\033[1;37m'



# output a "log" line with bold leading >>>
log() {
  printf >&2 "${BLOCK}#${END} $1\n";
}


# highlight a new section
section() {
  echo ""
  echo ""
  log "${BLU}$1${END} ..."
  log "${BLU}************************************************************${END}"
  echo ""
}


#homedir=$( getent passwd "$USER" | cut -d: -f6 )


section "Updating apt ..."
apt-get update
apt update



section "Installing curl ..."
apt install curl -y




section "Installing git ..."
apt install git -y



section "Installing zsh ..."
apt install zsh -y






#section "Installing fasd ..."
##//region folder jump
#apt-get install fasd -y



#section "Installing docker auto complete ..."
## docker auto complete
#curl \
#  -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
#  -o /etc/bash_completion.d/docker-compose
#

#
#section "Installing kubectl auto complete ..."
#source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
#echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell
#


#mv "$homedir"/.zshrc "$homedir"/.zshrc.org
#ln ./.zshrc "$homedir"/.zshrc
#
#
#source "$homedir"/.zshrc
