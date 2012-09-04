" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4 foldmethod=marker
" Vim color file
" Maintainer:   Ron Aaron <ron@ronware.org>
" Last Change:  2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "elflord"
" original 16-color elflord highlights ================================== {{{1
hi Normal                                                                                 guifg=cyan     guibg=black
hi Comment     term=bold                   ctermfg=DarkCyan                               guifg=#80a0ff
hi Constant    term=underline              ctermfg=Magenta                                guifg=Magenta
hi Special     term=bold                   ctermfg=DarkMagenta                            guifg=Red
hi Identifier  term=underline  cterm=bold  ctermfg=Cyan                                   guifg=#40ffff
hi Statement   term=bold                   ctermfg=Yellow                       gui=bold  guifg=#aa4444
hi PreProc     term=underline              ctermfg=LightBlue                              guifg=#ff80ff
hi Type        term=underline              ctermfg=LightGreen                   gui=bold  guifg=#60ff60
hi Function    term=bold                   ctermfg=White                                  guifg=White
hi Repeat      term=underline              ctermfg=White                                  guifg=white
hi Operator                                ctermfg=Red                                    guifg=Red
hi Ignore                                  ctermfg=black                                  guifg=bg
hi Error       term=reverse                ctermfg=White        ctermbg=Red               guifg=White    guibg=Red
hi Todo        term=standout               ctermfg=Black        ctermbg=Yellow            guifg=Blue     guibg=Yellow

" 256-color extension =================================================== {{{1
if &t_Co == 256

" to link color groups which already have settings we need to use 'hi!'
" otherwise they will not have any effect

hi Normal                   ctermfg=LightGray  ctermbg=black  guifg=LightGray  guibg=black
hi LineNr       cterm=NONE  ctermfg=191        ctermbg=NONE
hi VertSplit    cterm=NONE  ctermfg=black      ctermbg=DarkGray
hi Directory                ctermfg=45
hi Title                    ctermfg=213
hi WarningMsg               ctermfg=211
hi WildMenu     cterm=bold  ctermfg=41         ctermbg=232
hi MatchParen               ctermfg=LightGray  ctermbg=Blue

" StatusLine ------------------------------------------------------------ {{{2
"
hi StatusLine   cterm=NONE  ctermfg=White  ctermbg=235
hi StatusLineNC cterm=NONE  ctermfg=black  ctermbg=DarkGray

" Folds ----------------------------------------------------------------- {{{2
"
hi Folded                   ctermbg=NONE  ctermfg=243    guifg=#80a0ff
hi FoldColumn               ctermbg=NONE  ctermfg=243    guifg=#80a0ff

" VimDiff --------------------------------------------------------------- {{{2
"
hi DiffAdd      cterm=NONE  ctermfg=235   ctermbg=122
hi DiffDelete   cterm=NONE  ctermfg=176   ctermbg=182
hi DiffChange   cterm=NONE  ctermfg=17    ctermbg=69
hi DiffText     cterm=NONE  ctermfg=234   ctermbg=178

" Pmenu ----------------------------------------------------------------- {{{2
"
hi Pmenu        cterm=NONE  ctermfg=black  ctermbg=103
hi PmenuSel     cterm=NONE  ctermfg=White  ctermbg=97
hi PmenuSbar                ctermfg=black

" Spell ----------------------------------------------------------------- {{{2
hi SpellBad                 ctermfg=White  ctermbg=124
hi SpellCap                 ctermfg=White  ctermbg=25
hi SpellRare                ctermfg=White
hi SpellLocal               ctermfg=black  ctermbg=44

" Tabline --------------------------------------------------------------- {{{2
"
hi TabLine      cterm=NONE  ctermfg=White  ctermbg=235
hi TabLineFill  cterm=NONE  ctermfg=White  ctermbg=235
hi TabLineSel   cterm=bold  ctermfg=41     ctermbg=232

" Cursor ---------------------------------------------------------------- {{{2
"
hi CursorLine   cterm=NONE  ctermfg=White  ctermbg=237
hi CursorColumn cterm=NONE  ctermfg=White  ctermbg=237

" Search ---------------------------------------------------------------- {{{2
"
hi Search                                  ctermbg=172

" Visual ---------------------------------------------------------------- {{{2
"
hi Visual                   ctermfg=black  ctermbg=247

" Code ------------------------------------------------------------------ {{{2
"

" default value for Comment is 6 (cyan)
hi Comment    cterm=NONE  ctermfg=30

" default value of Identifier is 14 (lightcyan), which is very close to 51
hi Identifier cterm=NONE ctermfg=80

" default value of Statement is 11 (yellow or lightbrown), which is very close to 227
hi Statement  cterm=NONE  ctermfg=191

hi Constant   cterm=NONE  ctermfg=212
hi Special    cterm=NONE  ctermfg=89
hi PreProc    cterm=NONE  ctermfg=32
hi Type       cterm=NONE  ctermfg=42
hi PreCondit  cterm=NONE  ctermfg=174

" User ------------------------------------------------------------------ {{{2
"
hi User1      cterm=bold  ctermfg=213  ctermbg=232
hi User2      cterm=NONE  ctermfg=213  ctermbg=235
hi User3      cterm=bold  ctermfg=160  ctermbg=232
hi User4      cterm=NONE  ctermfg=160  ctermbg=235

" Other ----------------------------------------------------------------- {{{2
"
hi Error      cterm=NONE  ctermfg=White  ctermbg=124
hi lCursor    cterm=NONE  ctermfg=black  ctermbg=51
hi SignColumn cterm=bold  ctermfg=202    ctermbg=NONE

" Plugins --------------------------------------------------------------- {{{2
"
hi ShowMarksHLdefault cterm=NONE  ctermfg=White  ctermbg=26

hi! link ShowMarksHLl   ShowMarksHLdefault
hi! link ShowMarksHLu   ShowMarksHLdefault
hi! link ShowMarksHLo   ShowMarksHLdefault
hi! link ShowMarksHLm   ShowMarksHLdefault
hi! link ShowMarksHLlz  ShowMarksHLdefault

endif

" original 16-color elflord highlights ================================== {{{1

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Repeat
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
