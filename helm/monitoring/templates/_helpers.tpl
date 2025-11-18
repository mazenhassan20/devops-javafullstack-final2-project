{{- define "monitoring.labels" -}}
app.kubernetes.io/name: {{ include "monitoring.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "monitoring.name" -}}
monitoring
{{- end -}}

{{- define "monitoring.fullname" -}}
{{ include "monitoring.name" . }}-{{ .Release.Name }}
{{- end -}}