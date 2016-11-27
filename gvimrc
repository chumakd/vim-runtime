" detect operating system
let s:os = substitute(system('uname'), "\n", '', '')

" system PATH
if s:os ==? 'Darwin'
    let $PATH = $HOME . '/bin:'
                \. $HOME . '/local_install/usr/lib/haskell/cabal/bin:'
                \. $HOME . '/local_install/usr/lib/python/bin:'
                \. $HOME . '/local_install/usr/lib/npm/bin:'
                \. $HOME . '/.gems/bin:'
                \. '/opt/local/libexec/gnubin:'
                \. '/opt/local/sbin:'
                \. '/opt/local/bin:'
                \. $PATH
endif

" window size
set columns=80
set lines=38

"
" GUI font

"set guifont=Luxi\ Mono\ 11
"set guifont=Courier\ 10\ pitch\ 11
"set guifont=Courier\ New\ 10
"set guifont=Fixedus\ 10
"set guifont=Terminus\ 10

if s:os ==? 'Darwin'
    set guifont=Input:h17
elseif s:os ==? 'Linux'
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif

"
" GUI options

" disable scrollbars
set guioptions -=l
set guioptions -=r

" disable left-hand scrollbar for vertically split window
set guioptions -=L

" disable right-hand scrollbar for vertically split window
set guioptions -=R

" disable toolbar
set guioptions -=T

" disable menu
set guioptions -=m

" use console dialogs instead of popup dialogs for simple choices.
set guioptions +=c

" disable gui tab line, use text tabline instead
set guioptions -=e

" disable cursor blinking
set guicursor+=a:blinkon0

" disable bell
set visualbell t_vb=

"
" color shceme

"colorscheme chumakd-desertEx
colorscheme solarized

" set different cursor color when local keymap is used
highlight lCursor guifg=NONE guibg=Cyan

"
" custom tabs label

function GuiTabLabel()
  let l:label = v:lnum
  let l:label .= ') '
  let l:bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for l:bufnr in l:bufnrlist
    if getbufvar(l:bufnr, '&modified')
      let l:label = '+'.l:label
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= l:wincount
  endif
  if l:label !=# ''
    let l:label .= ' '
  endif

  " Append the buffer name
  return l:label . pathshorten(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]))
endfunction

set guitablabel=%{GuiTabLabel()}
