#!/bin/bash
text=$(pactl list sinks);
mute=$(echo "$text" | grep Mute | awk '{print $2}')
if [ $mute == "yes" ]; then
		echo \${color red}M\${color};
fi

