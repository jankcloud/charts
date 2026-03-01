{{- define "arr-common.gluetun.container" -}}
{{- if .Values.gluetun.enabled }}
{{- $gluetun := .Values.gluetun }}
{{- $hasInlineEnv    := and $gluetun.env (gt (len $gluetun.env) 0) }}
{{- $hasExistingSecret := and $gluetun.existingSecret (ne $gluetun.existingSecret "") }}
{{- if and $hasInlineEnv $hasExistingSecret }}
  {{- fail "arr-common: gluetun.env and gluetun.existingSecret are mutually exclusive — set one or the other, not both." }}
{{- end }}
- name: gluetun
  image: "{{ $gluetun.image.repository }}:{{ $gluetun.image.tag }}"
  imagePullPolicy: {{ $gluetun.image.pullPolicy }}
  securityContext:
    capabilities:
      add:
        - NET_ADMIN
  {{- if $hasExistingSecret }}
  envFrom:
    - secretRef:
        name: {{ $gluetun.existingSecret }}
  {{- else if $hasInlineEnv }}
  env:
    {{- range $key, $value := $gluetun.env }}
    - name: {{ $key }}
      value: {{ $value | quote }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "arr-common.gluetun.volumes" -}}
{{- if .Values.gluetun.enabled }}
{{- $gluetun := .Values.gluetun }}
{{- if and $gluetun.existingSecret (ne $gluetun.existingSecret "") }}
- name: gluetun-credentials
  secret:
    secretName: {{ $gluetun.existingSecret }}
{{- end }}
{{- end }}
{{- end }}
