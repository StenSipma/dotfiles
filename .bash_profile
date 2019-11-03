#!/bin/bash
## Filename: 	.bash_profile
## Author: 	Sten Sipma

# If the .bashrc file exists and is a file (-f)
# in $HOME directory execute it
#[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add local bin folders to path
PATH=~/.local/bin:$PATH
PATH=~/bin:$PATH

# Set some default applications
export BROWSER="firefox"
export TERMINAL="urxtv"
export MAIL_READER="thunderbird"
export IDE="emacs"
export EDITOR="vim"
export PAGER="less"
export IMAGE_VIEWER="sxiv"
export PRINTER="DCPJ515W"

export LESS="--raw-control-chars"

# Set the QT theme
export QT_QPA_PLATFORMTHEME=qt5ct

## Start the X session:
# (! $DISPLAY)      : If there is no current display (?)
# ($XDG_VTNR -eq 1) : If the VT number equals 1 (e.g. Ctrl+Alt+1 I think)
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
