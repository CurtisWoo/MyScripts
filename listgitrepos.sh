#!/bin/bash

declare -A gitdic
repolist=()
while IFS= read -d $'\0' -r file ; do
    dir=$(basename "$(dirname "$file")")
    gitdic["$dir"]="$(dirname "$file")"
    repolist+="$dir\n"
done < <(find ~ -type d -name .git -print0)

choice=$(echo -e "$repolist" | dmenu -b -fn "DejaVu Sans Mono 12")
if [ -n "$choice" ]
then 
    termite -d "${gitdic["$choice"]}" &
fi
