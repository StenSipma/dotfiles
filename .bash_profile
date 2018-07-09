## Filename: 	.bash_profile
## Author: 	Sten Sipma 

# If the .bashrc file exists and is a file (-f) 
# in $HOME directory execute it
[[ -f ~/.bashrc ]] && . ~/.bashrc

## Start the X session:
# (! $DISPLAY)      : If there is no current display (?)
# ($XDG_VTNR -eq 1) : If the VT number equals 1 (e.g. Ctrl+Alt+1 I think)
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
