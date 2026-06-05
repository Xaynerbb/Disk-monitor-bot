#!/bin/bash

# ── Config ────────────────────────────────────────────
source "$HOME/Desktop/disk-monitor-bot/.env"
logfile="$HOME/Desktop/disk-monitor-bot/disk.log"
partition="${1:-/dev/sda2}"

# ── Get disk usage ─────────────────────────────────────
disk_size=$(df -h "$partition" | awk 'NR==2 {print $5}' | tr -d '%')

# ── Log it ─────────────────────────────────────────────
echo "[$(date)] $partition - ${disk_size}% used" | tee -a "$logfile"

# ── Send Telegram alert if above 80% ──────────────────
if [ "$disk_size" -gt 80 ]; then
    MESSAGE="🚨 DISK ALERT: $partition is at ${disk_size}% on $(hostname) — clean up now!"
else
    MESSAGE="✅ Disk OK: $partition is at ${disk_size}% on $(hostname)"
fi

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="$CHAT_ID" \
    -d text="$MESSAGE"