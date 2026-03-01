{{- define "arr-common.pvc" -}}
{{- $persistence       := .Values.persistence | default dict }}
{{- $configPvc         := $persistence.config  | default dict }}
{{- $additionalVolumes := .Values.additionalVolumes | default list }}
{{- $fullname          := include "arr-common.fullname" . }}

{{- if $configPvc.enabled | default false }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ printf "%s-config" $fullname }}
  labels:
    {{- include "arr-common.labels" . | nindent 4 }}
spec:
  accessModes:
    - {{ $configPvc.accessMode | default "ReadWriteOnce" }}
  {{- if $configPvc.storageClass }}
  storageClassName: {{ $configPvc.storageClass | quote }}
  {{- end }}
  {{- if $configPvc.volumeName }}
  volumeName: {{ $configPvc.volumeName | quote }}
  {{- end }}
  resources:
    requests:
      storage: {{ $configPvc.size | default "2Gi" }}
{{- end }}

{{- range $vol := $additionalVolumes }}
{{- if not $vol.existingClaim }}
{{- $pvcSpec := $vol.pvc | default dict }}
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ printf "%s-%s" $fullname $vol.name }}
  labels:
    {{- include "arr-common.labels" $ | nindent 4 }}
spec:
  accessModes:
    - {{ $pvcSpec.accessMode | default "ReadWriteOnce" }}
  {{- if $pvcSpec.storageClass }}
  storageClassName: {{ $pvcSpec.storageClass | quote }}
  {{- end }}
  {{- if $pvcSpec.volumeName }}
  volumeName: {{ $pvcSpec.volumeName | quote }}
  {{- end }}
  resources:
    requests:
      storage: {{ required (printf "additionalVolumes[%s].pvc.size is required when existingClaim is not set" $vol.name) $pvcSpec.size }}
{{- end }}
{{- end }}
{{- end }}
