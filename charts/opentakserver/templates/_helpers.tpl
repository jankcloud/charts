{{/*
Expand the name of the chart.
*/}}
{{- define "opentakserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "opentakserver.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "opentakserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "opentakserver.labels" -}}
helm.sh/chart: {{ include "opentakserver.chart" . }}
{{ include "opentakserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "opentakserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "opentakserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for the web pods.
*/}}
{{- define "opentakserver.webSelectorLabels" -}}
{{ include "opentakserver.selectorLabels" . }}
app.kubernetes.io/component: web
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "opentakserver.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "opentakserver.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
OpenTAKServer web service name (UI + API).
*/}}
{{- define "opentakserver.webServiceName" -}}
{{- printf "%s-web" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
OpenTAKServer web deployment name.
*/}}
{{- define "opentakserver.webDeploymentName" -}}
{{- printf "%s-web" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
OpenTAKServer UI deployment name.
*/}}
{{- define "opentakserver.uiName" -}}
{{- printf "%s-ui" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
OpenTAKServer UI service name.
*/}}
{{- define "opentakserver.uiServiceName" -}}
{{- printf "%s-ui" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
OpenTAKServer UI nginx ConfigMap name.
*/}}
{{- define "opentakserver.uiNginxConfigName" -}}
{{- printf "%s-ui-nginx" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels for the ui pods.
*/}}
{{- define "opentakserver.uiSelectorLabels" -}}
{{ include "opentakserver.selectorLabels" . }}
app.kubernetes.io/component: ui
{{- end }}

{{/*
RabbitMQ definitions ConfigMap name.
*/}}
{{- define "opentakserver.rabbitmqDefinitionsName" -}}
{{- printf "%s-rabbitmq-definitions" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
OpenTAKServer CoT service name.
*/}}
{{- define "opentakserver.cotsServiceName" -}}
{{- printf "%s-cots" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
EUD handler deployment name.
*/}}
{{- define "opentakserver.eudHandlerName" -}}
{{- printf "%s-eud-handler" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
CoT parser deployment name.
*/}}
{{- define "opentakserver.cotParserName" -}}
{{- printf "%s-cot-parser" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels for the eud_handler pods.
*/}}
{{- define "opentakserver.eudHandlerSelectorLabels" -}}
{{ include "opentakserver.selectorLabels" . }}
app.kubernetes.io/component: eud-handler
{{- end }}

{{/*
Selector labels for the cot_parser pods.
*/}}
{{- define "opentakserver.cotParserSelectorLabels" -}}
{{ include "opentakserver.selectorLabels" . }}
app.kubernetes.io/component: cot-parser
{{- end }}

{{/*
Name of the Kubernetes Secret that stores chart-managed credentials.
*/}}
{{- define "opentakserver.secretName" -}}
{{- printf "%s-secret" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
PVC name for the OTS data folder.
*/}}
{{- define "opentakserver.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim -}}
{{- else }}
{{- printf "%s-data" (include "opentakserver.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}

{{/*
Resolved RabbitMQ host for the OTS container.
*/}}
{{- define "opentakserver.rabbitmqHost" -}}
{{- if .Values.rabbitmq.enabled }}
{{- printf "%s-rabbitmq" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- default (printf "%s-rabbitmq" .Release.Name) .Values.rabbitmq.external.host | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}

{{/*
Resolved RabbitMQ AMQP port for the OTS container.
*/}}
{{- define "opentakserver.rabbitmqPort" -}}
{{- if .Values.rabbitmq.enabled }}
{{- 5672 -}}
{{- else }}
{{- .Values.rabbitmq.external.port | default 5672 -}}
{{- end }}
{{- end }}

{{/*
Resolved RabbitMQ username for the OTS container.
*/}}
{{- define "opentakserver.rabbitmqUsername" -}}
{{- if .Values.rabbitmq.enabled }}
{{- .Values.rabbitmq.auth.username | default "guest" -}}
{{- else }}
{{- .Values.rabbitmq.external.username | default "guest" -}}
{{- end }}
{{- end }}

{{/*
Resolved RabbitMQ password for the OTS container.
*/}}
{{- define "opentakserver.rabbitmqPassword" -}}
{{- if .Values.rabbitmq.enabled }}
{{- .Values.rabbitmq.auth.password | default "guest" -}}
{{- else }}
{{- .Values.rabbitmq.external.password | default "guest" -}}
{{- end }}
{{- end }}

{{/*
Resolved RabbitMQ vhost for the OTS container.
*/}}
{{- define "opentakserver.rabbitmqVhost" -}}
{{- if .Values.rabbitmq.enabled }}
{{- .Values.rabbitmq.auth.vhost | default "/" -}}
{{- else }}
{{- .Values.rabbitmq.external.vhost | default "/" -}}
{{- end }}
{{- end }}

{{/*
Name of the bundled PostgreSQL service.
*/}}
{{- define "opentakserver.postgresqlHost" -}}
{{- printf "%s-postgresql" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Resolved database host.
*/}}
{{- define "opentakserver.databaseHost" -}}
{{- if .Values.postgresql.enabled -}}
{{- include "opentakserver.postgresqlHost" . -}}
{{- else -}}
{{- .Values.database.host -}}
{{- end -}}
{{- end }}

{{/*
Resolved database port.
*/}}
{{- define "opentakserver.databasePort" -}}
{{- if .Values.postgresql.enabled -}}
{{- 5432 -}}
{{- else -}}
{{- .Values.database.port | default 5432 -}}
{{- end -}}
{{- end }}

{{/*
Resolved database name.
*/}}
{{- define "opentakserver.databaseName" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.auth.database | default "ots" -}}
{{- else -}}
{{- .Values.database.database -}}
{{- end -}}
{{- end }}

{{/*
Resolved database username.
*/}}
{{- define "opentakserver.databaseUsername" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.auth.username | default "ots" -}}
{{- else -}}
{{- .Values.database.username -}}
{{- end -}}
{{- end }}

{{/*
Secret holding the database credentials.
*/}}
{{- define "opentakserver.databaseSecretName" -}}
{{- if .Values.postgresql.enabled -}}
{{- if .Values.postgresql.auth.existingSecret -}}
{{- .Values.postgresql.auth.existingSecret -}}
{{- else -}}
{{- include "opentakserver.postgresqlHost" . -}}
{{- end -}}
{{- else if .Values.database.existingSecret.name -}}
{{- .Values.database.existingSecret.name -}}
{{- else -}}
{{- include "opentakserver.secretName" . -}}
{{- end -}}
{{- end }}

{{/*
Key within the database secret that holds the user password.
*/}}
{{- define "opentakserver.databasePasswordKey" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.auth.secretKeys.userPasswordKey | default "password" -}}
{{- else -}}
{{- .Values.database.existingSecret.keys.password | default "password" -}}
{{- end -}}
{{- end }}

{{/*
RabbitMQ secret name.
*/}}
{{- define "opentakserver.rabbitmqSecretName" -}}
{{- if .Values.rabbitmq.enabled -}}
{{- if .Values.rabbitmq.auth.existingSecret -}}
{{- .Values.rabbitmq.auth.existingSecret -}}
{{- else -}}
{{- printf "%s-rabbitmq-auth" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- else -}}
{{- if .Values.rabbitmq.external.existingSecret.name -}}
{{- .Values.rabbitmq.external.existingSecret.name -}}
{{- else -}}
{{- include "opentakserver.secretName" . -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/*
Key within the RabbitMQ secret that holds the password.
*/}}
{{- define "opentakserver.rabbitmqPasswordKey" -}}
{{- if .Values.rabbitmq.enabled -}}
{{- .Values.rabbitmq.auth.existingSecretPasswordKey | default "rabbitmq-password" -}}
{{- else -}}
{{- .Values.rabbitmq.external.existingSecret.keys.password | default "password" -}}
{{- end -}}
{{- end }}

{{/*
Database URI value.
*/}}
{{- define "opentakserver.databaseUri" -}}
{{- .Values.database.uri -}}
{{- end }}

{{/*
Render a Deployment for one OTS workload component (web, eud-handler,
cot-parser).
*/}}
{{- define "opentakserver.deployment" -}}
{{- $ctx := .ctx -}}
{{- $values := .values -}}
{{- $component := .component -}}
{{- $initContainers := .initContainers -}}
{{- $extraContainers := .extraContainers -}}
{{- $extraVolumes := .extraVolumes -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .name }}
  labels:
    {{- include "opentakserver.labels" $ctx | nindent 4 }}
    app.kubernetes.io/component: {{ $component }}
spec:
  {{- if not $values.autoscaling.enabled }}
  replicas: {{ $values.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include .selectorLabelsTemplate $ctx | nindent 6 }}
  template:
    metadata:
      {{- with $values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
        {{- include "opentakserver.labels" $ctx | nindent 8 }}
        app.kubernetes.io/component: {{ $component }}
        {{- with $values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      {{- with (default $ctx.Values.imagePullSecrets $values.imagePullSecrets) }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ default (include "opentakserver.serviceAccountName" $ctx) $values.serviceAccountName }}
      {{- with (default $ctx.Values.podSecurityContext $values.podSecurityContext) }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
        - name: {{ .containerName }}
          {{- with (default $ctx.Values.securityContext $values.securityContext) }}
          securityContext:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          image: "{{ $ctx.Values.image.repository }}:{{ $ctx.Values.image.tag | default $ctx.Chart.AppVersion }}"
          imagePullPolicy: {{ $ctx.Values.image.pullPolicy }}
          {{- with .command }}
          command:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          env:
            {{- with .extraContainerEnv }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
            {{- include "opentakserver.env" $ctx | nindent 12 }}
            {{- with $values.extraEnv }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
          {{- with $values.envFrom }}
          envFrom:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .ports }}
          ports:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- if $values.startupProbe.enabled }}
          startupProbe:
            {{- omit $values.startupProbe "enabled" | toYaml | nindent 12 }}
          {{- end }}
          {{- with $values.livenessProbe }}
          livenessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $values.readinessProbe }}
          readinessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with $values.resources }}
          resources:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          volumeMounts:
            - name: ots-data
              mountPath: {{ $ctx.Values.persistence.mountPath }}
            {{- with $values.volumeMounts }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
        {{- with $extraContainers }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      volumes:
        - name: ots-data
          {{- if $ctx.Values.persistence.enabled }}
          persistentVolumeClaim:
            claimName: {{ include "opentakserver.pvcName" $ctx }}
          {{- else }}
          emptyDir: {}
          {{- end }}
        {{- with $extraVolumes }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
        {{- with $values.volumes }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      {{- with $values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with $values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
{{- end }}

{{- define "opentakserver.caSecretName" -}}
{{ include "opentakserver.fullname" . }}-ots-ca
{{- end }}

{{- define "opentakserver.caPublishEnabled" -}}
{{- if or (and .Values.eudHandler.enabled .Values.eudHandler.ssl.enabled) (and .Values.eudHandler.enabled (eq .Values.eudHandler.mode "ssl")) .Values.mediamtx.enabled (and .Values.ui.enabled .Values.ui.enrollment.enabled) -}}
true
{{- end -}}
{{- end }}

{{- define "opentakserver.mediamtxName" -}}
{{ include "opentakserver.fullname" . }}-mediamtx
{{- end }}

{{- define "opentakserver.mediamtxServiceName" -}}
{{ include "opentakserver.mediamtxName" . }}
{{- end }}

{{- define "opentakserver.mediamtxConfigName" -}}
{{ include "opentakserver.mediamtxName" . }}-config
{{- end }}

{{- define "opentakserver.mediamtxSelectorLabels" -}}
{{- include "opentakserver.selectorLabels" . }}
app.kubernetes.io/component: mediamtx
{{- end }}

{{- define "opentakserver.enrollmentServiceName" -}}
{{ include "opentakserver.uiName" . }}-enrollment
{{- end }}

{{- define "opentakserver.mediamtxApiAddress" -}}
{{- if .Values.mediamtx.enabled -}}
http://{{ include "opentakserver.mediamtxServiceName" . }}:{{ .Values.mediamtx.service.ports.api.port }}
{{- else -}}
http://localhost:{{ .Values.mediamtx.service.ports.api.port }}
{{- end -}}
{{- end }}

{{- define "opentakserver.env" -}}
- name: OTS_DATA_FOLDER
  value: {{ .Values.env.OTS_DATA_FOLDER | default "/app/ots" | quote }}
- name: OTS_LISTENER_ADDRESS
  value: {{ .Values.env.OTS_LISTENER_ADDRESS | default "0.0.0.0" | quote }}
- name: OTS_LISTENER_PORT
  value: {{ .Values.env.OTS_LISTENER_PORT | default "8081" | quote }}
- name: OTS_STREAMING_INTERFACE
  value: {{ .Values.env.OTS_STREAMING_INTERFACE | default "0.0.0.0" | quote }}
- name: OTS_TCP_STREAMING_PORT
  value: {{ .Values.env.OTS_TCP_STREAMING_PORT | default "8088" | quote }}
- name: OTS_SSL_STREAMING_PORT
  value: {{ .Values.env.OTS_SSL_STREAMING_PORT | default "8089" | quote }}
- name: OTS_UDP_PORT
  value: {{ .Values.env.OTS_UDP_PORT | default "8087" | quote }}
- name: OTS_RABBITMQ_SERVER_ADDRESS
  value: {{ include "opentakserver.rabbitmqHost" . | quote }}
- name: OTS_RABBITMQ_USERNAME
  value: {{ include "opentakserver.rabbitmqUsername" . | quote }}
- name: OTS_RABBITMQ_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "opentakserver.rabbitmqSecretName" . }}
      key: {{ include "opentakserver.rabbitmqPasswordKey" . }}
- name: OTS_RABBITMQ_VHOST
  value: {{ include "opentakserver.rabbitmqVhost" . | quote }}
- name: OTS_MEDIAMTX_ENABLE
  value: {{ .Values.env.OTS_MEDIAMTX_ENABLE | default .Values.mediamtx.enabled | quote }}
- name: OTS_MEDIAMTX_API_ADDRESS
  value: {{ .Values.env.OTS_MEDIAMTX_API_ADDRESS | default (include "opentakserver.mediamtxApiAddress" .) | quote }}
- name: OTS_MEDIAMTX_TOKEN
  value: {{ .Values.env.OTS_MEDIAMTX_TOKEN | default "opentakserver" | quote }}
{{- if .Values.database.uri }}
- name: SQLALCHEMY_DATABASE_URI
  value: {{ .Values.database.uri | quote }}
{{- else if .Values.database.existingSecret.name }}
- name: SQLALCHEMY_DATABASE_URI
  valueFrom:
    secretKeyRef:
      name: {{ .Values.database.existingSecret.name }}
      key: {{ .Values.database.existingSecret.keys.uri | default "uri" }}
      optional: true
{{- else if .Values.postgresql.enabled }}
- name: OTS_DB_HOST
  value: {{ include "opentakserver.databaseHost" . | quote }}
- name: OTS_DB_PORT
  value: {{ include "opentakserver.databasePort" . | quote }}
- name: OTS_DB_NAME
  value: {{ include "opentakserver.databaseName" . | quote }}
- name: OTS_DB_USERNAME
  value: {{ include "opentakserver.databaseUsername" . | quote }}
- name: OTS_DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "opentakserver.databaseSecretName" . }}
      key: {{ include "opentakserver.databasePasswordKey" . }}
- name: SQLALCHEMY_DATABASE_URI
  value: {{ printf "postgresql+psycopg://%s:$(OTS_DB_PASSWORD)@%s:%s/%s" (include "opentakserver.databaseUsername" .) (include "opentakserver.databaseHost" .) (include "opentakserver.databasePort" .) (include "opentakserver.databaseName" .) | quote }}
{{- else }}
- name: SQLALCHEMY_DATABASE_URI
  valueFrom:
    secretKeyRef:
      name: {{ include "opentakserver.databaseSecretName" . }}
      key: {{ .Values.database.existingSecret.keys.uri | default "uri" }}
      optional: true
{{- if .Values.database.host }}
- name: OTS_DB_HOST
  value: {{ .Values.database.host | quote }}
- name: OTS_DB_PORT
  value: {{ .Values.database.port | quote }}
- name: OTS_DB_NAME
  value: {{ .Values.database.database | quote }}
- name: OTS_DB_USERNAME
  value: {{ .Values.database.username | quote }}
- name: OTS_DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "opentakserver.databaseSecretName" . }}
      key: {{ include "opentakserver.databasePasswordKey" . }}
{{- end }}
{{- end }}
{{- end }}
