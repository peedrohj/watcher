# Watcher

Watcher is a lightweight monitoring solution designed to integrate with the **LGTM** stack (Loki, Grafana, Tempo, and Prometheus). This project creates a Docker image that simplifies logging, tracing, and observability for applications, making it easy to monitor systems and applications with customizable metrics.

## Features
- **LGTM Integration**: Seamless integration with Loki (logging), Grafana (visualization), Tempo (tracing), and Prometheus (metrics).
- **Dockerized**: Deploy Watcher easily using Docker.
- **Log and Trace Management**: Manage logs and traces using environment variables.
- **Custom Metrics**: Leverage Prometheus for real-time monitoring of application metrics.

## Stack Overview
The **LGTM** stack includes:
- **Loki**: Centralized log aggregation.
- **Grafana**: Dashboards and visualizations.
- **Tempo**: Distributed tracing for request tracking.
- **Prometheus**: Metric collection and alerting.

Watcher acts as a part of this stack, providing an efficient way to track logs, traces, and metrics for your services.

## Prerequisites
- **Docker**: Make sure Docker is installed. [Download Docker](https://www.docker.com/get-started).
- **Docker Compose**: Optional, but useful for managing multi-container environments.

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/peedrohj/watcher.git
cd watcher
```

### Build the Docker Image
To build the Watcher Docker image, run the following command:

```bash
docker build -t watcher:latest .
```

### Running the Container
You can run the Watcher container by specifying the `ENABLE_LOGS_GRAFANA` environment variable to control logging:

```bash
docker run -e ENABLE_LOGS_GRAFANA=true watcher:latest
```

### Using Docker Compose
If deploying with the full LGTM stack, use `docker-compose.yml` to simplify the setup:

```bash
docker-compose up
```

This will bring up Watcher along with Loki, Grafana, Tempo, and Prometheus.

## Configuration

### Environment Variables
- **ENABLE_LOGS_GRAFANA**: Set this variable to `true` to enable logging and tracing, or to `false` to disable them.
  ```bash
  export ENABLE_LOGS_GRAFANA=true
  ```

### Docker Compose Configuration
The `docker-compose.yml` file contains configurations for integrating Watcher into the full LGTM stack. Modify it as needed to customize the connections between Loki, Grafana, Tempo, and Prometheus.

## Observability Stack (LGTM)
- **Loki**: Collects logs from Watcher and aggregates them for viewing in Grafana.
- **Grafana**: Displays metrics, logs, and traces on customizable dashboards.
- **Tempo**: Provides distributed tracing, which tracks requests across microservices.
- **Prometheus**: Monitors metrics from Watcher and sets up alerting based on thresholds.

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new feature branch: `git checkout -b feature-branch`.
3. Make your changes and commit: `git commit -m 'Add feature'`.
4. Push to the branch: `git push origin feature-branch`.
5. Open a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

This README now correctly reflects the LGTM stack (Loki, Grafana, Tempo, and Prometheus). Let me know if you need any further adjustments!
