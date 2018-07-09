## Filename:	.bashrc
## Author:	Sten Sipma 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enables colors for some commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt: 
# [username@hostname directory]$ 
PS1='[\u@\h \W]\$ '
