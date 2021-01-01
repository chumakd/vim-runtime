if exists('g:loaded_neocomplete')
    " Enable omni completion.
    augroup neocomplete_omni
        autocmd!
        autocmd! FileType c,cpp setlocal omnifunc=ale#completion#OmniFunc
        "autocmd! FileType c,cpp setlocal omnifunc=ClangComplete
        autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        " TernJS from tern_for_vim plugin provides a better completion, use it if available
        autocmd! FileType javascript if &omnifunc !~ '^tern' | setlocal omnifunc=javascriptcomplete#CompleteJS | endif
        autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd! FileType rust setlocal omnifunc=ale#completion#OmniFunc
        autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup end

    " close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
endif
