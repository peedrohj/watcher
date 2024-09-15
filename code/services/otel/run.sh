#!/bin/sh

enable_logs="${ENABLE_LOGS_OTEL:=false}"

config_file="/app/services/otel/config.yaml"
command="./otelcol-contrib --config=file:${config_file}"

cd /app/otelcol-contrib

if [ "$enable_logs" = "true" ]; then
    echo "Starting otel collector with logs enabled..."
    $command
else
    $command > /dev/null 2>&1 &
fi

echo "otel collector is up:"
echo " - 4317 (OpenTelemetry GRPC endpoint)"
echo " - 4318 (OpenTelemetry HTTP endpoint)"
