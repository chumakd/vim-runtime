" detect operating system
let s:os = substitute(system('uname'), "\n", "", "")

" window size
set columns=128
set lines=35

"
" GUI font

"set guifont=Luxi\ Mono\ 11
"set guifont=Courier\ 10\ pitch\ 11
"set guifont=Courier\ New\ 10
"set guifont=Fixedus\ 10
"set guifont=Terminus\ 10

if s:os == "Darwin"
    set guifont=Input:h18
elseif s:os == "Linux"
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
set vb t_vb=

"
" color shceme

"colorscheme chumakd-desertEx
colorscheme solarized

" set different cursor color when local keymap is used
highlight lCursor guifg=NONE guibg=Cyan

"
" custom tabs label

function GuiTabLabel()
  let label = v:lnum
  let label .= ') '
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'.label
      break
    endif
  endfor

  " Append the number of windows in the tab page if more than one
  let wincount = tabpagewinnr(v:lnum, '$')
  if wincount > 1
    let label .= wincount
  endif
  if label != ''
    let label .= ' '
  endif

  " Append the buffer name
  return label . pathshorten(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]))
endfunction

set guitablabel=%{GuiTabLabel()}
