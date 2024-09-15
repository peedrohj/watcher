#!/bin/sh

enable_logs="${ENABLE_LOGS_GRAFANA:=false}"
cd /app/grafana/bin

if [ "$enable_logs" = "true" ]; then
    echo "Starting Grafana with logs enabled..."
    ./grafana server
else
    ./grafana server > /dev/null 2>&1 &
fi

echo "Grafana is up on port: 3000"
