#!/bin/bash
	
for f in ./*.xml; do
	filename=$(basename "$f")
	fname="${filename%.*}"
	echo $fname
	xsltproc browseClaims.xsl $filename > $fname.html
done
