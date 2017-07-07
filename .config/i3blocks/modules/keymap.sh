#!/bin/bash

KEYMAP_DIRECTORY='/usr/share/kbd/keymaps'

# Aprrently localectl status does not update on keymap change. However, setxkbmap does.
XKB_OUTPUT=$(setxkbmap -query)
VC_KEYMAP=$(echo "${XKB_OUTPUT}" | grep "layout" | awk -F ':' '{print $2}' | tr -d ' ')
VC_VARIANT=$(echo "${XKB_OUTPUT}" | grep "variant" | awk -F ':' '{print $2}' | tr -d ' ')

# Keymap has not been specific, so it's not configured properly
if [[ "${VC_KEYMAP}" == "" ]]; then
  exit 1
fi

if [[ "${VC_KEYMAP}" == "us" ]]; then
  echo "EN"
elif [[ "${VC_KEYMAP}" == "de" ]]; then
  echo "<span color=\"red\">DE</span>"
 fi
