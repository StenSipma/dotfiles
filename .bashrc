## Filename:	.bashrc
## Author:	Sten Sipma 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enables colors for some commands
alias ls='ls -N --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Tab completion
source /usr/share/bash-completion/bash_completion

complete -c man which
complete -cf sudo


## Prompt
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

# Alias for the pager I want to use
alias show=$PAGER

# Alias for the standard editor I want to use (e for 'edit')
alias e=$EDITOR


# Usefull back command alias
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'


# Usefull command to pair with longer running programs
# alert will show when to program is finished when used
# like this: $ ./long-program && alert
alias alert='i3-nagbar -t warning -m "Program finished"'

# Some shortcuts to often used directories
STUDY_DIR=$HOME/Documents/Study

alias study='cd $STUDY_DIR'
alias exam='cd $STUDY_DIR/Exam_Scheduling'
alias cg='cd $STUDY_DIR/Computer_Graphics'
alias os='cd $STUDY_DIR/Operating_Systems'
