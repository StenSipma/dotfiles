" File:   lsp.vim
" Author: Sten Sipma (sten.sipma@ziggo.nl)
" Description:
"       (Neo)vim configuration file for all LSP (Language Server Protocol)
"       configurations.

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" General Keybindings:
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Jump to definition
nnoremap gd        :lua vim.lsp.buf.definition()<CR>
" List references
nnoremap gr        :lua vim.lsp.buf.references()<CR>
" Rename on cursor
nnoremap <space>rn :lua vim.lsp.buf.rename()<CR>

" augroup MY_LSP_GROUP
"         au!
"         autocmd BufWrite *.py :lua vim.lsp.buf.formatting_sync(nil, 1000)
" augroup END

" LSP Server Setups:
" Python (pyls)
lua require'lspconfig'.pyls.setup( require'configs'.pylsconf )
