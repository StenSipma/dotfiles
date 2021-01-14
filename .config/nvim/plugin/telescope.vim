" Find files using Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
noremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
        defaults = {
                prompt_prefix = " 🔭",
                file_ignore_patterns = { 
                        ".env",
                        "*.egg-info",
                        "vplugged",
                        "__pycache__/",
                }
        }
}
EOF
