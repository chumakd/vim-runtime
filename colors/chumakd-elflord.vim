" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "elflord"
hi Normal		guifg=cyan			guibg=black
hi Comment	term=bold		ctermfg=DarkCyan		guifg=#80a0ff
hi Constant	term=underline	ctermfg=Magenta		guifg=Magenta
hi Special	term=bold		ctermfg=DarkMagenta	guifg=Red
hi Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=#40ffff
hi Statement term=bold		ctermfg=Yellow gui=bold	guifg=#aa4444
hi PreProc	term=underline	ctermfg=LightBlue	guifg=#ff80ff
hi Type	term=underline		ctermfg=LightGreen	guifg=#60ff60 gui=bold
hi Function	term=bold		ctermfg=White guifg=White
hi Repeat	term=underline	ctermfg=White		guifg=white
hi Operator				ctermfg=Red			guifg=Red
hi Ignore				ctermfg=black		guifg=bg
hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

if &t_Co == 256

hi Normal   ctermfg=LightGray    ctermbg=black		guifg=LightGray			guibg=black

hi StatusLine	cterm=NONE		ctermbg=LightGray		ctermfg=black
hi StatusLineNC	cterm=NONE		ctermbg=DarkGray		ctermfg=black

hi VertSplit	cterm=NONE		ctermbg=DarkGray		ctermfg=black

hi Title	                                            ctermfg=219
hi WarningMsg	                                        ctermfg=211
hi WildMenu	term=bold	ctermbg=96		ctermfg=White
"hi WildMenu	term=bold	ctermbg=130		ctermfg=White
hi MatchParen			ctermbg=Blue		ctermfg=LightGray

hi Folded	term=bold	ctermbg=black		ctermfg=Cyan	guifg=#80a0ff
hi FoldColumn	term=bold	ctermbg=black		ctermfg=Cyan	guifg=#80a0ff

"hi CursorLine	cterm=NONE	ctermbg=23     ctermfg=White
"hi CursorColumn	cterm=NONE	ctermbg=23     ctermfg=White
hi CursorLine	cterm=NONE	ctermbg=25     ctermfg=White
hi CursorColumn	cterm=NONE	ctermbg=25     ctermfg=White
"hi CursorLine	cterm=NONE	ctermbg=117     ctermfg=black
"hi CursorColumn	cterm=NONE	ctermbg=117     ctermfg=black

hi TabLine	cterm=NONE	ctermbg=235     ctermfg=White
hi TabLineFill	cterm=NONE	ctermbg=235     ctermfg=White
hi TabLineSel	cterm=bold	ctermbg=232     ctermfg=85

hi Pmenu		cterm=NONE	ctermbg=103     ctermfg=black
hi PmenuSel		cterm=NONE	ctermbg=97     ctermfg=White
"hi Pmenu		cterm=NONE	ctermbg=37     ctermfg=black
"hi PmenuSel		cterm=NONE	ctermbg=26     ctermfg=White

hi SpellBad								   ctermfg=White
hi SpellCap								   ctermfg=White
hi SpellRare								ctermfg=White
hi SpellLocal								ctermfg=darkgray

"hi Search                   ctermbg=227
hi Search                   ctermbg=172
"hi Search                   ctermbg=Cyan
"hi Search                   ctermbg=214
"hi Search                   ctermbg=208

hi Visual                   ctermbg=172     ctermfg=black

"hi link CursorLine CursorColumn
"hi link FoldColumn Folded

endif

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
