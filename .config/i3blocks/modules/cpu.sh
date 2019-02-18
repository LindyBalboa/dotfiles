#!/bin/bash

label="<span color=\"red\">CPU</span>"
stats=$(mpstat -P ALL 1 1 | tail -n4 | awk '{gsub(/ /,""    ,$3);printf "%d\%", $3}' | sed -e 's/\%/\% /g' | rev | sed -e 's/ //' | rev)
temp=$(sensors | grep "Core 0" | awk '{print substr($3,2,2)}')
printf '%b %b | %b°C' "$label" "$stats" "$temp"
