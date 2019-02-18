#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

/usr/lib/xfce4/notifyd/xfce4-notifyd & disown

# Set keyboard repeat delay and rate 
xset r rate 200 15

export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_PLUGIN_PATH=
#KDE_FULL_SESSION=1
#export KDE_FULL_SESSION
##xprop -root -f KDE_FULL_SESSION 8t -set KDE_FULL_SESSION true
#
#KDE_SESSION_VERSION=5
#export KDE_SESSION_VERSION
##xprop -root -f KDE_SESSION_VERSION 32c -set KDE_SESSION_VERSION 5
#
#KDE_SESSION_UID=`id -ru`
#export KDE_SESSION_UID



alsactl restore -f ~/.alsa.state
#conky &
/usr/local/bin/randomwallpaper
kupfer --no-splash &
xflux -l 51.0504 -g 13.7373 -k 2400 &
xset -b
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
xbindkeys
qtpad &
udiskie -vN --tray &
nm-applet &
#emacs --daemon & 
dolphin --daemon &
mpd ~/.config/mpd/mpd.config &
exec i3 --shmlog-size=26214400
