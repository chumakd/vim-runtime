" disable mappings for Vim, Nvim remaps those for LSP error navigation
if exists('g:loaded_unimpaired')
    xunmap [e
    xunmap ]e
    if !has('nvim')
        unmap [e
        unmap ]e
    endif
endif
