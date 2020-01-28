
{{ define "pagination" }}
<div class="pagination-div" >
	<div>{{ .NumFound}} Results Found
	</br>
	<div>{{ noescape .ST }}</div>
	</br>
	<div> Showing records {{ .Start }} to {{ .CURSOR }} ({{ .NumFound }} total)</div>
</div>
{{ end }}
