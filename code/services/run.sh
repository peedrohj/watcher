#!/bin/sh

sh /app/services/grafana/run.sh &
sh /app/services/otel/run.sh &
sh /app/services/prometheus/run.sh &

sleep infinity
