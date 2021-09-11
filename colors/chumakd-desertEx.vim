" Colorscheme created with ColorSchemeEditor v1.2.2
"Name: local-desertEx-dchumak-edition
"Maintainer: 
"Last Change: 2009 Oct 30
set background=dark
if version > 580
	highlight clear
	if exists("syntax_on")
		syntax reset
	endif
endif
"let g:colors_name = "local-desertEx-dchumak-edition"
let g:colors_name = "chumakd-desertEx"

if v:version >= 700
	highlight CursorColumn guibg=Grey40 gui=NONE
	highlight CursorLine guibg=Grey40 gui=NONE
	highlight Pmenu guifg=white guibg=#445599 gui=NONE
	highlight PmenuSel guifg=#445599 guibg=gray gui=NONE
	highlight PmenuSbar guibg=Grey gui=NONE
	highlight PmenuThumb gui=reverse
	highlight TabLine guibg=DarkGrey gui=underline
	highlight TabLineFill gui=reverse
	highlight TabLineSel gui=bold
	if has('spell')
		highlight SpellBad gui=undercurl
		highlight SpellCap gui=undercurl
		highlight SpellLocal gui=undercurl
		highlight SpellRare gui=undercurl
	endif
endif
highlight Cursor guifg=black guibg=#BFBFBF gui=NONE
highlight link CursorIM cleared
highlight DiffAdd guifg=black guibg=#BEB096 gui=NONE
highlight DiffChange guifg=black guibg=#C76795 gui=NONE
highlight DiffDelete guifg=black guibg=#97B5C9 gui=NONE
highlight DiffText guifg=black guibg=#B01E65 gui=NONE
highlight Directory guifg=#97C3E0 gui=NONE
highlight ErrorMsg guifg=white guibg=red gui=NONE
highlight FoldColumn guifg=tan guibg=#292929 gui=NONE
highlight Folded guifg=DarkSlateGray3 guibg=grey10 gui=NONE
highlight IncSearch guifg=#b0ffff guibg=#2050d0 gui=reverse
highlight LineNr guifg=burlywood3 gui=NONE
highlight MatchParen guifg=cyan guibg=DarkCyan gui=bold
highlight ModeMsg guifg=SkyBlue gui=NONE
highlight MoreMsg guifg=#26AF2B gui=NONE
highlight NonText guifg=cyan gui=NONE
highlight Normal guifg=gray guibg=grey10 gui=NONE
highlight Question guifg=springgreen gui=NONE
highlight Search guifg=gray10 guibg=#B68A0D gui=NONE
highlight SignColumn guifg=Cyan guibg=#292929 gui=NONE
highlight SpecialKey guifg=#3B99E0 gui=NONE
highlight StatusLine guifg=black guibg=#c2bfa5 gui=bold
highlight StatusLineNC guifg=grey guibg=gray40 gui=NONE
highlight Title guifg=indianred gui=NONE
highlight VertSplit guifg=gray40 guibg=gray40 gui=NONE
highlight Visual guifg=gray17 guibg=tan1 gui=NONE
highlight VisualNOS gui=bold,underline
highlight WarningMsg guifg=salmon gui=NONE
highlight WildMenu guifg=gray guibg=gray17 gui=NONE
highlight Boolean guifg=#3BE05C gui=NONE
highlight Character guifg=#EDD345 gui=NONE
highlight Comment guifg=#808080 gui=NONE
highlight Conditional guifg=#E09549 gui=NONE
highlight Constant guifg=salmon gui=NONE
highlight link Debug Special
highlight link Define PreProc
highlight link Delimiter Special
highlight Error guifg=White guibg=Red gui=NONE
highlight link Exception Statement
highlight link Float Number
highlight Function guifg=Skyblue gui=NONE
highlight Identifier guifg=#7FBAD2 gui=NONE
highlight Ignore guifg=grey40 gui=NONE
highlight Include guifg=#416EE4 gui=NONE
highlight link Keyword Statement
highlight link Label Statement
highlight Macro guifg=#5678E4 gui=NONE
highlight Number guifg=#ED45D6 gui=NONE
highlight link Operator Statement
highlight link PreCondit PreProc
highlight PreProc guifg=PaleVioletRed2 gui=NONE
highlight shShellVariables guifg=#5678E4 gui=NONE
highlight makeTarget guifg=#FFFFFF gui=NONE
highlight treeExecFile guifg=#3BE05C gui=NONE
highlight link TagListFileName Statement
highlight Repeat guifg=#E09549 gui=NONE
highlight Special guifg=#9D0294 gui=NONE
highlight link SpecialChar Special
highlight link SpecialComment Special
highlight Statement guifg=lightgoldenrod2 gui=NONE
highlight link StorageClass Type
highlight String guifg=#ED45D6 gui=NONE
highlight link Structure Type
highlight link Tag Special
highlight Todo guifg=#000000 guibg=#F6EF26 gui=NONE
highlight Type guifg=#3BE05C gui=NONE
highlight link Typedef Type
highlight Underlined guifg=#80a0ff gui=underline

