#! /bin/bash
green=$(tput setaf 2)
reset=$(tput sgr0)
echo "${green}Removing Go if already installed${reset}"
sudo apt-get remove golang-go
echo "${green}Removing existing golang-go dependencies${reset}"
sudo apt-get remove — auto-remove golang-go
echo "${green}Removing if there is any existing Go package${reset}"
sudo rm -rvf /usr/local/go
echo "${green}Downloading the Go archive${reset}"
wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz
echo "${green}Extracting the archive file${reset}"
sudo tar -xvf go1.21.3.linux-amd64.tar.gz
echo "${green}Placing the Go directory in the desired location (/usr/local)${reset}"
sudo mv go /usr/local
echo "${green}Setting GOROOT to the Go installation location${reset}"
export GOROOT=/usr/local/go
echo "${green}Defining GOPATH as your Go workspace directory${reset}"
export GOPATH=$HOME/go
echo "${green}Adding Go binary paths to your PATH${reset}"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo "${green}Reloading environment variables${reset}"
source ~/.profile
echo "${green}Go reinstalled successfully${reset}"
echo "Now you can run install.sh to install all dependencies"
