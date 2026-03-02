{{- define "arr-common.exportarr.container" -}}
{{- if .Values.exportarr.enabled }}
{{- $ea := .Values.exportarr }}
- name: exportarr
  image: "{{ $ea.image.repository }}:{{ $ea.image.tag }}"
  imagePullPolicy: {{ $ea.image.pullPolicy }}
  ports:
    - name: exportarr
      containerPort: {{ $ea.port }}
      protocol: TCP
  env:
    {{- range $key, $value := $ea.env }}
    - name: {{ $key }}
      value: {{ $value | quote }}
    {{- end }}
    - name: PORT
      value: {{ $ea.port | quote }}
{{- end }}
{{- end }}

{{- define "arr-common.exportarr.port" -}}
{{- if .Values.exportarr.enabled }}
- name: exportarr
  port: {{ .Values.exportarr.port }}
  targetPort: exportarr
  protocol: TCP
{{- end }}
{{- end }}
