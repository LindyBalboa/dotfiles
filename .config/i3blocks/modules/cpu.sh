#!/bin/bash

label="<span color=\"red\">CPU</span>"
stats=$(mpstat -P ALL 1 1 | tail -n4 | awk '{gsub(/ /,""    ,$3);printf "%d\% ", $3}')
temp=$(sensors | grep "Core 0" | awk '{print substr($3,2,2)}')
echo $label $stats \| $temp°C
