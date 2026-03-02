{{- define "arr-common.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "arr-common.fullname" . }}
  labels:
    {{- include "arr-common.labels" . | nindent 4 }}
  {{- with .Values.service.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ .Values.service.type | default "ClusterIP" }}
  ports:
    - name: http
      port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
    {{- include "arr-common.exportarr.port" . | nindent 4 }}
  selector:
    {{- include "arr-common.selectorLabels" . | nindent 4 }}
{{- end }}
