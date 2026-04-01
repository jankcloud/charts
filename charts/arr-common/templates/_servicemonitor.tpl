{{- define "arr-common.servicemonitor" -}}
{{- if .Values.serviceMonitor.enabled }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ include "arr-common.fullname" . }}
  labels:
    {{- include "arr-common.labels" . | nindent 4 }}
    {{- with .Values.serviceMonitor.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  {{- with .Values.serviceMonitor.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- $metrics := .Values.metrics | default dict }}
  {{- $metricsExporterEnabled := $metrics.enabled | default false }}
  {{- $metricsPortName := $metrics.portName | default "metrics-exporter" }}
  selector:
    matchLabels:
      {{- include "arr-common.selectorLabels" . | nindent 6 }}
  endpoints:
    - port: http
      interval: {{ .Values.serviceMonitor.interval | default "30s" }}
      scrapeTimeout: {{ .Values.serviceMonitor.scrapeTimeout | default "10s" }}
    {{- if $metricsExporterEnabled }}
    - port: {{ $metricsPortName }}
      interval: {{ .Values.serviceMonitor.interval | default "30s" }}
      scrapeTimeout: {{ .Values.serviceMonitor.scrapeTimeout | default "10s" }}
      {{- with $metrics.path }}
      path: {{ . }}
      {{- end }}
    {{- end }}
{{- end }}
{{- end }}
