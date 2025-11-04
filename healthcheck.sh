#!/bin/bash
# ----------------------------------------
# System Health Check Script
# Description: Collects and logs system health details
# ----------------------------------------

# 1️. Define log file with timestamp
LOG_FILE="healthlog.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "----------------------------------------" >> "$LOG_FILE"
echo "System Health Check - $TIMESTAMP" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 2️. System Date and Time
echo "Date & Time:" >> "$LOG_FILE"
   date >> "$LOG_FILE"  
echo "" >> "$LOG_FILE"

# 3️. System Uptime
echo "Uptime:" >> "$LOG_FILE"
   systeminfo | grep "System Up Time" >> "$LOG_FILE" 2>/dev/null
echo "" >> "$LOG_FILE"

# 4️. CPU Load
echo "CPU Load from uptime:" >> "$LOG_FILE"
   powershell -Command "Get-Counter '\Processor(_Total)\% Processor Time' | Select -ExpandProperty CounterSamples | Select -ExpandProperty CookedValue" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 5️. Memory Usage
echo "Memory Usage free -m:" >> "$LOG_FILE"
   powershell -Command "Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize,FreePhysicalMemory | Format-List" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 6️. Disk Usage
echo "Disk Usage df -h:" >> "$LOG_FILE"
   df -h >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 7️. Top 5 Memory-Consuming Processes
echo "Top 5 Memory-Consuming Processes:" >> "$LOG_FILE"
   powershell -Command "Get-Process | Sort-Object WS -Descending | Select-Object -First 5 | Format-Table Name,Id,WS -AutoSize" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 8️. Service Status Check (nginx, ssh)
echo "Checking Services nginx, ssh:" >> "$LOG_FILE"
for service in nginx ssh; do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
        echo "$service is running" >> "$LOG_FILE"
    else
        echo "$service is NOT running" >> "$LOG_FILE"
    fi
done
echo "" >> "$LOG_FILE"

echo "Health check completed successfully at $TIMESTAMP" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"