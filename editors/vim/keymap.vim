execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"
execute "set <M-f>=\ef"
execute "set <M-x>=\ex"
execute "set <M-w>=\ew"

nmap <silent> ]g :GitGutterNextHunk<CR>
nmap <silent> [g :GitGutterPrevHunk<CR>

imap <script><silent><nowait><expr> <M-f> codeium#Accept()
imap <script><silent><nowait><expr> <M-w> codeium#AcceptNextWord()
imap <script><silent><nowait><expr> <M-l> codeium#AcceptNextLine()
imap <M-j>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-k>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <M-x>   <Cmd>call codeium#Clear()<CR>



nnoremap <Leader>bo :BufOnly<CR>



nnoremap gq :Neoformat<CR>
vnoremap gq :Neoformat<CR>


map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


nnoremap <Leader>tu :TagbarClose<CR>:UndotreeToggle<CR>


nnoremap <Leader>jc :YcmCompleter GoToInclude<CR>
nnoremap <Leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>ji :YcmCompleter GoToImplementation<CR>
nnoremap <Leader>jj :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>jt :YcmCompleter GoToType<CR>

nnoremap <LocalLeader>K :YcmCompleter GetDoc<CR>
nnoremap <LocalLeader>k :YcmCompleter GetType<CR>


map <Leader>. <Plug>leaderguide-global
nnoremap <silent> <Leader> :LeaderGuide mapleader<CR>
vnoremap <silent> <Leader> :LeaderGuideVisual mapleader<CR>

" if mapleader != maplocalleader
"   map <LocalLeader>. <Plug>leaderguide-buffer
"   nnoremap <silent> <LocalLeader> :LeaderGuide  maplocalleader<CR>
"   vnoremap <silent> <LocalLeader> :LeaderGuideVisual  maplocalleader<CR>
" endif



" Open commit browser
nnoremap <Leader>gV :GV<Space>
" List commits that affected the current file
nnoremap <Leader>gv :GV!<CR>
vnoremap <Leader>gv :GV!<CR>


nnoremap <Leader>td :DockerToolsToggle<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

nmap <silent> [t <Plug>AirlineSelectPrevTab
nmap <silent> ]t <Plug>AirlineSelectNextTab
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap <silent> <leader>fe :NERDTreeFind<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>fg :Rgrep<CR>
" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> W :w<cr>
nnoremap <silent> Q :bdelete<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>E :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <ESC>  :nohlsearch<bar>:echo<cr>


cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>u :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


"" Buffer nav
" noremap <leader>z :bp<CR>
noremap <leader>q :q<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap W :w<CR>
noremap Q :bd<CR>

nnoremap vv V

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv


"" Move
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
"" Open current line on GitHub
nnoremap <Leader>o :.GBrowse<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nmap <Leader>, :Files<CR>
nmap <Leader>; :Buffers<CR>

" Syntax often gets messed up on files with multiple languages
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>


function! s:internet_search(q)
  let url ='https://www.google.com/search?q=%s'
  let q = substitute(a:q, '["\n]', ' ', 'g')
  let q = substitute(q, '[[:punct:] ]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  let open = IsLinux() ? 'xdg-open' : 'open'
  call system(printf(open . ' "' . url . '"', q))
endfunction

"" web search
nnoremap <silent> <Leader>se :call <SID>internet_search(expand('<cWORD>'))<CR>
xnoremap <silent> <Leader>se "gy:call <SID>internet_search(@g)<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)
