# Automated RAM Monitoring and Daily Reporting Script

## Overview
This project is a **Bash automation script** that monitors system memory (RAM) usage on Linux servers. It logs RAM usage **every hour** into a specified file and automatically sends a **daily email report** at midnight. The log is then cleared to start fresh for the next day.  

This tool helps system administrators track memory usage trends, detect potential performance issues early, and reduce manual monitoring efforts.

---

## Features
- Hourly logging of RAM usage (used vs total memory in MB)
- Daily email report sent automatically at midnight
- Automatic log reset for each new day
- Error handling using `set -e` for reliable execution
- Can be scheduled using `cron` for fully automated operation

---

## Prerequisites
- Linux server (Ubuntu/Debian or similar)
- Bash shell
- `mail` utility installed for sending emails
- Cron service for automated scheduling

### Install Mail Utility (Debian/Ubuntu)
```bash
sudo apt update
sudo apt install mailutils
```
### Configuration
1. Open the script (ram_monitor.sh) and configure the following variables:
```bash
LOGFILE="/home/username/ram_usage.log"   # Path to log file
EMAIL="your_email@example.com"           # Recipient email address
```
2. Make the script executable:
```bash
chmod +x ram_monitor.sh
```
### Usage
You can run the script manually:
```bash
./ram_monitor.sh
```
Or schedule it to run automatically every hour using cron:
1. Open your crontab:
```bash
crontab -e
```
2. Add the following line to execute the script at minute 0 of every hour:
```bash
0 * * * * /home/username/ram_monitor.sh
```
3. Save and exit. The script will now run automatically.

----
### How It Works
1. The script logs RAM usage every hour using the free -m command.
2. Each log entry includes a timestamp and the used/total memory in MB.
3. At midnight (HOUR == 00), the script:
  - Sends the log file content via email to the configured recipient.
  - Clears the log file for the next day.
4. Error handling ensures the script exits immediately if any command fails.

**Author:** Agbabiaka Owolabi
**Email:** Agbabiakahammed003@gmail.com
