# Disk Monitor Bot 🖥️📡

An automated disk monitoring system that checks partition usage, logs results with timestamps, and sends real-time Telegram alerts — built with Bash, cron, and the Telegram Bot API.

## Features
- ✅ Monitors any disk partition
- ✅ Logs every check with a timestamp
- ✅ Sends Telegram alerts when disk is above 80%
- ✅ Runs automatically via cron
- ✅ Secrets managed via `.env` file

## Setup

**1. Clone the repo:**
```bash
git clone git@github.com:Xaynerbb/Disk-monitor-bot.git
cd Disk-monitor-bot
chmod +x *.sh
```

**2. Create your `.env` file:**
```bash
cp .env.example .env
```
Then fill in your real values inside `.env`.

**3. Schedule with cron:**
```bash
crontab -e
```
Add this line to run every day at 8am:
```
0 8 * * * /home/xaynn/Desktop/disk-monitor-bot/alert.sh >> /home/xaynn/Desktop/disk-monitor-bot/disk.log 2>&1
```
## Usage
Run manually:
```bash
bash alert.sh
```

## Author
**Zainab (Xaynnn)** — DevOps Engineer in Training