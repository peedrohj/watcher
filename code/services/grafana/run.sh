#!/bin/sh

. /app/services/logger.sh

enable_logs="${ENABLE_LOGS_GRAFANA:=false}"
command="./grafana server"

cd /app/grafana/bin
logger "$enable_logs" "$command"
