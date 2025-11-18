{{- define "db.name" -}}
db
{{- end -}}

{{- define "db.fullname" -}}
{{ include "db.name" . }}-{{ .Release.Name }}
{{- end -}}
