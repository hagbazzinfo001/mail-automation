#!/usr/bin/bash


#DATE=`date`
#date2=$(date) #---this also is another way
# Automated Website Deployment on AWS EC2
##Author: Agbabiaka Owolabi  
##Role: Cloud & DevOps Engineer | Frontend Developer  
##Date:August 2025
set -e #EXIT IMMEDIATELY IF THERE'S ANY ERROR OF ANY LINES


# Configurable variables
LOGFILE="/home/vagrant/ram_usage.log"
EMAIL="Agbabiakahammed003@gmail.com"

# Get current time
HOUR=$(date +%H)
DATE=$(date +%Y-%m-%d)

# Log RAM usage (free -m gives memory in MB, grep filters, awk extracts)
echo "[$(date '+%Y-%m-%d %H:%M:%S')] RAM Usage: $(free -m | awk '/Mem:/ {print $3 "MB used / " $2 "MB total"}')" >> $LOGFILE

# If it's midnight (hour == 00)
if [ "$HOUR" -eq "00" ]; then
	    # Send log file to email
	        mail -s "Daily RAM Usage Report ($DATE)" "$EMAIL" < $LOGFILE

		    # Clear log file for new day
		        > $LOGFILE
fi
