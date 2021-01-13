" File:   init.vim
" Author: Sten Sipma (sten.sipma@ziggo.nl)
" Description:
"      Main Neovim configuration file which includes the Vim Plug installs and
"      some key bindings at the end. This file will be run before all the other
"      files in ./plugin are run.

" Set the leader key to the spacebar. This leader key can be used for
" custom keybindings. Use: <leader> to access this key.
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN INSTALLATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uses Vim Plug as a plugin manager. To install, run the following command in
" the terminal:
"
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
" TODO: add an install script at the beginnin of this file which installs vim
"       plug automatically
call plug#begin(stdpath("config") . "/vplugged")
	" General:
        " Easy Align
	Plug 'junegunn/vim-easy-align'

	" Color Themes:
        " OceanicNext theme
	Plug 'mhartington/oceanic-next' 

        " Does not work for the current version. (use nightly build)
        " Completion:
        "Plug 'neovim/nvim-lspconfig'

        " File Management:
        "Plug 'nvim-lua/popup.nvim'
        "Plug 'nvim-lua/plenary.nvim'
        "Plug 'nvim-telescope/telescope.nvim'

call plug#end()
" plug#end already sets: 
"       filetype plugin indent on
"       syntax enable
" So we do not need to set these after.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY BINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Insert Mode:
" Alternative exit from insert mode
inoremap fd <esc>

"" Normal Mode:
" Yank to the clipboard (can add movement key after this ?)
nnoremap <leader>y "+y

" Move directly up in the terminal. Only affects movement when lines are
" wrapped around
"nnoremap j gj
"nnoremap k gk

" Cylce between buffers with SPC+Tab
nnoremap <leader><Tab> :bnext<CR>
" Get a list of buffers (:ls) and enter a number to go to that buffer.
nnoremap <leader>b :ls<CR>:b<space>
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" Save & Source the current file
" TODO: only activate this in the vimrc file ?
nnoremap <leader>ss :w<CR>:source %<CR>

"" Visual Mode:
" Yank to the clipboard (can add movement key after this ?)
xnoremap <leader>c "+y
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
