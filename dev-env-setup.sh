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



section "Updating apt ..."
apt-get update
apt update


section "Installing JDK ..."
# install java development environment
# use jdk, jre does not have javac
apt-get install openjdk-8-jdk -y


section "Installing  C++ ..."
apt install g++ -y
apt install make -y



section "Installing git ..."
apt install git -y



section "Installing nodejs..."
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get install -y nodejs
apt install npm -y

   # uninstall nodejs
   # apt-get remove nodejs
   # apt-get remove npm

# yarn
npm install --global yarn

# Nodemon Error: System limit for number of file watchers reached
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p


section "Installing Docker ..."
apt update
apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt install docker-ce docker-ce-cli containerd.io -y



section "Installing docker-compose ..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


section "Installing kubectl ..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
