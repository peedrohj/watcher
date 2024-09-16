#!/bin/sh

sh /app/services/grafana/run.sh &
sh /app/services/otel/run.sh &
sh /app/services/prometheus/run.sh &

grafana_url="http://localhost:3000"

is_grafana_running() {
    response=$(wget --spider --server-response "$grafana_url" 2>&1 | grep "HTTP/" | awk '{print $2}' | head -n 1)

    if [ -z "$response" ]; then
        return 0
    else
        return 1
    fi
}

while true; do
    if is_grafana_running; then
        break
    else
        echo "Waiting for Grafana to be up..."
        sleep 1
    fi
done

echo "✨ Watcher is up and running ✨

Grafana is running on port: 3000
Otel collector is running on:
 - 4317 (OpenTelemetry GRPC endpoint)
 - 4318 (OpenTelemetry HTTP endpoint)
"

sleep infinity
