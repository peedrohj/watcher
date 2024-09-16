#!/bin/sh

. /app/services/logger.sh

enable_logs="${ENABLE_LOGS_PROMETHEUS:=false}"
config_file="/app/services/prometheus/config.yaml"
command="./prometheus \
      --web.enable-remote-write-receiver \
      --enable-feature=otlp-write-receiver \
      --enable-feature=exemplar-storage \
      --enable-feature=native-histograms \
      --storage.tsdb.path=/data/prometheus \
      --config.file=${config_file}
"

cd /app/prometheus
logger "$enable_logs" "$command"

