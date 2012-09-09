" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " ipmasq rules
  au! BufRead,BufNewFile *.rul          setfiletype sh
  au! BufRead,BufNewFile *.def          setfiletype sh
  " force *.h files to be detected as C and not C++
  au! BufRead,BufNewFile *.h            setfiletype c
  " change type of *.patch files to 'git', because
  " it's more sophisticated (folds changes on file basis)
  au! BufRead,BufNewFile *.patch        setfiletype git
  " Colibri FOP declaration files
  au! BufRead,BufNewFile Makefile.ff    setfiletype make
  au! BufRead,BufNewFile *.ff           setfiletype c
  " tmux config files
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf*     setfiletype tmux
augroup END
