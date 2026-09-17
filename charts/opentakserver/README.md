# opentakserver

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.7.13](https://img.shields.io/badge/AppVersion-1.7.13-informational?style=flat-square)

A Helm chart for deploying OpenTAKServer.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jankcloud |  | <https://github.com/jankcloud> |

## Source Code

* <https://github.com/jankcloud/charts/tree/main/charts/opentakserver>
* <https://github.com/brian7704/OpenTAKServer>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | rabbitmq | 16.0.14 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.repository | string | `"ghcr.io/brian7704/opentakserver"` | OpenTAKServer image repository |
| image.tag | string | `""` | Image tag; defaults to chart appVersion |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| service.ui.enabled | bool | `true` | Enable dedicated UI service |
| service.api.enabled | bool | `true` | Enable dedicated API service |
| service.cots.enabled | bool | `true` | Enable dedicated CoT service |
| persistence.enabled | bool | `false` | Create a PVC for OTS data |
| database.uri | string | `""` | Full SQLAlchemy URI |
| database.existingSecret.name | string | `""` | Existing DB secret name |
| rabbitmq.enabled | bool | `true` | Deploy Bitnami RabbitMQ subchart |
| rabbitmq.external.host | string | `""` | External RabbitMQ host when disabled |
| resources.requests.cpu | string | `"100m"` | CPU request |
| resources.requests.memory | string | `"256Mi"` | Memory request |
| resources.limits.cpu | string | `"1"` | CPU limit |
| resources.limits.memory | string | `"1Gi"` | Memory limit |
