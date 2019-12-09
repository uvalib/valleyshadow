#!/bin/bash
	
# for f in ./*.xml; do
#	filename=$(basename "$f")
#	fname="${filename%.*}"
#	echo $fname
#	xsltproc vosnews.xsl $filename > $fname.html
#done
for f in /Users/tss6n/go/src/valley-go/newspapers/*;
  do
if [ -d $f ] ; then

  echo $f
  	for x in $f/*;
  	do
  	bn=$(basename $x)
  	nameonly=$(basename $x .xml)
   	echo Entering into $x && xsltproc vosnews.xsl $x > $f\/$nameonly.html
	# rm $x
  done;
  fi
done;
