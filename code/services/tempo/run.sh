#!/bin/sh

. /app/services/logger.sh

enable_logs="${ENABLE_LOGS_TEMPO:=false}"
config_file="/app/services/tempo/config.yaml"
command="./tempo --config.file=${config_file}"

cd /app/tempo
logger "$enable_logs" "$command"
