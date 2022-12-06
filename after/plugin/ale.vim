if exists('g:loaded_ale')
    hi! link ALEErrorSign DiffDelete
    hi! link ALEWarningSign DiffChange
    hi! link ALEError WarningMsg
    hi! link ALEWarning SpellLocal

    " default
    set omnifunc=ale#completion#OmniFunc

    " override filetype specific options that can be changed by other plugins
    augroup ale_omni
        autocmd!
        autocmd! FileType c,cpp setlocal omnifunc=ale#completion#OmniFunc
    augroup end
endif
