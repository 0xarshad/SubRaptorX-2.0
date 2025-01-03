#! /bin/bash
green=$(tput setaf 2)
reset=$(tput sgr0)
echo "${green}Updating${reset}"
sudo apt update -y
echo "${green}Installing Go${reset}"
sudo apt install golang-go -y
echo "${green}Installing  Assetfinder${reset}"
go install -v github.com/tomnomnom/assetfinder@latest
echo "${green}Installing  Subfinder${reset}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "${green}Installing  Httprobe${reset}"
go install github.com/tomnomnom/httprobe@latest
echo "${green}Installing Waybackurls${reset}"
go install github.com/tomnomnom/waybackurls@latest
echo "${green}Copying files to /usr/bin${reset}"
sudo cp -r /home/$(getent passwd $(id -u) | cut -d: -f1)/go/bin/* /usr/bin/
echo "${green}Installation Completed${reset}"
