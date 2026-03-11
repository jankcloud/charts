# prowlarr

![Version: 1.3.0](https://img.shields.io/badge/Version-1.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.3.0](https://img.shields.io/badge/AppVersion-2.3.0-informational?style=flat-square)

A Helm chart for deploying Prowlarr

**Homepage:** <https://prowlarr.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jankcloud |  | <https://github.com/jankcloud> |

## Source Code

* <https://github.com/jankcloud/charts/tree/main/charts/prowlarr>
* <https://github.com/Prowlarr/Prowlarr>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://jankcloud.github.io/charts | arr-common | 0.1.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumes | list | `[]` |  |
| affinity | object | `{}` |  |
| env.PGID | string | `"1000"` |  |
| env.PUID | string | `"1000"` |  |
| env.TZ | string | `"America/New_York"` |  |
| exportarr.enabled | bool | `false` |  |
| exportarr.env.APIKEY | string | `""` |  |
| exportarr.env.APP | string | `"prowlarr"` |  |
| exportarr.env.URL | string | `"http://localhost:9696"` |  |
| exportarr.image.pullPolicy | string | `"IfNotPresent"` |  |
| exportarr.image.repository | string | `"ghcr.io/onedr0p/exportarr"` |  |
| exportarr.image.tag | string | `"v2.3.0@sha256:af535d94061cf97a52e1661945ffba78c03f9443eae7c0da1a80a5a4be56b520"` |  |
| exportarr.port | int | `9707` |  |
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
| image.repository | string | `"ghcr.io/linuxserver/prowlarr"` |  |
| image.tag | string | `"2.3.0@sha256:9ef5d8bf832edcacb6082f9262cb36087854e78eb7b1c3e1d4375056055b2d82"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| initContainers | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.size | string | `"2Gi"` |  |
| persistence.config.storageClass | string | `""` |  |
| persistence.config.volumeName | string | `""` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.httpGet.path | string | `"/ping"` |  |
| probes.liveness.httpGet.port | string | `"http"` |  |
| probes.liveness.initialDelaySeconds | int | `30` |  |
| probes.liveness.periodSeconds | int | `30` |  |
| probes.liveness.timeoutSeconds | int | `5` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.httpGet.path | string | `"/ping"` |  |
| probes.readiness.httpGet.port | string | `"http"` |  |
| probes.readiness.initialDelaySeconds | int | `20` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.readiness.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `9696` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| sidecars | list | `[]` |  |
| strategy.type | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |

