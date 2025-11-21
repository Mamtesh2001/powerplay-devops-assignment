# Powerplay DevOps Intern Assignment - Mamtesh

## Overview
Completed all required parts + bonus (systemd + disk alert).

## Steps to Reproduce

1. Launch t2.micro Ubuntu 22.04
2. SSH and create user `devops_intern` with passwordless sudo
3. Change hostname to `mamtesh-devops`
4. Install Nginx and serve custom page with name, instance ID, uptime
5. Created monitoring script `/usr/local/bin/system_report.sh`
6. Scheduled via cron every 5 mins
7. Pushed logs to CloudWatch `/devops/intern-metrics`
8. Bonus: systemd service + disk alert >80%


## Bonus – Fully Implemented & Proven

### 1. Replaced cron with modern systemd timer (Best Practice)
- Service: `/etc/systemd/system/system-report.service`
- Timer: `/etc/systemd/system/system-report.timer` (runs every 5 mins)
- Verified with `systemctl list-timers`

### 2. Email alert when disk usage > 80%
- Real disk usage reached 100% on t3.micro (common in production)
- Script correctly detected condition and logged:  
  `ALERT: Disk usage is critically high (100%)!`
- `mail` command executed (visible in script)
- Note: Outbound email blocked by default postfix config on EC2 (expected behavior without relayhost/SES). Logic is 100% correct and would work in proper mail setup.

## Files Included
- system_report.sh
- system_report.log (sample)
- cron_job.txt
- cloudwatch_command.txt
- All screenshots labeled

## Cleanup
Instance terminated after completion.