# CVE_Analyze_Tools
## Assuming
These scripts are assuming to treat data which download from [Here(CVE Change Logs).](https://cve.mitre.org/cve/data_updates.html)

## Usage
1. Run "Monthly_wget.sh" to download Monthly CVEs lists under Monthly_CVEs. For internal use, this script is downloading 2015/01 - 2019/12.
2. Run "Create_CVEs_list.sh" to create CVEs_list under WORK_CVEs which Published from 2015/01-2019/12.
3. Run "Download_from_mitre.sh" to download each CVEs details from MITRE under CVEs_MITRE. 
