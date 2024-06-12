#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

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

# xrandr --output eDP-1 --scale 0.5
# xrandr --output DP-1 --above eDP-1 
# xrandr --output DP-3 --right-of eDP-1

if [ -z "$session" ]; then
    exec cinnamon-session
elif [ "$session" = "xfce" ]; then
    exec startxfce4
elif [ "$session" = "awesome" ]; then
    exec awesome
elif [ "$session" = "cinnamon" ]; then
    exec cinnamon-session
elif [ "$session" = "i3" ]; then
    exec i3
elif [ "$session" = "leftwm" ]; then
    exec leftwm
fi

