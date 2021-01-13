" File:   autocommands.vim
" Author: Sten Sipma (sten.sipma@ziggo.nl)
" Description:
"       (Neo)vim configuration file for all autocommand settings. Make sure to
"       add a autocmd! at the beginning of each group to clear all the
"       previous autocmd settings from within the group.

" Turns hlsearch on briefly while searching, turns it off after
augroup vimrc_incsearch_highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


