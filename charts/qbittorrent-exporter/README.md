# qbittorrent-exporter

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.13.3](https://img.shields.io/badge/AppVersion-1.13.3-informational?style=flat-square)

A Helm chart for qBittorrent Prometheus Exporter - exports metrics from qBittorrent to Prometheus

**Homepage:** <https://github.com/jankcloud/charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jankcloud |  | <https://github.com/jankcloud> |

## Source Code

* <https://github.com/jankcloud/charts/tree/main/charts/qbittorrent-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.ENABLE_HIGH_CARDINALITY | string | `"false"` |  |
| env.ENABLE_TRACKER | string | `"true"` |  |
| env.EXPORTER_PORT | string | `"8090"` |  |
| env.LOG_LEVEL | string | `"INFO"` |  |
| env.QBITTORRENT_BASE_URL | string | `"http://qbittorrent:8080"` |  |
| env.QBITTORRENT_PASSWORD | string | `"adminadmin"` |  |
| env.QBITTORRENT_USERNAME | string | `"admin"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/martabal/qbittorrent-exporter"` |  |
| image.tag | string | `"v1.13.3@sha256:cbb96f078ef255bc735a4a828f21af99b21d393d3685ee398b1ea0d0c55d3f9e"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.initialDelaySeconds | int | `15` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.tcpSocket.port | string | `"http"` |  |
| metrics.path | string | `"/metrics"` |  |
| prometheus.annotations."prometheus.io/path" | string | `"/metrics"` |  |
| prometheus.annotations."prometheus.io/port" | string | `"8090"` |  |
| prometheus.annotations."prometheus.io/scrape" | string | `"true"` |  |
| readinessProbe.initialDelaySeconds | int | `15` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.tcpSocket.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1000Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"250Mi"` |  |
| service.port | int | `8090` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `true` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |

