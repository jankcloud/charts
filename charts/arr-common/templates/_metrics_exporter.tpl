{{- define "arr-common.metrics.container" -}}
{{- $metrics := .Values.metrics | default dict }}
{{- if $metrics.enabled }}
{{- $image := $metrics.image | default dict }}
{{- $containerName := $metrics.name | default "metrics-exporter" }}
{{- $portName := $metrics.portName | default "metrics-exporter" }}
- name: {{ $containerName }}
  image: "{{ $image.repository }}:{{ $image.tag }}"
  imagePullPolicy: {{ $image.pullPolicy }}
  ports:
    - name: {{ $portName }}
      containerPort: {{ $metrics.port }}
      protocol: TCP
  {{- with $metrics.command }}
  command:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metrics.args }}
  args:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if or $metrics.env $metrics.envFrom }}
  {{- with $metrics.envFrom }}
  envFrom:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metrics.env }}
  env:
    {{- range $key, $value := . }}
    - name: {{ $key }}
      value: {{ $value | quote }}
    {{- end }}
    - name: PORT
      value: {{ $metrics.port | quote }}
  {{- else }}
  env:
    - name: PORT
      value: {{ $metrics.port | quote }}
  {{- end }}
  {{- end }}
  {{- with $metrics.securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metrics.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metrics.volumeMounts }}
  volumeMounts:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "arr-common.metrics.port" -}}
{{- $metrics := .Values.metrics | default dict }}
{{- if $metrics.enabled }}
{{- $portName := $metrics.portName | default "metrics-exporter" }}
- name: {{ $portName }}
  port: {{ $metrics.port }}
  targetPort: {{ $portName }}
  protocol: TCP
{{- end }}
{{- end }}
