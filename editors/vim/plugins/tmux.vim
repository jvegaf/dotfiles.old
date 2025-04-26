"***************************************************
" https://github.com/christoomey/vim-tmux-navigator
"***************************************************
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
nnoremap <silent> <c-\\> :<C-U>TmuxNavigatePrevious<cr>

Plug "christoomey/vim-tmux-navigator"
