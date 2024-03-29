" my filetype file

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au!
  " ipmasq rules
  au! BufRead,BufNewFile *.rul          setfiletype sh
  au! BufRead,BufNewFile *.def          setfiletype sh
  " force *.h files to be detected as C and not C++
  au! BufRead,BufNewFile *.h            setfiletype c
  " change type of *.patch files to 'git', because
  " it's more sophisticated (folds changes on file basis)
  au! BufRead,BufNewFile *.patch        setfiletype git
  " OVS include makefiles
  au! BufRead,BufNewFile automake.mk    setfiletype automake
  " linux kernel makefiles
  au! BufRead,BufNewFile Kbuild,Kbuild.sub setfiletype make
  " Colibri FOP declaration files
  au! BufRead,BufNewFile Makefile.ff    setfiletype make
  au! BufRead,BufNewFile *.ff           setfiletype c
  " fio config files
  au! BufRead,BufNewFile *.fio          setfiletype dosini
  " tmux config files
  au! BufRead,BufNewFile .tmux.conf*,tmux.conf*     setfiletype tmux
  " markdown
  au! BufRead,BufNewFile *.psgi         setfiletype perl
augroup END

" treat dash symbol '-' a part of a keyword for auto-completion
augroup dash_keywords
    autocmd!
    autocmd! FileType  css,haml,html,json,sass,scss,yaml  setlocal iskeyword+=-
augroup end

" set comment format without space after comment symbol
augroup comment_string
    autocmd!
    autocmd! FileType  erb,haml,ruby,perl,python,sh,toml,yaml  setlocal commentstring=#%s
    autocmd! FileType  javascript,sass,scss  setlocal commentstring=//%s
augroup end
