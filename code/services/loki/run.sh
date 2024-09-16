#!/bin/sh

. /app/services/logger.sh

enable_logs="${ENABLE_LOGS_LOKI:=false}"
config_file="/app/services/loki/config.yaml"
command="./loki-linux --config.file=${config_file}"

cd /app/loki
logger "$enable_logs" "$command"
