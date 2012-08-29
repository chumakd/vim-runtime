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

hi StatusLine	cterm=NONE		ctermbg=235		ctermfg=White
"hi StatusLine	cterm=NONE		ctermbg=LightGray		ctermfg=black
hi StatusLineNC	cterm=NONE		ctermbg=DarkGray		ctermfg=black

hi VertSplit	cterm=NONE		ctermbg=DarkGray		ctermfg=black

hi Directory                                            ctermfg=45
hi Title	                                            ctermfg=213
hi WarningMsg	                                        ctermfg=211

hi WildMenu	cterm=bold	ctermbg=232		ctermfg=41
"hi WildMenu	cterm=bold	ctermbg=148		ctermfg=233
"hi WildMenu	cterm=bold	ctermbg=235		ctermfg=White
"hi WildMenu	term=bold	ctermbg=96		ctermfg=White
"hi WildMenu	term=bold	ctermbg=130		ctermfg=White

hi MatchParen			ctermbg=Blue		ctermfg=LightGray

" Folds ----------------------------------------------------------------- {{{2
"
"hi Folded	term=bold	ctermbg=NONE		ctermfg=Cyan	guifg=#80a0ff
"hi FoldColumn	term=bold	ctermbg=NONE		ctermfg=Cyan	guifg=#80a0ff
hi Folded	term=bold	ctermbg=NONE		ctermfg=243	guifg=#80a0ff
hi FoldColumn	term=bold	ctermbg=NONE		ctermfg=243	guifg=#80a0ff

" VimDiff --------------------------------------------------------------- {{{2
"
"hi DiffAdd	    cterm=NONE		ctermbg=122     ctermfg=22
hi DiffAdd	    cterm=NONE		ctermbg=122     ctermfg=235
hi DiffDelete	cterm=NONE		ctermbg=182     ctermfg=176
hi DiffChange	cterm=NONE		ctermbg=69     ctermfg=17
hi DiffText	    cterm=NONE		ctermbg=178     ctermfg=234
"hi DiffText	    cterm=bold		ctermbg=63     ctermfg=17

"hi DiffAdd	    cterm=NONE		ctermbg=72     ctermfg=234
"hi DiffDelete	cterm=NONE		ctermbg=145     ctermfg=139
"hi DiffChange	cterm=NONE		ctermbg=67     ctermfg=234
"hi DiffText	    cterm=NONE		ctermbg=178     ctermfg=234
""hi DiffText	    cterm=bold		ctermbg=61     ctermfg=17
""hi DiffText	    cterm=bold		ctermbg=67     ctermfg=227

" Pmenu ----------------------------------------------------------------- {{{2
"
hi Pmenu		cterm=NONE	ctermbg=103     ctermfg=black
hi PmenuSel		cterm=NONE	ctermbg=97     ctermfg=White
"hi Pmenu		cterm=NONE	ctermbg=37     ctermfg=black
"hi PmenuSel		cterm=NONE	ctermbg=26     ctermfg=White
hi PmenuSbar								ctermfg=black

" Spell ----------------------------------------------------------------- {{{2
hi SpellBad				ctermbg=124				   ctermfg=White
hi SpellCap				ctermbg=25				   ctermfg=White
hi SpellRare								ctermfg=White
hi SpellLocal			ctermbg=44					ctermfg=black

" Tabline --------------------------------------------------------------- {{{2
"
hi TabLine	cterm=NONE	ctermbg=235     ctermfg=White
hi TabLineFill	cterm=NONE	ctermbg=235     ctermfg=White
"hi TabLineSel	cterm=bold	ctermbg=232     ctermfg=85
hi TabLineSel	cterm=bold	ctermbg=232     ctermfg=41

" Cursor ---------------------------------------------------------------- {{{2
"
"hi CursorLine	cterm=NONE	ctermbg=23     ctermfg=White
"hi CursorColumn	cterm=NONE	ctermbg=23     ctermfg=White

"hi CursorLine	cterm=NONE	ctermbg=25     ctermfg=White
"hi CursorColumn	cterm=NONE	ctermbg=25     ctermfg=White

"hi CursorLine	cterm=NONE	ctermbg=117     ctermfg=black
"hi CursorColumn	cterm=NONE	ctermbg=117     ctermfg=black

hi CursorLine	cterm=NONE	ctermbg=237     ctermfg=White
hi CursorColumn	cterm=NONE	ctermbg=237     ctermfg=White

" Search ---------------------------------------------------------------- {{{2
"
"hi Search                   ctermbg=227
hi Search                   ctermbg=172
"hi Search                   ctermbg=Cyan
"hi Search                   ctermbg=214
"hi Search                   ctermbg=208

" Visual ---------------------------------------------------------------- {{{2
"
"hi Visual                   ctermbg=172     ctermfg=black
hi Visual                   ctermbg=247     ctermfg=black

" Code ------------------------------------------------------------------ {{{2
"

" default value for Comment is 6 (cyan)
hi Comment        cterm=NONE                ctermfg=30
"hi Comment        cterm=NONE                ctermfg=241

hi Identifier     cterm=NONE
hi Special        cterm=NONE                ctermfg=89
"hi PreProc        cterm=NONE                ctermfg=45
hi PreProc        cterm=NONE                ctermfg=32
hi Type        cterm=NONE                   ctermfg=48
"hi PreCondit        cterm=NONE                   ctermfg=210
hi PreCondit        cterm=NONE                   ctermfg=174

" User ------------------------------------------------------------------ {{{2
"
"hi! link User1 TabLineSel
"hi! link User2 TabLine
"hi User1        ctermfg=213
"hi User2        ctermfg=213

"hi! link User3 TabLineSel
"hi! link User4 TabLine
"hi User3        ctermfg=160
"hi User4        ctermfg=160

hi User1	cterm=bold	ctermbg=232     ctermfg=213
hi User2	cterm=NONE	ctermbg=235     ctermfg=213

hi User3	cterm=bold	ctermbg=232     ctermfg=160
hi User4	cterm=NONE	ctermbg=235     ctermfg=160

" Other ----------------------------------------------------------------- {{{2
"
"hi Error        cterm=NONE   ctermbg=196             ctermfg=White
hi Error        cterm=NONE   ctermbg=124             ctermfg=White
hi lCursor        cterm=NONE   ctermbg=51             ctermfg=black

" Plugins --------------------------------------------------------------- {{{2
"
hi ShowMarksHLdefault	    cterm=NONE   ctermbg=26					ctermfg=White

hi!  link ShowMarksHLl	 ShowMarksHLdefault
hi!  link ShowMarksHLu	 ShowMarksHLdefault
hi!  link ShowMarksHLo	 ShowMarksHLdefault
hi!  link ShowMarksHLm	 ShowMarksHLdefault
hi!  link ShowMarksHLlz    ShowMarksHLdefault

" this color groups already have settings so we need to use ! to override them
" otherwise they will not have any effect
"hi! link CursorLine CursorColumn
"hi! link FoldColumn Folded

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
