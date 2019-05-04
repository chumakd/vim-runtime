if exists('g:loaded_unite')
    " enable fuzzy matching by default
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
endif
