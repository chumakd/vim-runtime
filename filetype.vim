" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.rul		setfiletype sh
  au! BufRead,BufNewFile *.def		setfiletype sh
  " force *.h files to be detected as C and not C++
  au! BufRead,BufNewFile *.h		setfiletype c
augroup END
