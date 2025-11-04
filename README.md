# system-health-check

## Overview  
The **System Health Check Script** collects and logs key system performance metrics such as date/time, CPU usage, memory, and disk usage and active services — all logged into a timestamped file (healthlog.txt) for easy tracking and debugging.

This project demonstrates automation, shell scripting, and system administration skills — useful for DevOps, system monitoring, and infrastructure management.

## Features  
1. Displays current **system date and time**  
2. Shows **CPU load** and **uptime**  
3. Reports **memory and disk usage**  
4. Lists **top 5 memory-consuming processes**  
5. Checks the **status of key services** (e.g., `nginx`, `ssh`)  
6. Logs all details to a file named `healthlog.txt` with a timestamp

### Commands Used in the Script

The `healthcheck.sh` script uses the following commands:

- `date` – Display system date and time  
- `systeminfo` – Get system uptime (Windows)  
- `powershell Get-Counter` – Fetch CPU load percentage  
- `powershell Get-CimInstance` – Show memory usage details  
- `df -h` – Display disk usage  
- `powershell Get-Process` – List top memory-consuming processes  
- `systemctl is-active` – Check service status (nginx, ssh)  
- Redirection operators (`>>`, `2>/dev/null`) – Log and suppress errors
