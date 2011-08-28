" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.rul		setfiletype sh
  au! BufRead,BufNewFile *.def		setfiletype sh
augroup END
