## Filename:	.bashrc
## Author:	Sten Sipma 

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###################
## Bash Features ##
###################

## Options

# Enable vi mode for bash (activated by ESC)
#set -o vi

## Bash Tab completion
source /usr/share/bash-completion/bash_completion  # other package
source $HOME/.config/bash-completion/bash_completion  # own commands

complete -c man which # enable completion for these commands
complete -cf sudo


############
## Prompt ##
############

# Attempt to show some git specific things in the prompt
prompt_git() {
	unset PROMPT_GIT
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
		PROMPT_GIT=' [git]'
	fi
	echo "$PROMPT_GIT"
}

## Normal prompt for the terminal at the beginning 
#   of each command. It looks like where "[]" is the prompt:
##
#  [username] at [hostname] in [current_dirname] 
#   $ []
##
export PS1='\u at \h in \W\n $ '
#export PS1='\u at \h in \W$(prompt_git)\n $ '

# Sets the prompt for when a command is specified on more
# than one line (e.g. by using \ or not closing a quote etc.)
export PS2=' | '


#############
## Aliases ##
#############

alias nvim='nvim -u $XDG_CONFIG_HOME/nvim/init.vim'

## Enables colors for some commands
# for ls: -N	Prints the name without quotes
alias ls='ls -N --color=always --group-directories-first'
alias grep='grep --color=always'
# NOTE: Option --color=always may cause some issues when
# it is used in further processing.
# if so, use switch `always` to `auto`. This allowes color
# only to be displayed when the output is stdout.


## See `make-change-dir` for explanation
alias mkcd=". make-change-dir"

## Easier virtual environment activation
alias vactivate=". .env/bin/activate"

## Aliases for some standard programs (set in .bash_profile)
# p for Pager (e.g. less, more etc.)
# e for Editor for quick modifications
alias p=$PAGER
alias e=$EDITOR

alias bt='bluetoothctl'

# Usefull back command alias
alias cd.='cd ../'
alias cd..='cd ../../'
alias cd...='cd ../../../'
alias cd....='cd ../../../../'
alias cd.....='cd ../../../../../'

# Jupyter Notebook alias
alias jn='jupyter notebook'

# Usefull command to pair with longer running programs
# alert will show when to program is finished when used
# like this: $ ./long-program && alert
alias alert='i3-nagbar -t warning -m "Program finished"'

# Some shortcuts to often used directories
DOCS_DIR=$HOME/Documents
STUDY_DIR=$DOCS_DIR/Study
TA_DIR=$DOCS_DIR/TeachingAssistant
PROJECTS_DIR=$DOCS_DIR/Projects

alias study='cd $STUDY_DIR'
alias pac='cd $DOCS_DIR/Projects/PracticalAstronomyCrew'
alias ta='cd $TA_DIR'
alias cw='cd $PROJECTS_DIR/CosmicWeb'

alias oa='cd $STUDY_DIR/Observational_Astronomy'
alias anc='cd $PROJECTS_DIR/PracticalAstronomyCrew/astrometry_net_client'

## Tomcat directory
export CATALINA_HOME=/usr/share/tomcat8

## Python Virtual Environment Directory
# This is used by `virtualenvwrapper`
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source ~/.local/bin/virtualenvwrapper.sh
