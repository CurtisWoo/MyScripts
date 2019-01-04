#!/bin/bash
#bash script that renames all [jpg, JPG] files and create a contact sheet in the same directory.

echo "===Start Renaming==="
exiv2 -r'%Y%m%d_%H%M_%S' -F rename $(ls)

echo "***** Starting Contact Sheet Creation *****"
montage -verbose -label '%f' -font DejaVu-Sans -pointsize 10 -background '#FFFFFF' -define jpeg:size=200x200 -geometry 200x200+2+2 -auto-orient -tile 4x5 $1/*.{jpg,JPG} ContactSheet.jpg
