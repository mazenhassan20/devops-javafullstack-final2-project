{{- define "twitter-app.name" -}}
twitter-app
{{- end -}}

{{- define "twitter-app.fullname" -}}
{{ include "twitter-app.name" . }}-{{ .Release.Name }}
{{- end -}}
