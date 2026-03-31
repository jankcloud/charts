{{- define "arr-common.metricsExporter.container" -}}
{{- $metricsExporter := .Values.metricsExporter | default dict }}
{{- if $metricsExporter.enabled }}
{{- $image := $metricsExporter.image | default dict }}
{{- $containerName := $metricsExporter.name | default "metrics-exporter" }}
{{- $portName := $metricsExporter.portName | default "metrics-exporter" }}
- name: {{ $containerName }}
  image: "{{ $image.repository }}:{{ $image.tag }}"
  imagePullPolicy: {{ $image.pullPolicy }}
  ports:
    - name: {{ $portName }}
      containerPort: {{ $metricsExporter.port }}
      protocol: TCP
  {{- with $metricsExporter.command }}
  command:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metricsExporter.args }}
  args:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- if or $metricsExporter.env $metricsExporter.envFrom }}
  {{- with $metricsExporter.envFrom }}
  envFrom:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metricsExporter.env }}
  env:
    {{- range $key, $value := . }}
    - name: {{ $key }}
      value: {{ $value | quote }}
    {{- end }}
    - name: PORT
      value: {{ $metricsExporter.port | quote }}
  {{- else }}
  env:
    - name: PORT
      value: {{ $metricsExporter.port | quote }}
  {{- end }}
  {{- end }}
  {{- with $metricsExporter.securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metricsExporter.resources }}
  resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $metricsExporter.volumeMounts }}
  volumeMounts:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "arr-common.metricsExporter.port" -}}
{{- $metricsExporter := .Values.metricsExporter | default dict }}
{{- if $metricsExporter.enabled }}
{{- $portName := $metricsExporter.portName | default "metrics-exporter" }}
- name: {{ $portName }}
  port: {{ $metricsExporter.port }}
  targetPort: {{ $portName }}
  protocol: TCP
{{- end }}
{{- end }}
