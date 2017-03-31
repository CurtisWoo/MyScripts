#!/bin/bash

USAGE="Usage: md2html [FILE] [DIRECTORY]"

files=( $@ )
last=$BASH_ARGV

if [ "$#" -ge 2 ] && [ -d "$last" ]
then
    count=0
    for file in "${files[@]}"; do
        if [[ "$file" == *".md" ]]; then
        pandoc "$file" --highlight-style=kate --template=foundation.html5 -o "$last/${file%.md}.html"
        count=$((count+1))
        fi
    done
    echo "Converted "$count" files."
else
    echo "$USAGE"
    exit 1
fi
