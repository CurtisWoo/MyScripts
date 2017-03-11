#!/bin/bash

declare -a gitdic
repolist=()
while IFS= read -d $'\0' -r file ; do
    dir=$(basename "$(dirname "$file")")
    gitdic["$dir"]="$(dirname "$file")"
    repolist+="$dir\n"
done < <(find ~ -type d -name .git -print0)

choice=$(echo -e "$repolist" | dmenu)
