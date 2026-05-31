#!/bin/bash
#Write a Bash script that checks how full a disk partition is. 
#It should print the percentage used, and warn the user if it's above 80%.

#echo "Listing all available disk partitons on my system"h
#fdisk -l

#echo ""
#echo "Display disk partition in a disk format"
#lsblk 

logfile="script.log"
echo "[$(date)] Script started" >> "$logfile"
echo ""
echo "Displaying disk usage in a human readable format"
df -h
echo ""
partition="${1:-/dev/sda2}"
if [ $(df -h "$partition"| awk 'NR==2 {print $5}' | tr -d '%') -gt 80 ]; then
    echo "Warning: Storage is greater than 80%" >> "$logfile"
else
    echo "The disk storage is less than 80%, Congratulations Zaynnnn" >> "$logfile"
fi


