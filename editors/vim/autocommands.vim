"*********************************************************************
" Autocommands
"*********************************************************************

function! s:CloseWindowsAutomatically()
  if winnr('$') != 1
    return
  endif
  if (&buftype == 'quickfix' || (exists('b:NERDTree') && b:NERDTree.isTabTree()))
    q
  endif
endfunction

augroup CloseWindowsAutomatically
  autocmd!
  autocmd BufEnter * call s:CloseWindowsAutomatically()
augroup END

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\\e[ q"' | redraw!
endif
