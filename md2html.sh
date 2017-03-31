#!/bin/bash

USAGE="Usage: md2html [FILE] [DIRECTORY]"

files=( $@ )
last=$BASH_ARGV

if [ "$#" -ge 2 ] && [ -d "$last" ]
then
    for file in "${files[@]}"; do
        if [[ "$file" == *".md" ]]; then
        pandoc "$file" --highlight-style=kate --template=foundation.html5 -o "$last/${file%.md}.html"
        fi
    done
    echo "Completed."
else
    echo "$USAGE"
    exit 1
fi
