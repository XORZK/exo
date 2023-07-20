#!/bin/bash

JS_LOC=./js/
IN=./src/
OUT=./html/
TEMPLATE=templates/template.html

mkdir "$OUT"
rm -r "$OUT*"
cp -r "$JS_LOC" "$OUT"

for file in $(find "$IN" -type f); do
    file_name=$(basename "$file")
    pandoc --template="$TEMPLATE" --mathjax -f markdown -t html "$file" -o "$OUT${file_name%.md}.html"
done
