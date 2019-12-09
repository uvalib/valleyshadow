
{{ define "pagination" }}
<div style="text-align:center; width:79%" >
	<div>{{ .NumFound}} Results Found | <a href="http://localhost:8080/letters_search">New Search</a></div>
	</br>
	<div>{{ noescape .ST }}</div>
	</br>
	<div> Showing records {{ .Start }} to {{ .CURSOR }} ({{ .NumFound }} total)</div>
</div>
{{ end }}