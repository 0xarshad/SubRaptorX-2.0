
# 🦖 **SubRaptorX 2.0**  

🔍 **An advanced, feature-rich Bash script for discovering and validating live subdomains effortlessly.**  

---

## 📚 **Description**  

**SubRaptorX 2.0** is the newer version my old subdomain enumeration script. It combines the power of multiple tools like **Assetfinder**, **Subfinder**, **Waybackurls**, **Httprobe**, and **Curl** to discover, validate, and organize live subdomains. With a stylish terminal interface and automated dependency installation, it ensures a seamless experience for both security professionals and enthusiasts.  

---

## 🚀 **Features**  

- ✅ **Multi-Source Subdomain Enumeration:** Assetfinder, Subfinder, and Waybackurls.  
- ✅ **Live Subdomain Validation:** Httprobe and Curl-based checks.  
- ✅ **Automated Dependency Installation:** `main_install.sh` and `alternative_install.sh` script for Linux distributions using ****Go****.
- ✅ **URL Normalization:** Removes `http://` and `https://` prefixes for consistency.  
- ✅ **Deduplication:** Ensures unique subdomains in the final output.  
- ✅ **Stylish Terminal Interface:** Color-coded and easy-to-read output.  
- ✅ **Result Export:** Clean results saved in `domain.name_live_subs.txt`.  

---

## 🛠️ **Dependencies**  

Dependencies are automatically managed by the `main_install.sh` script using ****Go****. I found some issues with ***Subfinder*** installation using ***GO*** on Ubuntu and Linux Mint. To fix this issue, I maid an alternative installation script namd  `alternative_install.sh`. Run `alternative_install.sh` if you are using OS like ***Ubuntu*** and ***Linux Mint***.

### 🐧 **Manual Installation (if needed)**  

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

4. **🎯 Results File:**  
   - All live subdomains are saved in `domain.name_subs.txt`.  

---

## 📂 **Output Files**  

- `domain.name_live_subs.txt`: Clean and unique live subdomains.  

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
