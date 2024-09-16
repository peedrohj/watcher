FROM ubuntu:latest as base

ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH}

ENV GRAFANA_VERSION=v11.2.0
ENV OPENTELEMETRY_VERSION=v0.109.0
ENV PROMETHEUS_VERSION=v2.54.1
ENV TEMPO_VERSION=v2.6.0
ENV LOKI_VERSION=v3.1.1

WORKDIR /app

RUN apt-get -y update && apt-get -y install curl \
    unzip

FROM base AS lgtm
RUN bash -c 'curl -sOL https://dl.grafana.com/oss/release/grafana-"${GRAFANA_VERSION:1}".linux-"${TARGETARCH}".tar.gz && \
    tar xfz grafana-"${GRAFANA_VERSION:1}".linux-"${TARGETARCH}".tar.gz && \
    rm grafana-"${GRAFANA_VERSION:1}".linux-"${TARGETARCH}".tar.gz && \
    mv grafana-v"${GRAFANA_VERSION:1}" grafana/'

RUN bash -c 'curl -sOL https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/"${OPENTELEMETRY_VERSION}"/otelcol-contrib_"${OPENTELEMETRY_VERSION:1}"_linux_"${TARGETARCH}".tar.gz && \
    mkdir otelcol-contrib && \
    tar xfz otelcol-contrib_"${OPENTELEMETRY_VERSION:1}"_linux_"${TARGETARCH}".tar.gz -C otelcol-contrib/ && \
    rm otelcol-contrib_"${OPENTELEMETRY_VERSION:1}"_linux_"${TARGETARCH}".tar.gz'

RUN bash -c 'curl -sOL https://github.com/prometheus/prometheus/releases/download/"${PROMETHEUS_VERSION}"/prometheus-"${PROMETHEUS_VERSION:1}".linux-"${TARGETARCH}".tar.gz && \
    tar xfz prometheus-"${PROMETHEUS_VERSION:1}".linux-"${TARGETARCH}".tar.gz && \
    mv prometheus-"${PROMETHEUS_VERSION:1}".linux-"${TARGETARCH}" prometheus && \
    rm prometheus-"${PROMETHEUS_VERSION:1}".linux-"${TARGETARCH}".tar.gz'

RUN bash -c 'curl -sOL https://github.com/grafana/tempo/releases/download/"${TEMPO_VERSION}"/tempo_"${TEMPO_VERSION:1}"_linux_"${TARGETARCH}".tar.gz && \
    mkdir tempo && \
    tar xfz tempo_"${TEMPO_VERSION:1}"_linux_"${TARGETARCH}".tar.gz -C tempo/ && \
    rm tempo_"${TEMPO_VERSION:1}"_linux_"${TARGETARCH}".tar.gz'

RUN bash -c 'curl -sOL https://github.com/grafana/loki/releases/download/"${LOKI_VERSION}"/loki-linux-"${TARGETARCH}".zip && \
    mkdir loki && \
    unzip loki-linux-"${TARGETARCH}" -d loki/ && \
    mv loki/loki-linux-"${TARGETARCH}" loki/loki-linux && \
    rm loki-linux-"${TARGETARCH}".zip'


FROM alpine:3.20
WORKDIR /app

COPY --from=lgtm /app /app
COPY --chmod=0755 services/run.sh services/run.sh
COPY --chown=root services services

RUN ["chmod", "+x", "/app/services/run.sh"]
RUN ["ln", "-s", "/app/services/grafana/datasources.yaml", "/app/grafana/conf/provisioning/datasources/"]
RUN ["ln", "-s", "/app/services/grafana/dashboards.yaml", "/app/grafana/conf/provisioning/dashboards/"]

ENTRYPOINT ["sh", "/app/services/run.sh"]
