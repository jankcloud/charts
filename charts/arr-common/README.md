# arr-common

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

A Helm library chart for arr-stack applications

**Homepage:** <https://github.com/jankcloud/charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jankcloud |  | <https://github.com/jankcloud> |

## Source Code

* <https://github.com/jankcloud/charts/tree/main/charts/arr-common>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| exports.defaults.additionalVolumes | list | `[]` |  |
| exports.defaults.affinity | object | `{}` |  |
| exports.defaults.env | object | `{}` |  |
| exports.defaults.extraVolumeMounts | list | `[]` |  |
| exports.defaults.extraVolumes | list | `[]` |  |
| exports.defaults.fullnameOverride | string | `""` |  |
| exports.defaults.gluetun.enabled | bool | `false` |  |
| exports.defaults.gluetun.env | object | `{}` |  |
| exports.defaults.gluetun.existingSecret | string | `""` |  |
| exports.defaults.gluetun.image.pullPolicy | string | `"IfNotPresent"` |  |
| exports.defaults.gluetun.image.repository | string | `"ghcr.io/qdm12/gluetun"` |  |
| exports.defaults.gluetun.image.tag | string | `"latest"` |  |
| exports.defaults.image.pullPolicy | string | `"IfNotPresent"` |  |
| exports.defaults.image.repository | string | `""` |  |
| exports.defaults.image.tag | string | `""` |  |
| exports.defaults.ingress.annotations | object | `{}` |  |
| exports.defaults.ingress.className | string | `""` |  |
| exports.defaults.ingress.enabled | bool | `false` |  |
| exports.defaults.ingress.hosts | list | `[]` |  |
| exports.defaults.ingress.tls | list | `[]` |  |
| exports.defaults.initContainers | list | `[]` |  |
| exports.defaults.metricsExporter.args | list | `[]` |  |
| exports.defaults.metricsExporter.command | list | `[]` |  |
| exports.defaults.metricsExporter.enabled | bool | `false` |  |
| exports.defaults.metricsExporter.env.APIKEY | string | `""` |  |
| exports.defaults.metricsExporter.env.URL | string | `"http://localhost"` |  |
| exports.defaults.metricsExporter.envFrom | list | `[]` |  |
| exports.defaults.metricsExporter.image.pullPolicy | string | `"IfNotPresent"` |  |
| exports.defaults.metricsExporter.image.repository | string | `"ghcr.io/onedr0p/exportarr"` |  |
| exports.defaults.metricsExporter.image.tag | string | `"latest"` |  |
| exports.defaults.metricsExporter.name | string | `"metrics-exporter"` |  |
| exports.defaults.metricsExporter.path | string | `"/metrics"` |  |
| exports.defaults.metricsExporter.port | int | `9707` |  |
| exports.defaults.metricsExporter.portName | string | `"metrics-exporter"` |  |
| exports.defaults.metricsExporter.resources | object | `{}` |  |
| exports.defaults.metricsExporter.securityContext | object | `{}` |  |
| exports.defaults.metricsExporter.volumeMounts | list | `[]` |  |
| exports.defaults.nameOverride | string | `""` |  |
| exports.defaults.nodeSelector | object | `{}` |  |
| exports.defaults.persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| exports.defaults.persistence.config.enabled | bool | `false` |  |
| exports.defaults.persistence.config.size | string | `"2Gi"` |  |
| exports.defaults.persistence.config.storageClass | string | `""` |  |
| exports.defaults.persistence.config.volumeName | string | `""` |  |
| exports.defaults.probes.liveness.failureThreshold | int | `5` |  |
| exports.defaults.probes.liveness.httpGet.path | string | `"/"` |  |
| exports.defaults.probes.liveness.httpGet.port | string | `"http"` |  |
| exports.defaults.probes.liveness.initialDelaySeconds | int | `30` |  |
| exports.defaults.probes.liveness.periodSeconds | int | `30` |  |
| exports.defaults.probes.liveness.timeoutSeconds | int | `5` |  |
| exports.defaults.probes.readiness.failureThreshold | int | `5` |  |
| exports.defaults.probes.readiness.httpGet.path | string | `"/"` |  |
| exports.defaults.probes.readiness.httpGet.port | string | `"http"` |  |
| exports.defaults.probes.readiness.initialDelaySeconds | int | `20` |  |
| exports.defaults.probes.readiness.periodSeconds | int | `10` |  |
| exports.defaults.probes.readiness.timeoutSeconds | int | `5` |  |
| exports.defaults.replicaCount | int | `1` |  |
| exports.defaults.resources.limits.memory | string | `"1Gi"` |  |
| exports.defaults.resources.requests.cpu | string | `"100m"` |  |
| exports.defaults.resources.requests.memory | string | `"256Mi"` |  |
| exports.defaults.service.annotations | object | `{}` |  |
| exports.defaults.service.port | int | `80` |  |
| exports.defaults.service.type | string | `"ClusterIP"` |  |
| exports.defaults.serviceMonitor.annotations | object | `{}` |  |
| exports.defaults.serviceMonitor.enabled | bool | `false` |  |
| exports.defaults.serviceMonitor.interval | string | `"30s"` |  |
| exports.defaults.serviceMonitor.labels | object | `{}` |  |
| exports.defaults.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| exports.defaults.sidecars | list | `[]` |  |
| exports.defaults.strategy.type | string | `"Recreate"` |  |
| exports.defaults.tolerations | list | `[]` |  |

