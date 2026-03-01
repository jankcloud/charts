{{/*
Expand the name of the chart.
Uses .Values.nameOverride when set, otherwise falls back to .Chart.Name.
Result is truncated to 63 characters.
*/}}
{{- define "arr-common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a fully-qualified app name used for resource names.

Uses .Values.fullnameOverride truncated to 63 chars.

Unless the release name already contains the chart name the release,
name is used on its own to avoid redundant duplication (e.g. "sonarr-sonarr" becomes just "sonarr").

Otherwise the release name and chart name are joined with "-".
Result is always truncated to 63 characters.
*/}}
{{- define "arr-common.fullname" -}}
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
Create the chart label value used in the helm.sh/chart annotation.
*/}}
{{- define "arr-common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "arr-common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "arr-common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
Includes the selector labels plus the chart version, app version and managed-by.
*/}}
{{- define "arr-common.labels" -}}
helm.sh/chart: {{ include "arr-common.chart" . }}
{{ include "arr-common.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
ServiceAccount name

If serviceAccount.create is true, use serviceAccount.name (or fullname as fallback).
If serviceAccount.create is false, use serviceAccount.name (or "default" as fallback).

Consumer charts that do not need a ServiceAccount can simply omit the
serviceAccount key from their values.
*/}}
{{- define "arr-common.serviceAccountName" -}}
{{- $sa := .Values.serviceAccount | default dict }}
{{- if $sa.create }}
{{- default (include "arr-common.fullname" .) $sa.name }}
{{- else }}
{{- default "default" $sa.name }}
{{- end }}
{{- end }}
