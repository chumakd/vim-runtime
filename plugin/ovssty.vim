" Adaptation of Linuxsty plugin to OVS coding style
"
" Vim plugin to fit the Linux kernel coding style and help kernel development
" Maintainer:   Vivien Didelot <vivien.didelot@savoirfairelinux.com>
" License:      Distributed under the same terms as Vim itself.
"
" This script is inspired from an article written by Bart:
" http://www.jukie.net/bart/blog/vim-and-linux-coding-style
" and various user comments.
"
" For those who want to apply these options conditionally, you can define an
" array of patterns in your vimrc and these options will be applied only if
" the buffer's path matches one of the pattern. In the following example,
" options will be applied only if "/linux/" or "/kernel" is in buffer's path.
"
"   let g:ovssty_patterns = [ "/ovs/", "/kernel/" ]

if exists("g:loaded_ovssty")
    finish
endif
let g:loaded_ovssty = 1

set wildignore+=*.ko,*.mod.c,*.order,modules.builtin

augroup ovssty
    autocmd!

    autocmd FileType c,cpp call s:OvsConfigure()
    autocmd FileType diff setlocal ts=4
    autocmd FileType rst setlocal ts=4 sw=4 sts=4 et
    autocmd FileType kconfig setlocal ts=4 sw=4 sts=4 et
    autocmd FileType dts setlocal ts=4 sw=4 sts=4 et
augroup END

function s:OvsConfigure()
    let apply_style = 0

    if exists("g:ovssty_patterns")
        let path = expand('%:p')
        for p in g:ovssty_patterns
            if path =~ p
                let apply_style = 1
                break
            endif
        endfor
    else
        let apply_style = 1
    endif

    if apply_style
        call s:OvsCodingStyle()
    endif
endfunction

command! OvsCodingStyle call s:OvsCodingStyle()

function! s:OvsCodingStyle()
    call s:OvsFormatting()
    call s:OvsKeywords()
    call s:OvsHighlighting()
endfunction

function s:OvsFormatting()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal textwidth=80
    setlocal expandtab

    setlocal cindent
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:OvsKeywords()
    syn keyword cStatement fallthrough
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
    syn keyword cType __u8 __u16 __u32 __u64 __s8 __s16 __s32 __s64
endfunction

function s:OvsHighlighting()
    highlight default link OvsError ErrorMsg

    syn match OvsError / \+\ze\t/     " spaces before tab
    "syn match OvsError /\%>80v[^()\{\}\[\]<>]\+/ " virtual column 81 and more

    " Highlight trailing whitespace, unless we're in insert mode and the
    " cursor's placed right after the whitespace. This prevents us from having
    " to put up with whitespace being highlighted in the middle of typing
    " something
    "autocmd InsertEnter * match OvsError /\s\+\%#\@<!$/
    "autocmd InsertLeave * match OvsError /\s\+$/
endfunction

" vim: ts=4 et sw=4
