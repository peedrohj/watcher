#!/bin/sh
. /app/services/logger.sh

enable_logs="${ENABLE_LOGS_OTEL:=false}"
config_file="/app/services/otel/config.yaml"
command="./otelcol-contrib --config=file:${config_file}"

cd /app/otelcol-contrib
logger "$enable_logs" "$command" &

echo "otel collector is up:"
echo " - 4317 (OpenTelemetry GRPC endpoint)"
echo " - 4318 (OpenTelemetry HTTP endpoint)"
