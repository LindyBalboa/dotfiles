#!/bin/bash
text=$(amixer get Master);
read level state <<< $(echo "$text" | tail -n1 | awk '{print $5,$6}')

label="<span color=\"red\">Vol</span>"

if [ $state == "[off]" ]; then
  text="<span color=\"red\">M</span>"
else
  text=$(echo $level | tr -d [])
fi

echo $label $text
