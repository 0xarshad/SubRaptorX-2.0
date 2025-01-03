
# 🦖 **SubRaptorX 2.0**  

🔍 **An advanced, feature-rich Bash script for discovering and validating live subdomains effortlessly.**  

---

## 📚 **Description**  

**SubRaptorX 2.0** is the newer version my old subdomain enumeration script. It combines the power of multiple tools like **Assetfinder**, **Subfinder**, **Waybackurls**, **Httprobe**, and **Curl** to discover, validate, and organize live subdomains. With a stylish terminal interface and automated dependency installation, it ensures a seamless experience for both security professionals and enthusiasts.  

---

## 🚀 **Features**  

- ✅ **Multi-Source Subdomain Enumeration:** Assetfinder, Subfinder, and Waybackurls.  
- ✅ **Live Subdomain Validation:** Httprobe and Curl-based checks.  
- ✅ **Automated Dependency Installation:** `install.sh` and `fix_install.sh` scripts for Automated installation.
- ✅ **URL Normalization:** Removes `http://` and `https://` prefixes for consistency.  
- ✅ **Deduplication:** Ensures unique subdomains in the final output.  
- ✅ **Stylish Terminal Interface:** Color-coded and easy-to-read output.  
- ✅ **Result Export:** Clean results saved in `domain.name_live_subs.txt`.  

---

## 🛠️ **Dependencies**  

Dependencies are autonomously managed by the `install.sh` script utilizing ***Go***. During testing on widely-used Linux distributions, excluding ***Kali Linux***, I encountered a `GOROOT error` during the Subfinder installation process. To address this anomaly, I developed a remediation script named `fix_install.sh`. If you encounter a` GOROOT error` while executing `install.sh`, ensure you run `fix_install.sh` beforehand. Special thanks to [prathameshbagul](https://medium.com/@prathameshbagul) for their valuable contributions.

***Important:*** The `fix_install.sh` script will purge any pre-existing ***Go*** installation and reinstall it while resolving path-related inconsistencies. It’s strongly recommended to back up your ***Go*** directory if it contains any critical data.

### 🐧 **Manual Installation (if needed)**  
Make sure to copy all the tools to `/usr/bin` to make it permanantly available from anywhere.
( `sudo cp ~/go/bin/* /usr/bin`

****Special Thanks to**** [tomnomnom](https://github.com/tomnomnom) , [projectdiscovery](https://github.com/projectdiscovery) and [curl](https://github.com/curl) for these amazing tools.
- **Assetfinder:** [GitHub Link](https://github.com/tomnomnom/assetfinder)  
- **Subfinder:** [GitHub Link](https://github.com/projectdiscovery/subfinder)  
- **Httprobe:** [GitHub Link](https://github.com/tomnomnom/httprobe)  
- **Waybackurls:** [GitHub Link](https://github.com/tomnomnom/waybackurls)  
- **Curl:** Pre-installed on most Linux systems.  

---

## 💻 **Installation**  

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/yourusername/SubRaptorX.git
   cd SubRaptorX
   ```

2. **Run the Installation Script:**  
   ```bash
   sudo chmod +x install.sh
   sudo ./install.sh
   ```

3. **Make the Script Executable:**  
   ```bash
   chmod +x SubRaptorX.sh
   ```

4. **Run SubRaptorX 2.0:**  
   ```bash
   ./SubRaptorX.sh
   ```

---

## 📝 **Usage**  

1. **Run the script:**  
   ```bash
   ./SubRaptorX.sh
   ```

2. **Enter your target domain when prompted:**  
   ```
   🔗 Enter the Domain (eg: test.com): example.com
   ```

3. **The script will:**  
   - Enumerate subdomains.  
   - Validate live subdomains.  
   - Remove duplicates and clean URLs.  
   - Save the final result to `domain.name_live_subs.txt`.  
---

## 🛡️ **Example Output**  

```
🎯 Live Subdomains of example.com:
--------------------------------------------
sub1.example.com
sub2.example.com
sub3.example.com
--------------------------------------------
✅ Results saved in final_live_subs.txt
```

---

## 🤝 **Contributing**  

Contributions are welcome! Just contact me through Linkedin 

⭐ **If you find SubRaptorX 2.0 useful, don't forget to star the repository!** ⭐  

🦖 **Unleash the Raptor, conquer the domains!** 🚀✨  
