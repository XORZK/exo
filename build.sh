#!/bin/bash

JS_LOC=./js/
TEX_LOC=./js/math-jax.js
IN=./src/
OUT=./html/
TEMPLATE=./templates/template.html

mkdir "$OUT"
rm -r "$OUT*"
cp -r "$JS_LOC" "$OUT"

for file in $(find "$IN" -type f); do
    file_type=$(file -b --mime-type "$file")
    file_extension="${file##*.}"

    if [[ "$file_type" == "text/plain" ]]; then 
        if [[ "$file_extension" == "md" ]]; then 
            file_name=$(basename "$file")
            pandoc --standalone --template="$TEMPLATE" --mathjax="$TEX_LOC" -f markdown -t html "$file" -o "$OUT${file_name%.md}.html"
        fi
    fi
done
