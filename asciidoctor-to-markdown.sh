#!/bin/bash

echo "convert $1.adoc to $1.xml as docbook"
asciidoctor -b docbook $1.adoc

echo "convert $1.xml as docbook to $1.md"
pandoc -f docbook -t markdown --wrap=preserve --atx-headers $1.xml -o $1.md

echo "replace some characters in $1.md"
sed -i "s/ {#.*}//g" $1.md
sed -i "s/\~\\\~\~/\~\~\~/g" $1.md
sed -i "s/\]\(view-source\:/\]\(/g" $1.md
