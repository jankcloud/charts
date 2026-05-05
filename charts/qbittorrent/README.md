# qbittorrent

![Version: 1.4.0](https://img.shields.io/badge/Version-1.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.1.4](https://img.shields.io/badge/AppVersion-5.1.4-informational?style=flat-square)

A Helm chart for deploying qBittorrent

**Homepage:** <https://www.qbittorrent.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jankcloud |  | <https://github.com/jankcloud> |

## Source Code

* <https://github.com/jankcloud/charts/tree/main/charts/qbittorrent>
* <https://github.com/qbittorrent/qBittorrent>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://jankcloud.github.io/charts | arr-common | 0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumes | list | `[]` |  |
| affinity | object | `{}` |  |
| env.PGID | string | `"1000"` |  |
| env.PUID | string | `"1000"` |  |
| env.TZ | string | `"America/New_York"` |  |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| gluetun.enabled | bool | `false` |  |
| gluetun.env | object | `{}` |  |
| gluetun.existingSecret | string | `""` |  |
| gluetun.image.pullPolicy | string | `"IfNotPresent"` |  |
| gluetun.image.repository | string | `"ghcr.io/qdm12/gluetun"` |  |
| gluetun.image.tag | string | `"latest"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/linuxserver/qbittorrent"` |  |
| image.tag | string | `"5.1.4@sha256:474ef1f1c63fc060236e85cd6ec4a3232aea5a0d7a033c6bab9911039933f147"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| metrics.enabled | bool | `false` |  |
| metrics.env.EXPORTER_PORT | string | `"8090"` |  |
| metrics.env.QBITTORRENT_BASE_URL | string | `"http://localhost:8080"` |  |
| metrics.env.QBITTORRENT_PASSWORD | string | `""` |  |
| metrics.env.QBITTORRENT_USERNAME | string | `""` |  |
| metrics.image.pullPolicy | string | `"IfNotPresent"` |  |
| metrics.image.repository | string | `"ghcr.io/martabal/qbittorrent-exporter"` |  |
| metrics.image.tag | string | `"v1.13.4@sha256:b7360b87bcbe0982e1784a6e341d9cf00137795803eac4fe9f8dd9f813d72fb6"` |  |
| metrics.port | int | `8090` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.size | string | `"2Gi"` |  |
| persistence.config.storageClass | string | `""` |  |
| persistence.config.volumeName | string | `""` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.httpGet.path | string | `"/"` |  |
| probes.liveness.httpGet.port | string | `"http"` |  |
| probes.liveness.initialDelaySeconds | int | `30` |  |
| probes.liveness.periodSeconds | int | `30` |  |
| probes.liveness.timeoutSeconds | int | `5` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.httpGet.path | string | `"/"` |  |
| probes.readiness.httpGet.port | string | `"http"` |  |
| probes.readiness.initialDelaySeconds | int | `20` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.readiness.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| sidecars | list | `[]` |  |
| strategy.type | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |

