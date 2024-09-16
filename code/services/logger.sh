#!/bin/sh

logger() {
    enable_logs="$1"
    command="$2"

    if [ "${ENABLE_ALL_LOGS:=false}" = "true" ]; then
        enable_logs="true"
        echo "ENABLE_ALL_LOGS is set to true, enabling logs for all commands..."
    fi

    if [ "$enable_logs" = "true" ]; then
        $command
    else
        $command > /dev/null 2>&1
    fi
}
