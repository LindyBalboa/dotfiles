#!/bin/bash

if json=$(curl -sS --connect-timeout 5 ipinfo.io); then
	python3 -c "import sys, json; print(json.loads(sys.argv[1])['country'])" "$json"
else 
	echo Timout
fi

