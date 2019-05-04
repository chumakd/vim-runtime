if exists('g:loaded_emmet_vim')
    augroup emmet_file_types
        autocmd!
        autocmd! FileType  haml,html,css,sass,scss,xml  EmmetInstall
    augroup end
endif
