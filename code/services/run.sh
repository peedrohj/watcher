#!/bin/sh

sh /app/services/grafana/run.sh &
sh /app/services/otel/run.sh &

sleep infinity
