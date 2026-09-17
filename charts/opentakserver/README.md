# opentakserver

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.7.13](https://img.shields.io/badge/AppVersion-1.7.13-informational?style=flat-square)

A Helm chart for deploying OpenTAKServer

**Homepage:** <https://opentakserver.io>

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
| https://repo.helmforge.dev | rabbitmq | 1.7.1 |
| oci://registry-1.docker.io/bitnamicharts | postgresql | 18.11.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cotParser.affinity | object | `{}` |  |
| cotParser.autoscaling.enabled | bool | `false` |  |
| cotParser.autoscaling.maxReplicas | int | `10` |  |
| cotParser.autoscaling.minReplicas | int | `1` |  |
| cotParser.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cotParser.autoscaling.targetMemoryUtilizationPercentage | string | `""` |  |
| cotParser.enabled | bool | `true` |  |
| cotParser.envFrom | list | `[]` |  |
| cotParser.extraEnv | list | `[]` |  |
| cotParser.imagePullSecrets | list | `[]` |  |
| cotParser.livenessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| cotParser.livenessProbe.exec.command[1] | string | `"-c"` |  |
| cotParser.livenessProbe.exec.command[2] | string | `"pgrep -f cot_parser >/dev/null"` |  |
| cotParser.livenessProbe.failureThreshold | int | `5` |  |
| cotParser.livenessProbe.initialDelaySeconds | int | `15` |  |
| cotParser.livenessProbe.periodSeconds | int | `30` |  |
| cotParser.livenessProbe.timeoutSeconds | int | `5` |  |
| cotParser.nodeSelector | object | `{}` |  |
| cotParser.podAnnotations | object | `{}` |  |
| cotParser.podLabels | object | `{}` |  |
| cotParser.podSecurityContext | object | `{}` |  |
| cotParser.prefetch | int | `1` |  |
| cotParser.processes | int | `1` |  |
| cotParser.readinessProbe.exec.command[0] | string | `"/bin/sh"` |  |
| cotParser.readinessProbe.exec.command[1] | string | `"-c"` |  |
| cotParser.readinessProbe.exec.command[2] | string | `"pgrep -f cot_parser >/dev/null"` |  |
| cotParser.readinessProbe.failureThreshold | int | `5` |  |
| cotParser.readinessProbe.initialDelaySeconds | int | `15` |  |
| cotParser.readinessProbe.periodSeconds | int | `30` |  |
| cotParser.readinessProbe.timeoutSeconds | int | `5` |  |
| cotParser.replicaCount | int | `1` |  |
| cotParser.resources.limits.cpu | string | `"1"` |  |
| cotParser.resources.limits.memory | string | `"1Gi"` |  |
| cotParser.resources.requests.cpu | string | `"100m"` |  |
| cotParser.resources.requests.memory | string | `"256Mi"` |  |
| cotParser.securityContext | object | `{}` |  |
| cotParser.serviceAccountName | string | `""` |  |
| cotParser.startupProbe.enabled | bool | `false` |  |
| cotParser.startupProbe.exec.command[0] | string | `"/bin/sh"` |  |
| cotParser.startupProbe.exec.command[1] | string | `"-c"` |  |
| cotParser.startupProbe.exec.command[2] | string | `"pgrep -f cot_parser >/dev/null"` |  |
| cotParser.startupProbe.failureThreshold | int | `30` |  |
| cotParser.startupProbe.initialDelaySeconds | int | `15` |  |
| cotParser.startupProbe.periodSeconds | int | `30` |  |
| cotParser.startupProbe.timeoutSeconds | int | `5` |  |
| cotParser.tolerations | list | `[]` |  |
| cotParser.volumeMounts | list | `[]` |  |
| cotParser.volumes | list | `[]` |  |
| database.database | string | `""` |  |
| database.existingSecret.keys.database | string | `"database"` |  |
| database.existingSecret.keys.host | string | `"host"` |  |
| database.existingSecret.keys.password | string | `"password"` |  |
| database.existingSecret.keys.port | string | `"port"` |  |
| database.existingSecret.keys.uri | string | `"uri"` |  |
| database.existingSecret.keys.username | string | `"username"` |  |
| database.existingSecret.name | string | `""` |  |
| database.host | string | `""` |  |
| database.password | string | `""` |  |
| database.port | string | `""` |  |
| database.uri | string | `""` |  |
| database.username | string | `""` |  |
| env.OTS_DATA_FOLDER | string | `"/app/ots"` |  |
| env.OTS_LISTENER_ADDRESS | string | `"0.0.0.0"` |  |
| env.OTS_LISTENER_PORT | string | `"8081"` |  |
| env.OTS_SSL_STREAMING_PORT | string | `"8089"` |  |
| env.OTS_STREAMING_INTERFACE | string | `"0.0.0.0"` |  |
| env.OTS_TCP_STREAMING_PORT | string | `"8088"` |  |
| env.OTS_UDP_PORT | string | `"8087"` |  |
| eudHandler.affinity | object | `{}` |  |
| eudHandler.autoscaling.enabled | bool | `false` |  |
| eudHandler.autoscaling.maxReplicas | int | `10` |  |
| eudHandler.autoscaling.minReplicas | int | `1` |  |
| eudHandler.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| eudHandler.autoscaling.targetMemoryUtilizationPercentage | string | `""` |  |
| eudHandler.enabled | bool | `true` |  |
| eudHandler.envFrom | list | `[]` |  |
| eudHandler.extraEnv | list | `[]` |  |
| eudHandler.imagePullSecrets | list | `[]` |  |
| eudHandler.livenessProbe.failureThreshold | int | `5` |  |
| eudHandler.livenessProbe.initialDelaySeconds | int | `10` |  |
| eudHandler.livenessProbe.periodSeconds | int | `15` |  |
| eudHandler.livenessProbe.tcpSocket.port | string | `"tcp"` |  |
| eudHandler.livenessProbe.timeoutSeconds | int | `5` |  |
| eudHandler.mode | string | `"tcp"` |  |
| eudHandler.nodeSelector | object | `{}` |  |
| eudHandler.podAnnotations | object | `{}` |  |
| eudHandler.podLabels | object | `{}` |  |
| eudHandler.podSecurityContext | object | `{}` |  |
| eudHandler.readinessProbe.failureThreshold | int | `5` |  |
| eudHandler.readinessProbe.initialDelaySeconds | int | `10` |  |
| eudHandler.readinessProbe.periodSeconds | int | `15` |  |
| eudHandler.readinessProbe.tcpSocket.port | string | `"tcp"` |  |
| eudHandler.readinessProbe.timeoutSeconds | int | `5` |  |
| eudHandler.replicaCount | int | `1` |  |
| eudHandler.resources.limits.cpu | string | `"1"` |  |
| eudHandler.resources.limits.memory | string | `"1Gi"` |  |
| eudHandler.resources.requests.cpu | string | `"100m"` |  |
| eudHandler.resources.requests.memory | string | `"256Mi"` |  |
| eudHandler.securityContext | object | `{}` |  |
| eudHandler.service.annotations | object | `{}` |  |
| eudHandler.service.enabled | bool | `true` |  |
| eudHandler.service.ports.ssl.enabled | bool | `true` |  |
| eudHandler.service.ports.ssl.port | int | `8089` |  |
| eudHandler.service.ports.ssl.targetPort | string | `"ssl"` |  |
| eudHandler.service.ports.tcp.enabled | bool | `true` |  |
| eudHandler.service.ports.tcp.port | int | `8088` |  |
| eudHandler.service.ports.tcp.targetPort | string | `"tcp"` |  |
| eudHandler.service.ports.udp.enabled | bool | `false` |  |
| eudHandler.service.ports.udp.port | int | `8087` |  |
| eudHandler.service.ports.udp.targetPort | string | `"udp"` |  |
| eudHandler.service.type | string | `"ClusterIP"` |  |
| eudHandler.serviceAccountName | string | `""` |  |
| eudHandler.startupProbe.enabled | bool | `false` |  |
| eudHandler.startupProbe.failureThreshold | int | `30` |  |
| eudHandler.startupProbe.initialDelaySeconds | int | `10` |  |
| eudHandler.startupProbe.periodSeconds | int | `15` |  |
| eudHandler.startupProbe.tcpSocket.port | string | `"tcp"` |  |
| eudHandler.startupProbe.timeoutSeconds | int | `5` |  |
| eudHandler.tolerations | list | `[]` |  |
| eudHandler.volumeMounts | list | `[]` |  |
| eudHandler.volumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/brian7704/opentakserver"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.mountPath | string | `"/app/ots"` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podSecurityContext.fsGroup | int | `1024` |  |
| podSecurityContext.runAsGroup | int | `1024` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `1000` |  |
| postgresql.auth.database | string | `"ots"` |  |
| postgresql.auth.existingSecret | string | `""` |  |
| postgresql.auth.password | string | `"ots"` |  |
| postgresql.auth.secretKeys.adminPasswordKey | string | `"postgres-password"` |  |
| postgresql.auth.secretKeys.userPasswordKey | string | `"password"` |  |
| postgresql.auth.username | string | `"ots"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| postgresql.primary.persistence.size | string | `"8Gi"` |  |
| rabbitmq.architecture | string | `"single-node"` |  |
| rabbitmq.auth.existingSecret | string | `""` |  |
| rabbitmq.auth.existingSecretErlangCookieKey | string | `"rabbitmq-erlang-cookie"` |  |
| rabbitmq.auth.existingSecretPasswordKey | string | `"rabbitmq-password"` |  |
| rabbitmq.auth.existingSecretUsernameKey | string | `"rabbitmq-username"` |  |
| rabbitmq.auth.password | string | `"ots"` |  |
| rabbitmq.auth.username | string | `"ots"` |  |
| rabbitmq.auth.vhost | string | `"/"` |  |
| rabbitmq.config.extra | string | `"deprecated_features.permit.transient_nonexcl_queues = true\nmanagement.load_definitions = /etc/rabbitmq/definitions/definitions.json\nmqtt.listeners.tcp.default = 1883\nauth_backends.1 = internal\nauth_backends.2 = http\nauth_http.http_method = post\nauth_http.user_path = http://opentakserver-web:8081/api/rabbitmq/auth\nauth_http.vhost_path = http://opentakserver-web:8081/api/rabbitmq/vhost\nauth_http.resource_path = http://opentakserver-web:8081/api/rabbitmq/resource\nauth_http.topic_path = http://opentakserver-web:8081/api/rabbitmq/topic\n"` |  |
| rabbitmq.enabled | bool | `true` |  |
| rabbitmq.external.existingSecret.keys.host | string | `"host"` |  |
| rabbitmq.external.existingSecret.keys.password | string | `"password"` |  |
| rabbitmq.external.existingSecret.keys.port | string | `"port"` |  |
| rabbitmq.external.existingSecret.keys.username | string | `"username"` |  |
| rabbitmq.external.existingSecret.keys.vhost | string | `"vhost"` |  |
| rabbitmq.external.existingSecret.name | string | `""` |  |
| rabbitmq.external.host | string | `""` |  |
| rabbitmq.external.password | string | `"guest"` |  |
| rabbitmq.external.port | int | `5672` |  |
| rabbitmq.external.username | string | `"guest"` |  |
| rabbitmq.external.vhost | string | `"/"` |  |
| rabbitmq.extraVolumeMounts[0].mountPath | string | `"/etc/rabbitmq/definitions"` |  |
| rabbitmq.extraVolumeMounts[0].name | string | `"opentakserver-rabbitmq-definitions"` |  |
| rabbitmq.extraVolumeMounts[0].readOnly | bool | `true` |  |
| rabbitmq.extraVolumes[0].name | string | `"opentakserver-rabbitmq-definitions"` |  |
| rabbitmq.extraVolumes[0].secret.secretName | string | `"opentakserver-rabbitmq-definitions"` |  |
| rabbitmq.plugins.extra[0] | string | `"rabbitmq_mqtt"` |  |
| rabbitmq.plugins.extra[1] | string | `"rabbitmq_auth_backend_http"` |  |
| rabbitmq.queueDefaults.type | string | `"classic"` |  |
| rabbitmq.service.extraPorts[0].name | string | `"mqtt"` |  |
| rabbitmq.service.extraPorts[0].port | int | `1883` |  |
| rabbitmq.service.extraPorts[0].protocol | string | `"TCP"` |  |
| rabbitmq.service.extraPorts[0].targetPort | int | `1883` |  |
| rabbitmq.singleNode.persistence.enabled | bool | `false` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsGroup | int | `1024` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| ui.affinity | object | `{}` |  |
| ui.autoscaling.enabled | bool | `false` |  |
| ui.autoscaling.maxReplicas | int | `10` |  |
| ui.autoscaling.minReplicas | int | `1` |  |
| ui.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| ui.autoscaling.targetMemoryUtilizationPercentage | string | `""` |  |
| ui.enabled | bool | `true` |  |
| ui.envFrom | list | `[]` |  |
| ui.extraEnv | list | `[]` |  |
| ui.httpRoute.annotations | object | `{}` |  |
| ui.httpRoute.enabled | bool | `false` |  |
| ui.httpRoute.hostnames[0] | string | `"chart-example.local"` |  |
| ui.httpRoute.parentRefs[0].name | string | `"gateway"` |  |
| ui.httpRoute.parentRefs[0].sectionName | string | `"http"` |  |
| ui.httpRoute.rules[0].matches[0].path.type | string | `"PathPrefix"` |  |
| ui.httpRoute.rules[0].matches[0].path.value | string | `"/"` |  |
| ui.image.pullPolicy | string | `"IfNotPresent"` |  |
| ui.image.repository | string | `"ghcr.io/brian7704/opentakserver-ui"` |  |
| ui.image.tag | string | `"master"` |  |
| ui.imagePullSecrets | list | `[]` |  |
| ui.ingress.annotations | object | `{}` |  |
| ui.ingress.className | string | `""` |  |
| ui.ingress.enabled | bool | `false` |  |
| ui.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ui.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ui.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ui.ingress.tls | list | `[]` |  |
| ui.livenessProbe.failureThreshold | int | `5` |  |
| ui.livenessProbe.httpGet.path | string | `"/"` |  |
| ui.livenessProbe.httpGet.port | string | `"http"` |  |
| ui.livenessProbe.initialDelaySeconds | int | `10` |  |
| ui.livenessProbe.periodSeconds | int | `30` |  |
| ui.livenessProbe.timeoutSeconds | int | `5` |  |
| ui.nodeSelector | object | `{}` |  |
| ui.podAnnotations | object | `{}` |  |
| ui.podLabels | object | `{}` |  |
| ui.podSecurityContext | object | `{}` |  |
| ui.readinessProbe.failureThreshold | int | `5` |  |
| ui.readinessProbe.httpGet.path | string | `"/"` |  |
| ui.readinessProbe.httpGet.port | string | `"http"` |  |
| ui.readinessProbe.initialDelaySeconds | int | `5` |  |
| ui.readinessProbe.periodSeconds | int | `10` |  |
| ui.readinessProbe.timeoutSeconds | int | `5` |  |
| ui.replicaCount | int | `1` |  |
| ui.resources.limits.cpu | string | `"500m"` |  |
| ui.resources.limits.memory | string | `"256Mi"` |  |
| ui.resources.requests.cpu | string | `"50m"` |  |
| ui.resources.requests.memory | string | `"64Mi"` |  |
| ui.securityContext | object | `{}` |  |
| ui.service.annotations | object | `{}` |  |
| ui.service.enabled | bool | `true` |  |
| ui.service.ports.http.port | int | `8080` |  |
| ui.service.ports.http.targetPort | string | `"http"` |  |
| ui.service.type | string | `"ClusterIP"` |  |
| ui.serviceAccountName | string | `""` |  |
| ui.startupProbe.enabled | bool | `false` |  |
| ui.tolerations | list | `[]` |  |
| ui.volumeMounts | list | `[]` |  |
| ui.volumes | list | `[]` |  |
| web.affinity | object | `{}` |  |
| web.autoscaling.enabled | bool | `false` |  |
| web.autoscaling.maxReplicas | int | `10` |  |
| web.autoscaling.minReplicas | int | `1` |  |
| web.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| web.autoscaling.targetMemoryUtilizationPercentage | string | `""` |  |
| web.enabled | bool | `true` |  |
| web.envFrom | list | `[]` |  |
| web.extraEnv | list | `[]` |  |
| web.imagePullSecrets | list | `[]` |  |
| web.livenessProbe.failureThreshold | int | `5` |  |
| web.livenessProbe.httpGet.path | string | `"/api/health"` |  |
| web.livenessProbe.httpGet.port | string | `"api"` |  |
| web.livenessProbe.initialDelaySeconds | int | `30` |  |
| web.livenessProbe.periodSeconds | int | `30` |  |
| web.livenessProbe.timeoutSeconds | int | `5` |  |
| web.nodeSelector | object | `{}` |  |
| web.podAnnotations | object | `{}` |  |
| web.podLabels | object | `{}` |  |
| web.podSecurityContext | object | `{}` |  |
| web.readinessProbe.failureThreshold | int | `5` |  |
| web.readinessProbe.httpGet.path | string | `"/api/health"` |  |
| web.readinessProbe.httpGet.port | string | `"api"` |  |
| web.readinessProbe.initialDelaySeconds | int | `10` |  |
| web.readinessProbe.periodSeconds | int | `10` |  |
| web.readinessProbe.timeoutSeconds | int | `5` |  |
| web.replicaCount | int | `1` |  |
| web.resources.limits.cpu | string | `"1"` |  |
| web.resources.limits.memory | string | `"1Gi"` |  |
| web.resources.requests.cpu | string | `"100m"` |  |
| web.resources.requests.memory | string | `"256Mi"` |  |
| web.securityContext | object | `{}` |  |
| web.service.annotations | object | `{}` |  |
| web.service.enabled | bool | `true` |  |
| web.service.ports.api.port | int | `8081` |  |
| web.service.ports.api.targetPort | string | `"api"` |  |
| web.service.type | string | `"ClusterIP"` |  |
| web.serviceAccountName | string | `""` |  |
| web.startupProbe.enabled | bool | `false` |  |
| web.startupProbe.failureThreshold | int | `30` |  |
| web.startupProbe.httpGet.path | string | `"/api/health"` |  |
| web.startupProbe.httpGet.port | string | `"api"` |  |
| web.startupProbe.initialDelaySeconds | int | `10` |  |
| web.startupProbe.periodSeconds | int | `10` |  |
| web.startupProbe.timeoutSeconds | int | `5` |  |
| web.tolerations | list | `[]` |  |
| web.volumeMounts | list | `[]` |  |
| web.volumes | list | `[]` |  |

