set nocompatible

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8
set ttyfast
set autoread
set completeopt=menuone

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '
let maplocalleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number
set relativenumber
set showcmd

" Don’t reset cursor to start of line when moving around
set nostartofline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

let no_buffers_menu=1
" colorscheme onedark
colorscheme molokai
set background=dark


" Better command line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys


set directory=~/.vim/swaps
set undodir=~/.vim/undo
set undofile

" mouse support
set mouse=a

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = ''
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif


"" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=3


"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let g:gitgutter_map_keys = get(g:, 'gitgutter_map_keys', 0)


let g:codeium_disable_bindings = 1

let g:cpp_class_scope_highlight = get(g:, 'cpp_class_scope_highlight', 1)
let g:cpp_class_decl_highlight = get(g:, 'cpp_class_decl_highlight', 1)
let g:cpp_no_function_highlight = get(g:, 'cpp_no_function_highlight', 1)

let g:AutoPairsMapSpace = get(g:, 'AutoPairsMapSpace', 0)



let g:closetag_emptyTags_caseSensitive =
      \ get(g:, 'g:closetag_emptyTags_caseSensitive', 1)
let g:closetag_filetypes =
      \ get(g:, 'closetag_filetypes', 'html,xhtml,phtml,javascript.jsx,typescript.tsx')


let g:Illuminate_delay = get(g:, 'Illuminate_delay', 250)
let g:Illuminate_ftblacklist = get(g:, 'Illuminate_ftblacklist', ['nerdtree'])


let g:NERDDefaultAlign = get(g:, 'NERDDefaultAlign', 'left')


let g:sneak#label = get(g:, 'sneak#lable', 1)
let g:sneak#use_ic_scs = get(g:, 'sneak#use_ic_scs', 1)


let g:undotree_WindowLayout = get(g:, 'undotree_WindowLayout', 4)

"" youcompleteme

let g:ycm_key_list_select_completion =
      \ get(g:, 'ycm_key_list_select_completion', ['<TAB>', '<Down>'])
let g:ycm_key_list_previous_completion =
      \ get(g:, 'ycm_key_list_previous_completion', ['<S-TAB>', '<Up>'])
let g:ycm_auto_trigger =
      \ get(g:, 'ycm_auto_trigger', 1)
let g:ycm_autoclose_preview_window_after_insertion =
      \ get(g:, 'ycm_autoclose_preview_window_after_insertion', 1)
let g:ycm_seed_identifiers_with_syntax =
      \ get(g:, 'ycm_seed_identifiers_with_syntax', 1)
let g:ycm_collect_identifiers_from_comments_and_strings =
      \ get(g:, 'ycm_collect_identifiers_from_comments_and_strings', 1)
let g:ycm_python_binary_path =
      \ get(g:, 'ycm_python_binary_path', 'python')
let g:ycm_show_diagnostics_ui =
      \ get(g:, 'ycm_show_diagnostics_ui', 0)
let g:ycm_key_detailed_diagnostics =
      \ get(g:, 'ycm_key_detailed_diagnostics', '')
let g:ycm_semantic_triggers = get(g:, 'ycm_semantic_triggers', {
      \ 'c': ['->', '.', 're!\w{3}'],
      \ 'cpp': ['->', '.', '::', 're!\w{3}'],
      \ 'cs' : ['.', 're!\w{3}'],
      \ 'cuda': ['->', '.', '::', 're!\w{3}'],
      \ 'd' : ['.', 're!\w{3}'],
      \ 'elixir' : ['.', 're!\w{3}'],
      \ 'erlang': [':'],
      \ 'go' : ['.', 're!\w{3}'],
      \ 'java' : ['.', 're!\w{3}'],
      \ 'javascript' : ['.', 're!\w{3}'],
      \ 'javascript.jsx' : ['.', 're!\w{3}'],
      \ 'lua': ['.', ':'],
      \ 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
      \ 'objcpp': ['->', '.', '::', 're!\w{3}'],
      \ 'ocaml': ['.', '#'],
      \ 'perl': ['->'],
      \ 'perl6' : ['.', 're!\w{3}'],
      \ 'php': ['->', '::'],
      \ 'python' : ['.', 're!\w{3}'],
      \ 'ruby': ['.', '::'],
      \ 'rust': ['.', '::'],
      \ 'scala' : ['.', 're!\w{3}'],
      \ 'sh': ['re![\w-]{2}', '/', '-'],
      \ 'typescript' : ['.', 're!\w{3}'],
      \ 'typescript.tsx' : ['.', 're!\w{3}'],
      \ 'vb' : ['.', 're!\w{3}'],
      \ 'vim': ['re![_a-zA-Z]+[_\w]*\.'],
      \ 'zsh': ['re![\w-]{2}', '/', '-'],
      \ })
let g:ycm_filetype_whitelist = get(g:, 'ycm_filetype_whitelist', {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'go': 1,
      \ 'java': 1,
      \ 'javascript': 1,
      \ 'javascript.jsx': 1,
      \ 'python': 1,
      \ 'rust': 1,
      \ 'sh': 1,
      \ 'typescript': 1,
      \ 'typescript.tsx': 1,
      \ 'vim': 1,
      \ 'zsh': 1,
      \ })
let g:ycm_extra_conf_globlist = get(g:, 'ycm_extra_conf_globlist', [
      \ '~/*',
      \ ])
let g:custom_ycm_install_options = '--clangd-completer --java-completer  --ts-completer'


function! s:leader_guide_display_func()
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '#', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<SID>', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
  let g:leaderGuide#displayname = substitute(g:leaderGuide#displayname, ':call ', '', '')
endfunction

if exists('g:leaderGuide_displayfunc')
  call add(g:leaderGuide_displayfunc, function('s:leader_guide_display_func'))
else
  let g:leaderGuide_displayfunc = [function('s:leader_guide_display_func')]
endif


let g:vim_json_syntax_conceal = get(g:, 'vim_json_syntax_conceal', 0)


let g:dockertools_default_all = get(g:, 'dockertools_default_all', 1)
let g:dockertools_sudo_mode  = get(g:, 'dockertools_sudo_mode', 0)
let g:dockertools_docker_cmd = get(g:, 'dockertools_docker_cmd', 'docker')

filetype plugin indent on


" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
" let g:airline_theme = 'powerlineish'
let g:airline_theme = 'molokai'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
let NERDTreeQuitOnOpen=1
let NERDTreeCaseSensitiveSort=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'



"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e


"" fzf.vim
" Enable search capabilities if possible
if executable('rg')
    nnoremap <C-T> :Rg<Space>
elseif executable('ag')
    nnoremap <C-T> :Ag<Space>
end

" Settings
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" It doesn't read the env vars?
" let $BAT_THEME="ansi"

if empty($TMUX)
    " We are not inside tmux
    let g:fzf_layout = {'window': { 'width': 0.7, 'height': 0.6, 'yoffset': 0.2 } }
    let g:fzf_preview_window = 'right:40%'
else
    "We are inside tmux, let's leverage it!
    let g:fzf_layout = {'tmux': '-p70%,60%'}
end

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
let g:tagbar_autofocus = 1


" Use the OS clipboard by default
" if has('clipboard')
"   if has('unnamedplus')
"     set clipboard=unnamed,unnamedplus
"   else
"     set clipboard=unnamed
"   endif
" endif

set clipboard=unnamedplus


" javascript
let g:javascript_enable_domhtmlcss = 1


" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
let python_highlight_all = 1


" typescript
let g:yats_host_keyword = 1


"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


"" vim-lsp

let g:asyncomplete_auto_completeopt = 0

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1

let g:lsp_completion_documentation_enabled = 1
let g:lsp_completion_documentation_delay = 1000

" Move notification messages to the right
let g:lsp_diagnostics_virtual_text_enabled=0

" Gutter symbols
let g:lsp_document_code_action_signs_enabled = 1
let g:lsp_document_code_action_signs_hint = {'text': '→'}
let g:lsp_diagnostics_signs_error = {'text': '⨉'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_signs_info = {'text': 'ℹ'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}
let g:lsp_diagnostics_signs_insert_mode_enabled=0 " Please don't bother me while I type

" Folding
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gA <plug>(lsp-code-action-float)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


