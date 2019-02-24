"" File:   .vimrc
"" Author: Sten Sipma
"" Description:
"   This file is executed when vim starts, configuring vim userwide

" Display line numbers (normal: number, relative: relativenumber)
"set number
set relativenumber

" Sets the indentation for a newly inserted line to be the same
" as the current line.
set autoindent

" Enable syntax highlighting
syntax on

" Set highlight searches (C-L to temporaraly turn off)
set hlsearch
nnoremap <C-L> :nohl<CR><C-L>

