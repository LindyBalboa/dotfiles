#!/bin/bash
ESSID=$(iw wlo1 link | grep SSID | cut -d: -f2 | sed 's/ //')
Signal=$(iw wlo1 link | grep signal | cut -d: -f2 | sed 's/ //')

echo $ESSID $Signal

