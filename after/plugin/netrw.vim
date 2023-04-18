" disable netrw gx to prevent accidental file execution as it's used for
" comments plugin in nvim and can be done just habitually and unintentionally
" in vim which doesn't have that nvim specific plugin
if !has('nvim')
    unmap gx
endif
