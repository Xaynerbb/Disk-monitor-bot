#!/bin/bash
#Write a Bash script that checks how full a disk partition is. 
#It should print the percentage used, and warn the user if it's above 80%.

#echo "Listing all available disk partitons on my system"h
#fdisk -l

#echo ""
#echo "Display disk partition in a disk format"
#lsblk 

#logfile="$HOME/logs/disk.log"
logfile="$HOME/Desktop/disk-monitor-bot/disk.log"
mkdir -p "$(dirname "$logfile")"

trap "echo '[$(date)] ERROR: script failed' | tee -a $logfile" ERR

partition="${1:-/dev/sda2}"

disk_size=$(df -h "$partition" | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$disk_size" -gt 80 ]; then
    echo "[$(date)] $partition - ${disk_size}% used - WARNING" | tee -a "$logfile"
else
    echo "[$(date)] $partition - ${disk_size}% used - SAFE: Congratulations Xaynnn" | tee -a "$logfile"
fi