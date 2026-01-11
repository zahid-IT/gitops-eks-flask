{{/* 
Common template helpers for flask-app Helm chart
*/}}

{{- define "flask-app.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "flask-app.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "flask-app.labels" -}}
app.kubernetes.io/name: {{ include "flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "flask-app.selectorLabels" -}}
app: {{ include "flask-app.fullname" . }}
{{- end -}}
