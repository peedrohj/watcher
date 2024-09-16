# Watcher: Observability Stack (Loki, Grafana, Tempo, Prometheus, OTLP)

**Watcher** is an observability service that integrates multiple open-source tools into a customizable Docker image, offering monitoring, logging, and tracing capabilities out of the box. This stack includes **Loki**, **Grafana**, **Tempo**, **Prometheus**, and **OTLP**, with flexibility to add custom dashboards and datasources.

## Table of Contents

- [Watcher: Observability Stack (Loki, Grafana, Tempo, Prometheus, OTLP)](#watcher-observability-stack-loki-grafana-tempo-prometheus-otlp)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Configuration](#configuration)
    - [Custom Logging Control](#custom-logging-control)
    - [Dashboards and Datasources](#dashboards-and-datasources)
      - [Adding Custom Dashboards](#adding-custom-dashboards)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Features

- Pre-configured **Loki** for log aggregation.
- **Grafana** dashboards with customizable data sources.
- Distributed tracing with **Tempo**.
- Monitoring and alerting with **Prometheus**.
- OTLP (OpenTelemetry Protocol) support for seamless telemetry collection.
- Service-specific logging control with environment variables.
- Custom dashboards and datasources can be easily added.

## Getting Started

### Prerequisites

- Docker installed on your machine.
- Basic knowledge of Docker and observability tools like Grafana, Prometheus, etc.

### Installation

Clone the repository:

```bash
git clone https://github.com/peedrohj/watcher.git
cd watcher
```

Build the Docker image:

```bash
docker build -t watcher-observability .
```

Run the container:

```bash
docker run -d -p 3000:3000 watcher-observability
```

Grafana will be accessible at `http://localhost:3000`.

## Configuration

### Custom Logging Control

Watcher allows you to enable or disable logs for each service using environment variables:

- To enable logging for Grafana, set the environment variable `ENABLE_LOGS_GRAFANA=true`.
- To enable logs for all services at once, use `ENABLE_LOGS_ALL=true`.

Supported services:
- `ENABLE_LOGS_GRAFANA`
- `ENABLE_LOGS_LOKI`
- `ENABLE_LOGS_TEMPO`
- `ENABLE_LOGS_PROMETHEUS`

Add these options to your Docker command:

```bash
docker run -d -p 3000:3000 \
  -e ENABLE_LOGS_GRAFANA=true \
  -e ENABLE_LOGS_TEMPO=true \
  watcher-observability
```

### Dashboards and Datasources

You can customize your Grafana dashboards and datasources by adding JSON files and updating the configuration.

#### Adding Custom Dashboards

1. Add your custom dashboard JSON file to the `services/grafana/dashboards` directory.
2. Update the `dashboards.yaml` file in the same directory to include your new dashboard. Example entry in `dashboards.yaml`:

```yaml
apiVersion: 1

providers:
  - name: 'Custom Dashboards'
    folder: ''
    type: file
    options:
      path: /app/services/grafana/dashboards/<your_file>.json
```

Once you've added the dashboard JSON and updated the YAML file, restart the container to apply the changes:

```bash
docker restart <container-id>
```

This will load your custom dashboards into Grafana automatically.

## Usage

- **Grafana** is the main interface for accessing the observability stack.
- **Prometheus** collects metrics, **Loki** aggregates logs, and **Tempo** provides distributed tracing.
- Custom logging and data visualization can be configured by editing the environment variables and mounting custom dashboard files.

## Contributing

Contributions are welcome! Please create a pull request or open an issue on the [GitHub repository](https://github.com/peedrohj/watcher).

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
