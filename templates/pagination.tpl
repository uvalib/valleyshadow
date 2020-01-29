
{{ define "pagination" }}
<div class="pagination-div" >
</br>
	<div>{{ .NumFound}} Results Found</div>
	</br>
	<div>{{ noescape .ST }}</div>
	</br>
	<div> Showing records {{ .Start }} to {{ .CURSOR }} ({{ .NumFound }} total)</div>
</br>
</div>
{{ end }}
