## Filename:	.bashrc
## Author:	Sten Sipma 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enables colors for some commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
prompt_git() {
	unset PROMPT_GIT
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
		PROMPT_GIT=' [git]'
	fi
	echo "$PROMPT_GIT"
}

# New Prompt:
# username at hostname in directory
#export PS1='\u at \h in \W$(prompt_git)\n $ '
export PS1='\u at \h in \W\n $ '

# PS2 Is the prompt on an additional line
export PS2=' | '

# See `make-change-dir` for explanation
alias mkcd=". make-change-dir"


# Usefull back command alias
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'
