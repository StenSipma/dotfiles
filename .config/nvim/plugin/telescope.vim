" File:   lsp.vim
" Author: Sten Sipma (sten.sipma@ziggo.nl)
" Description:
"       (Neo)vim configuration file for the Telescope plugin

nnoremap <leader>ff <cmd>Telescope find_files<cr>
" Does not seem to work ? maybe is just permanently stuck
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fo <cmd>lua require'telescope.builtin'.vim_options()<cr>
nnoremap <leader>ft <cmd>lua require'telescope.builtin'.treesitter()<cr>
nnoremap <leader>fa <cmd>lua require'telescope.builtin'.lsp_code_actions()<cr>


lua require('telescope').setup(require'configs'.telescope_conf)
