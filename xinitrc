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

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# my custom keyboard remapping
# Ctrl position:
#  ctrl:swap_lalt_lctl_lwin - Left Alt as Ctrl, Left Ctrl as Win, Left Win as Left Alt
# Position of Compose key:
#  compose:caps - Caps Lock
# Alt/Win key behavior:
#  altwin:ctrl_alt_win - Ctrl is mapped to Alt; Alt is mapped to Win

#setxkbmap -option compose:caps \
#	  -option altwin:ctrl_alt_win

/usr/local/bin/stumpwm
