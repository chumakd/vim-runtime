if exists('g:loaded_denite') && v:version >= 800
    " change default prompt
    call denite#custom#option('default', 'prompt', '>')
endif
