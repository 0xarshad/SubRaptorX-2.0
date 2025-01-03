#! /bin/bash

green=$(tput setaf 2)
reset=$(tput sgr0)
${green}
echo "Updating"
${reset}
sudo apt update -y
${green}
echo "Installing Go"
{reset}
sudo apt install golang-go -y
${green}
echo "Installing  Assetfinder"
{reset}
go install -v github.com/tomnomnom/assetfinder@latest
${green}
echo "Installing  Subfinder"
{reset}
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
${green}
echo "Installing  Httprobe"
{reset}
go install github.com/tomnomnom/httprobe@latest
${green}
echo "Installing Waybackurls"
{reset}
go install github.com/tomnomnom/waybackurls@latest
${green}
echo "Copying files to /usr/bin"
{reset}
sudo cp -r /home/$(getent passwd $(id -u) | cut -d: -f1)/go/bin/* /usr/bin/
${green}
echo "Installation Completed"
{reset}
