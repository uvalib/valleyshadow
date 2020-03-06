
{{ define "pagination" }}
<!--- <div class="pagination-div" > -->
</br>
	<div>{{ .NumFound}} Results Found</div>
	</br>
	<div>{{ noescape .ST }}</div>
	</br>
	{{if (gt .CURSOR .NumFound)}}
		<div> Showing records {{ .Start }} to {{ .NumFound }} ({{ .NumFound }} total)</div>
	{{ else if or (eq .Start 0) (eq .CURSOR .NumFound)}}
		<div> Showing records 1 to {{ .CURSOR }} ({{ .NumFound }} total)</div>
  {{ else if (lt .NumFound 50)}}
		<div> Showing records 1 to {{ .CURSOR }} ({{ .NumFound }} total)</div>
  {{ else }}
		<div> Showing records {{ .Start }} to {{ .CURSOR }} ({{ .NumFound }} total)</div>
{{ end }}
</br>
<!--  </div>  -->
{{ end }}
