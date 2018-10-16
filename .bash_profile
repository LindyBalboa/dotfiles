#
# ~/.bash_profile
#

#export KDE_FULL_SESSION=1
#export KDE_SESSION_VERSION=5

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx &> .startx.log
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
