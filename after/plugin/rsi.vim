" defaults to vim-rsi behavior, <C-z> toggles between vim-rsi and original one
inoremap <expr><C-e>  g:ictrle_orig<bar><bar>col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"
