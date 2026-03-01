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
  selector:
    matchLabels:
      {{- include "arr-common.selectorLabels" . | nindent 6 }}
  endpoints:
    - port: http
      interval: {{ .Values.serviceMonitor.interval | default "30s" }}
      scrapeTimeout: {{ .Values.serviceMonitor.scrapeTimeout | default "10s" }}
    {{- if .Values.exportarr.enabled }}
    # Exportarr metrics endpoint — only rendered when exportarr.enabled: true.
    - port: exportarr
      interval: {{ .Values.serviceMonitor.interval | default "30s" }}
      scrapeTimeout: {{ .Values.serviceMonitor.scrapeTimeout | default "10s" }}
    {{- end }}
{{- end }}
{{- end }}
