#!/bin/bash
# Colors for text output

red=$(tput setaf 1)

green=$(tput setaf 2)

blue=$(tput setaf 4)

yellow=$(tput setaf 3)

cyan=$(tput setaf 6)

white=$(tput setaf 7)

bold=$(tput bold)

reset=$(tput sgr0)



# Stylish Dividers

divider() {

    echo -e "${yellow}============================================================${reset}"

}



header() {

    echo -e "
                                                                           ${red} ██╗    ██╗ ${reset} ${white}
███████╗██╗   ██╗██████╗ ██████╗  █████╗ ██████╗ ████████╗ ██████╗ ██████╗${reset} ${red} ╚██╗  ██╔╝ ${reset} ${white}   ██████╗     ██████╗ 
██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗${reset} ${red} ╚██╗██╔╝ ${reset} ${white}   ╚════██╗   ██╔═████╗
███████╗██║   ██║██████╔╝██████╔╝███████║██████╔╝   ██║   ██║   ██║██████╔╝${reset} ${red}  ╚███╔╝  ${reset} ${white}    █████╔╝   ██║██╔██║
╚════██║██║   ██║██╔══██╗██╔══██╗██╔══██║██╔═══╝    ██║   ██║   ██║██╔══██╗${reset} ${red}  ██╔██╗  ${reset} ${white}   ██╔═══╝    ████╔╝██║
███████║╚██████╔╝██████╔╝██║  ██║██║  ██║██║        ██║   ╚██████╔╝██║  ██║${reset} ${red} ██╔╝ ██╗ ${reset} ${white}   ███████╗██╗╚██████╔╝
╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝        ╚═╝    ╚═════╝ ╚═╝  ╚═╝${reset} ${red}██╔╝   ██╗  ${reset} ${white}  ╚══════╝╚═╝ ╚═════╝ 
                                                                          ${reset} ${red} ╚═╝    ╚═╝ ${reset}            

"   echo -e "${bold}${cyan}🔍 ----------------------------------------- ${bold}${green} Subdomain Enumeration Tool ${reset} ${bold}${cyan}----------------------------------------- 🔍${reset}"

    echo -e "${bold}${cyan}            ------------------------------- ${white}Coded by ${bold}${red}0Xarshad ${reset} ${bold}${cyan}------------------------------- ${reset} "

    divider

}



# Greeting Function

greetings() {

    header

    echo -e "${green}Welcome ${red}$USER!${reset}"

    echo -e "Ensure the following tools are installed:"

    echo -e "${blue}- assetfinder${reset}, ${blue}- subfinder${reset}, ${blue}- httprobe${reset}, ${blue}- waybackurls${reset}, ${blue}- curl${reset}"

    divider

}



# Dependency Check

check_dependencies() {

    echo -e "${bold}${cyan}🔄 Checking dependencies...${reset}"

    for tool in assetfinder subfinder httprobe waybackurls curl; do

        if ! command -v $tool &> /dev/null; then

            echo -e "${red}❌ Error:${reset} $tool is not installed. Please install it."

            exit 1

        else

            echo -e "${green}✅ $tool is installed.${reset}"

        fi

    done

    divider

}



# Loading Animation

loading() {

    echo -n "${yellow}⏳ $1...${reset}"

    sleep 1

    echo -e " ${green}Done! ✅${reset}"

}



# End Function

end() {

    divider

    echo -e "${bold}${green}🎯 Process Completed Successfully!${reset}"

    echo -e "${yellow}Thank you for using ${cyan}${reset}!"

    divider

}



# Main Steps

find_subdomains() {

    read -p "${cyan}🔗 Enter the Domain:${reset} " dom

    if [[ -z "$dom" ]]; then

        echo -e "${red}❌ Error:${reset} Domain cannot be empty."

        exit 1

    fi



    divider

    echo -e "${bold}${blue}🚀 Starting subdomain enumeration for ${yellow}$dom${reset}"

    divider



    # Step 1: Assetfinder

    loading "Running assetfinder"

    assetfinder --subs-only "$dom" > assetfinder_subs.txt



    # Step 2: Subfinder

    loading "Running subfinder"

    subfinder -d "$dom" -silent > subfinder_subs.txt



    # Step 3: Waybackurls

    loading "Extracting URLs from Wayback Machine"

    echo "$dom" | waybackurls | grep "$dom" | awk -F[/:] '{print $4}' | sort -u > wayback_subs.txt



    # Step 4: Consolidate and Deduplicate Results

    loading "Consolidating and removing duplicates"

    cat assetfinder_subs.txt subfinder_subs.txt wayback_subs.txt | sort -u > all_subs.txt



    # Step 5: Probe for Live Subdomains

    loading "Probing for live subdomains with httprobe"

    cat all_subs.txt | httprobe > live_subs_httprobe.txt



    loading "Probing for live subdomains with Curl"

    while read sub; do

        if curl -s --head --connect-timeout 5 "http://$sub" >/dev/null; then

            echo "$sub" >> live_subs_curl.txt

        fi

    done < all_subs.txt



    # Final Clean and Output

    loading "Final Sorting and finalizing results"

    cat live_subs_httprobe.txt live_subs_curl.txt > all_subs-end.txt

    while read url ; do

	echo ${url#*//} >> final.txt

    done < all_subs-end.txt

    sort -u final.txt > final_live_subs.txt

    divider

    echo -e "${bold}${green}🎯 Live Subdomains of ${yellow}$dom:${reset}"

    echo -e "${blue}--------------------------------------------${reset}"

    cat final_live_subs.txt

    echo -e "${blue}--------------------------------------------${reset}"

    echo -e "${green}✅ Results saved in ${red}final_live_subs.txt${reset}"

    

    # Cleanup temporary files

    rm -f assetfinder_subs.txt subfinder_subs.txt wayback_subs.txt all_subs.txt live_subs_httprobe.txt live_subs_curl.txt final.txt

}



# Run Script

greetings

check_dependencies

find_subdomains

end

