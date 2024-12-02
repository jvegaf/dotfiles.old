"*********************************************************************
" Functions
"*********************************************************************

function! HasFeatures()
  return has('timers') && exists('*job_start') && exists('*ch_close_in')
endfunction

function! IsLinux()
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction

function! IsMac()
  return has('macunix')
endfunction

function! IsWindows()
  return has('win32') || has('win64')
endfunction

function! TrySource(filepath)
  if filereadable(a:filepath)
    execute 'source' fnameescape(a:filepath)
  endif
endfunction

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif


function! s:CloseWindowsAutomatically()
  if winnr('$') != 1
    return
  endif
  if (&buftype == 'quickfix' || (exists('b:NERDTree') && b:NERDTree.isTabTree()))
    q
  endif
endfunction


