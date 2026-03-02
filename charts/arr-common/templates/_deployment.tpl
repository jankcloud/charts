{{- define "arr-common.deployment" -}}
{{- $persistence       := .Values.persistence | default dict }}
{{- $configPvc         := $persistence.config  | default dict }}
{{- $additionalVolumes := .Values.additionalVolumes | default list }}
{{- $extraVolumeMounts := .Values.extraVolumeMounts | default list }}
{{- $extraVolumes      := .Values.extraVolumes      | default list }}
{{- $initContainers    := .Values.initContainers    | default list }}
{{- $sidecars          := .Values.sidecars          | default list }}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "arr-common.fullname" . }}
  labels:
    {{- include "arr-common.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount | default 1 }}
  strategy:
    type: {{ (.Values.strategy).type | default "Recreate" }}
  selector:
    matchLabels:
      {{- include "arr-common.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "arr-common.labels" . | nindent 8 }}
    spec:
      serviceAccountName: {{ include "arr-common.serviceAccountName" . }}
      {{- if $initContainers }}
      initContainers:
        {{- toYaml $initContainers | nindent 8 }}
      {{- end }}
      containers:
        - name: {{ include "arr-common.name" . }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy | default "IfNotPresent" }}
          ports:
            - name: http
              containerPort: {{ .Values.service.port }}
              protocol: TCP
          {{- if .Values.env }}
          env:
            {{- range $key, $value := .Values.env }}
            - name: {{ $key }}
              value: {{ $value | quote }}
            {{- end }}
          {{- end }}
          {{- if .Values.probes }}
          {{- with .Values.probes.liveness }}
          livenessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .Values.probes.readiness }}
          readinessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- end }}
          {{- with .Values.resources }}
          resources:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- $hasMounts := or ($configPvc.enabled | default false) (gt (len $additionalVolumes) 0) (gt (len $extraVolumeMounts) 0) }}
          {{- if $hasMounts }}
          volumeMounts:
            {{- if $configPvc.enabled | default false }}
            - name: config
              mountPath: /config
            {{- end }}
            {{- range $vol := $additionalVolumes }}
            - name: {{ required "additionalVolumes[].name is required" $vol.name }}
              mountPath: {{ required "additionalVolumes[].mountPath is required" $vol.mountPath | quote }}
              {{- if $vol.readOnly }}
              readOnly: true
              {{- end }}
            {{- end }}
            {{- if $extraVolumeMounts }}
            {{- toYaml $extraVolumeMounts | nindent 12 }}
            {{- end }}
          {{- end }}
        {{- include "arr-common.gluetun.container" . | nindent 8 }}
        {{- include "arr-common.exportarr.container" . | nindent 8 }}
        {{- if $sidecars }}
        {{- toYaml $sidecars | nindent 8 }}
        {{- end }}
      {{- $gluetunNeedsVolume := and (.Values.gluetun.enabled) (and .Values.gluetun.existingSecret (ne .Values.gluetun.existingSecret "")) }}
      {{- $hasVolumes := or ($configPvc.enabled | default false) (gt (len $additionalVolumes) 0) (gt (len $extraVolumes) 0) $gluetunNeedsVolume }}
      {{- if $hasVolumes }}
      volumes:
        {{- if $configPvc.enabled | default false }}
        - name: config
          persistentVolumeClaim:
            claimName: {{ printf "%s-config" (include "arr-common.fullname" .) }}
        {{- end }}
        {{- range $vol := $additionalVolumes }}
        {{- $claimName := $vol.existingClaim | default (printf "%s-%s" (include "arr-common.fullname" $) $vol.name) }}
        - name: {{ $vol.name }}
          persistentVolumeClaim:
            claimName: {{ $claimName }}
        {{- end }}
        {{- if $extraVolumes }}
        {{- toYaml $extraVolumes | nindent 8 }}
        {{- end }}
        {{- include "arr-common.gluetun.volumes" . | nindent 8 }}
      {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
{{- end }}
