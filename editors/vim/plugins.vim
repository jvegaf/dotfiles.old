
"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = "c,html,javascript,lua,python,typescript"
let g:vim_bootstrap_editor = "vim"				" nvim or vim
let g:vim_bootstrap_theme = "onedark"
let g:vim_bootstrap_frams = ""

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'tpope/vim-rhubarb' " required by fugitive to :GBrowse
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasr/molokai'
Plug 'ku1ik/vim-monokai'
Plug 'machakann/vim-highlightedyank'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }


"Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'


if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" lua
"" Lua Bundle
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'


Plug 'jiangmiao/auto-pairs'
Plug 'schickling/vim-bufonly'

Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'

Plug 'RRethy/vim-illuminate'
Plug 'Yggdroot/indentLine'
Plug 'haya14busa/is.vim'
Plug 'sbdchd/neoformat'

Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'tpope/vim-repeat'

Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-surround'
Plug 'edkolev/tmuxline.vim'
Plug 'cespare/vim-toml'

Plug 'mbbill/undotree'


Plug 'Valloric/YouCompleteMe', {'do': './install.py ' . g:custom_ycm_install_options}

Plug 'hecal3/vim-leader-guide'

Plug 'junegunn/gv.vim'


Plug 'tpope/vim-endwise'


Plug 'elzr/vim-json'

if v:version < 901
  Plug 'GutenYe/json5.vim'
endif

Plug 'ekalinin/Dockerfile.vim'

Plug 'kevinhui/vim-docker-tools'

Plug 'sheerun/vim-polyglot'

"" vim-lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"*****************************************************************************
"*****************************************************************************


call plug#end()
