#!/bin/bash

label="<span color=\"red\">MEM</span>"

read free total <<< $(free -h | awk 'NR==2{print $3 " " $2}')

free_unit=$(echo $free | rev | cut -c2)
free="${free::-2}"
total="${total::-2}"

if [[ $free_unit == "M" ]]; then
  pct=$(echo "" | awk -v FREE=$free -v TOTAL=$total '{print  int(100*(FREE/1000)/TOTAL)"%"}')
  mem=$(echo $free"M/"$total"G" \| $pct)
else
  pct=$(echo "" | awk -v FREE=$free -v TOTAL=$total '{print  int(100*FREE/TOTAL)"%"}')
  mem=$(echo $free"G/"$total"G" \| $pct)
fi

echo $label $mem
