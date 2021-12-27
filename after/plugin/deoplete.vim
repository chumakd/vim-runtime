if exists('g:loaded_deoplete')
    " Enable omni completion.
    augroup deoplete_omni
        autocmd!
        autocmd! FileType c,cpp setlocal omnifunc=ale#completion#OmniFunc
    augroup end
endif
