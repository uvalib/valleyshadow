#!/bin/bash
	
for f in ./*.xml; do
	filename=$(basename "$f")
	fname="${filename%.*}"
	echo $fname
	xsltproc browseOR.xsl $filename > $fname.html
done
