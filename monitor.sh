#!/bin/bash
URL="https://google.com"
LOG_FILE="service_health.log"

echo "--- Check Started: $(date) ---" >> $LOG_FILE
STATUS=$(curl -L -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
    echo "SUCCESS: $URL is UP" | tee -a $LOG_FILE
else
    echo "ALERT: $URL returned $STATUS" | tee -a $LOG_FILE
fi
