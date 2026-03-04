# qui

![Version: 1.2.3](https://img.shields.io/badge/Version-1.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.14.1](https://img.shields.io/badge/AppVersion-1.14.1-informational?style=flat-square)

A Helm chart for Qui

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumes | list | `[]` |  |
| affinity | object | `{}` |  |
| env.QUI__BASE_URL | string | `""` |  |
| env.QUI__LOG_LEVEL | string | `"info"` |  |
| env.TZ | string | `"America/New_York"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/autobrr/qui"` |  |
| image.tag | string | `"v1.14.1@sha256:10b7945d4f0978f56a7cb939a011e1aeef3b8d500e825f409599ae754f95601b"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| metrics.basicAuthUsers | string | `""` |  |
| metrics.enabled | bool | `false` |  |
| metrics.host | string | `"0.0.0.0"` |  |
| metrics.path | string | `"/metrics"` |  |
| metrics.port | int | `9074` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.size | string | `"2Gi"` |  |
| persistence.config.storageClass | string | `""` |  |
| persistence.config.volumeName | string | `""` |  |
| prometheus.scrapeAnnotations.enabled | bool | `false` |  |
| prometheus.scrapeAnnotations.path | string | `"/metrics"` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.initialDelaySeconds | int | `20` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `7476` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| strategy | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |

