#!/bin/sh

enable_logs="${ENABLE_LOGS_GRAFANA:=false}"
command="./grafana server"

cd /app/grafana/bin

if [ "$enable_logs" = "true" ]; then
    echo "Starting Grafana with logs enabled..."
    $command
else
    $command > /dev/null 2>&1 &
fi

echo "Grafana is up on port: 3000"
