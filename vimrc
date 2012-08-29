" Options ================================================================ {{{1
"
" this should be at the beginning to allow pathogen plugin to generate
" runtimepath before other plugings are loaded
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Forget being compatible with good ol' vi
set nocompatible

" Filetype --------------------------------------------------------------- {{{2
"
filetype plugin on
filetype indent on
runtime! ftplugin/man.vim
runtime macros/matchit.vim
runtime macros/justify.vim
syntax enable
" set path for file search operations
"set path=.,,/usr/local/include/**,/usr/include/**
"set path+=include/
"set path+=arch/x86/include/
"set path+=arch/arm/include/

" Colors  ---------------------------------------------------------------- {{{2
"
" enable 256 colors in terminal
set t_Co=256
"
"colorscheme elflord
colorscheme chumakd-elflord

" disable Powerline plugin if we don't have full color terminal
" because it makes status line tatally black in such mode
if &t_Co == 8
    let g:Powerline_loaded = 1
endif

" Search  ---------------------------------------------------------------- {{{2
"
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrapscan

" Folding ---------------------------------------------------------------- {{{2
"
set foldcolumn=4
set foldmethod=syntax
" Add these commands to open folds
set foldopen+=insert,jump
"set foldtext=getline(v:foldstart)

" Indent ----------------------------------------------------------------- {{{2
"
set autoindent
set nocindent
set nosmartindent

" Tabstop ---------------------------------------------------------------- {{{2
"
set tabstop=4
set shiftwidth=4
set expandtab

" Spell ------------------------------------------------------------------ {{{2
"
set spelllang=en_us
set spelllang+=ru
" support ё instead of е
"set spelllang+=ru_yo

" Language --------------------------------------------------------------- {{{2
" enable keymappings for russian win-like йцукен keyboards
set keymap=russian-jcukenwin
" force insert and search begin in english and non in keymap language
set iminsert=0
set imsearch=0
" enable language map for ru_RU.UTF-8 locale
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,№#,х[,Х{,ъ],Ъ},Ж:,э',Б<,ю.,Ю>,Э\"
" default from vim doc
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" working extention
"№#,х[,Х{,ъ],Ъ},Ж:,э',б\,,Б<,ю.,Ю>,Э\"
" not working extention
""@,№#,\;$,:^,?&,х[,Х{,ъ],Ъ},/|,ж\;,Ж:,э',Э",б\,,Б<,ю.,Ю>,./,\,?
"№#,х[,Х{,ъ],Ъ},ж\;,Ж:,э',Э",б\,,Б<,ю.,Ю>

" Window ----------------------------------------------------------------- {{{2
"
set ruler
" display in ruler: current: symbol decimal/hex, column, line/total, line in percepts
"set ruf=%43([%3b/0x%-2B]\ Col:%-3v\ Line:%4l/%-4L\ [%P]%)
"set ruf=%43([%3b/0x%-2B]\ %y\ Line:%4l:%-2v/\ %-4L\ [%P]%)
set statusline=%f\ %=\ <\ ch:%3b/0x%-02B\ <\ %{&ff}\ <\ %{&enc}\ <\ %{&ft}\ \ \ LN:%3l:%-2v/\ %-4L\ [%P]
set nowrap
set showcmd
set wmh=0
set wildmenu
" show statusline even if there is only one window
set laststatus=2
" let yourself know what mode you're in
set showmode
" disable any fillchars for folds and vertical splits
set fillchars=fold:\ ,vert:\ 
"set fillchars=fold:-
"set textwidth=100
" turn on cursor highliting for current window
"set cursorline
"set cursorcolumn
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"

" Backup/Undo ------------------------------------------------------------ {{{2
"
set backup
set backupdir=~/.vim/backup,.,~/temp/tmp,~/
if version >= 703
  set undofile
  set undodir=~/.vim/undo,.,~/
endif

" Display ---------------------------------------------------------------- {{{2
"
set listchars=eol:$,tab:>-,trail:.

" Don't update the display while executing macros
set lazyredraw

set novisualbell

" hide the mouse pointer while typing
set mousehide

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
"set scrolloff=8
"
if version >= 703
  " Show line numbers relative to cursor position
  set relativenumber
endif

set numberwidth=3

" highlight textwidth column
"set colorcolumn=78

" Tags ------------------------------------------------------------------- {{{2
"
" disable preview window
set completeopt-=preview
" when completing by tag, show the whole tag, not just the function name
set showfulltag
set tags=./tags,tags,~/.vim/tags/stl
",~/prg/tags/tags.libc
",~/prg/tags/tags.stl
",~/prg/tags/tags.boost
" search tags database before cscope database
set csto=1

" Edit ------------------------------------------------------------------- {{{2
"
" Ask to save/not/cancel if buffer is modified and going to be closed/unvisible
set confirm
set nohidden
" disable virtualedit by default
set virtualedit=

" Cmdline ---------------------------------------------------------------- {{{2
"
set history=5000
" set key to invoke completion mode from inside mappings
set wildcharm=<C-X>
" for windoze set the forward slash to be used as path separator
if exists('+shellslash')
    set shellslash
endif

" Other ------------------------------------------------------------------ {{{2
"
" save only opened windows and tabs with :mksession without any
" mapping/options/buffers/etc...
set sessionoptions=tabpages

" Plugin options ========================================================= {{{1
" bash syntax ------------------------------------------------------------ {{{2
"
let is_bash = 1
let g:sh_fold_enabled= 1

" perl syntax ------------------------------------------------------------ {{{2
"
" enable syntax highlighting for perl POD documentation
let perl_include_pod = 1
let perl_fold = 1
let perl_fold_blocks = 1

" file explorer ---------------------------------------------------------- {{{2
"
let g:netrw_altv = 1

" BufExplorer ------------------------------------------------------------ {{{2
"
" Do not go to active window.
let g:bufExplorerFindActive=0
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitBelow=1
let g:bufExplorerShowRelativePath=1

" Taglist ---------------------------------------------------------------- {{{2
"
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 35

" Project ---------------------------------------------------------------- {{{2
"
let g:proj_window_width = 32
let Tlist_Show_One_File = 1
"let g:proj_flags .= "g"

" Omnicppcomplete -------------------------------------------------------- {{{2
"
" let OmniCpp_GlobalScopeSearch = 0
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1

" EnhancedCommentify ----------------------------------------------------- {{{2
"
let g:EnhCommentifyUseAltKeys = 'n'
let g:EnhCommentifyTraditionalMode = 'n'
let g:EnhCommentifyRespectIndent = 'y'
"let g:EnhCommentifyPretty = 'y'
let g:EnhCommentifyMultiPartBlocks = 'y'

" Showmarks -------------------------------------------------------------- {{{2
"
let g:showmarks_enable = 0
let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" MRU -------------------------------------------------------------------- {{{2
"
let MRU_Max_Entries = 1000
let MRU_Add_Menu = 0
let MRU_Auto_Close = 1

" NERDTree --------------------------------------------------------------- {{{2
"
let NERDTreeWinPos="right"
" store the bookmarks file in ~/.vim
"let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" show the bookmarks table on startup
"let NERDTreeShowBookmarks=1
" don't display these kinds of files
let NERDTreeIgnore=['\.o$', '\.lo$', '\.ko$', '\.a$', '\.so$']
"let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            " \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            " \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            " \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Securemodeline --------------------------------------------------------- {{{2
"
let g:secure_modelines_verbose=1

" Alternate -------------------------------------------------------------- {{{2
"
let g:alternateNoDefaultAlternate=0
let g:alternateRelativeFiles=1
"let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

" MultipleSearch --------------------------------------------------------- {{{2
"
let g:MultipleSearchMaxColors=8
let g:MultipleSearchColorSequence="red,blue,green,magenta,cyan,gray,brown,yellow"
let g:MultipleSearchTextColorSequence="white,white,black,white,black,black,white,black"

" YankRing --------------------------------------------------------------- {{{2
"
" ommit single letter deletes
let g:yankring_min_element_length = 2
" don't store yankring contents between vim restarts
"let g:yankring_persist = 0
" don't share yankring contents between different instances of vim
"let g:yankring_share_between_instances = 0

" Perl-support ----------------------------------------------------------- {{{2
"
let g:Perl_Ctrl_j   = 'off'

" vim-r-plugin ----------------------------------------------------------- {{{2
"
let vimrplugin_r_args = "--no-save --quiet"
let vimrplugin_term = "xterm"
" disable the underscore replacement with <-
let vimrplugin_underscore = 0
" open .Rout files in a split window
let vimrplugin_notab = 1
" show list elements in object browser
"let vimrplugin_open_list = 1
let vimrplugin_vimpager = "horizontal"
let vimrplugin_screenplugin = 0
let vimrplugin_conqueplugin = 1

" Conque shell ----------------------------------------------------------- {{{2
"
let g:ConqueTerm_Color = 0
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

" Xml -------------------------------------------------------------------- {{{2
"
let g:xml_syntax_folding = 1

" Latex suite ------------------------------------------------------------ {{{2
"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_ViewRule_dvi = "okular"
let g:Tex_ViewRule_ps  = "okular"
"let g:Tex_ViewRule_pdf = "acroread"
let g:Tex_ViewRule_pdf = "okular"
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

" GetLatestVimScripts ---------------------------------------------------- {{{2
"
let g:GetLatestVimScripts_allowautoinstall= 0

" CCTree ----------------------------------------------------------------- {{{2
"
let g:CCTreeOrientation = "rightbelow"
let g:CCTreeRecursiveDepth = 3
let g:CCTreeMinVisibleDepth = 1
let g:CCTreeWindowMinWidth = -1
"let g:CCTreeDisplayMode = 2
let g:CCTreeWindowVertical = 1

" cscope_quickfix -------------------------------------------------------- {{{2
"
let g:Cscope_OpenQuickfixWindow = 1
let g:Cscope_JumpError = 0
let g:Cscope_PopupMenu = 0
let g:Cscope_ToolsMenu = 0

" SessionMan ------------------------------------------------------------- {{{2
"
let sessionman_save_on_exit = 0

" Gundo ------------------------------------------------------------------ {{{2
"
let g:gundo_width = 75
"let g:gundo_preview_bottom = 1

" CSApprox --------------------------------------------------------------- {{{2
"
" disabled to not slowdown vim start-up time
let g:CSApprox_loaded = 1
" tune color palette for Konsole
let g:CSApprox_konsole = 1

" Zencoding -------------------------------------------------------------- {{{2
"
let g:user_zen_leader_key = '\z'

" clang_complete --------------------------------------------------------- {{{2
"
"let g:clang_complete_auto = 0
let g:clang_omnicppcomplete_compliance = 1

" DelimitMate ------------------------------------------------------------ {{{2
"
let delimitMate_offByDefault = 1

" Tagbar ----------------------------------------------------------------- {{{2
"
let g:tagbar_left = 1
let g:tagbar_width = 33

" Powerline -------------------------------------------------------------- {{{2
"
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'relative'

"let g:Powerline_theme = 'skwp'
let g:Powerline_colorscheme = 'chumakd'

" add total line number segment after lineinfo
"call Pl#Theme#InsertSegment('charcode', 'before', 'scrollpercent')

" EasyMotion ------------------------------------------------------------- {{{2
"
hi EasyMotionTarget cterm=bold ctermbg=NONE ctermfg=red
hi EasyMotionShade  cterm=NONE ctermbg=NONE ctermfg=darkgray

" Mappings =============================================================== {{{1
"
" Shortened commands ----------------------------------------------------- {{{2
"
" let yankstack plugin to know that we remap default Y behavior
call yankstack#setup()
" make 'Y' to be more consistent with 'D','C','S'
nmap Y y$

" don't jump to the next occurrence of the word, but just highlight it
nnoremap *   *N
nnoremap g*  g*N
nnoremap #   #N
nnoremap g#  g#N

" map CTRL-s to do what ',' used to do
nnoremap <c-s> ,
vnoremap <c-s> ,

" save current buffer
nmap ,u :update<CR>

" toggle paste mode
nmap <silent> ,tp :set invpaste<CR>:set paste?<CR>

" toggle highlight search
"nmap <silent> ,tn :set invhls<CR>:set hls?<CR>

" disable current highlight search
nmap <silent> ,tn :nohlsearch<CR>

" toggle text wrapping
nmap <silent> ,tw :set invwrap<CR>:set wrap?<CR>

" toggle list option
nmap <silent> ,tl :set invlist<CR>:set list?<CR>

" toggle spell check
nmap <silent> ,ts :set invspell<CR>:set spell?<CR>

" toggle scrollbind
nmap <silent> ,tb :set invscrollbind<CR>:set scrollbind?<CR>

" toggle read-only mode
nmap <silent> ,tr :set invreadonly<CR>:set readonly?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
"nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Show all available VIM servers
"nmap <silent> ,ss :echo serverlist()<CR>

" Run the command that was just yanked
"nmap <silent> ,rc :@"<cr>

" edit the vimrc file
nmap <silent> ,ve :e $MYVIMRC<CR>
nmap <silent> ,vs :so $MYVIMRC<CR>

" make vertical scrolling easier
nmap <silent> ,se 10<C-e>
nmap <silent> ,sy 10<C-y>

" make horizontal scrolling easier
nmap <silent> ,sl 10zl
nmap <silent> ,sh 10zh

" search of selected text in visual mode
vmap X y/<C-R>"<CR>

" run make in current directory
nmap ,m :make<CR>

" quit all windows (by analogy with ZZ and ZQ)
nmap ZA :qa<CR>

" Highlight all instances of the current word under the cursor
"nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> ,g/
      \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
      \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
      \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" Swap two words
nmap <silent> ,sw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
"nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
"nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" find highlight group of symbol under cursor
nmap <silent> <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
      \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
      \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
      \ . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")
      \ . " BG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#")<CR>

" Show syntax highlighting groups for word under cursor
nmap <S-F9> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Cmdline editing -------------------------------------------------------- {{{2
"
" allow command line editing like emacs
cnoremap <C-A>  <Home>
cnoremap <C-B>  <Left>
cnoremap <C-F>  <Right>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <ESC>b <S-Left>
cnoremap <ESC>f <S-Right>
" remap <C-f> (which is used to open command-line window) to <C-y>
set cedit=<C-Y>
" allow command line completion with Alt key
cnoremap <M-p>  <Up>
cnoremap <M-n>  <Down>
cnoremap <ESC>p <Up>
cnoremap <ESC>n <Down>

" Maps to make handling windows a bit easier ----------------------------- {{{2
"
" switch between windows
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
" go to previous (last accessed) window.
noremap <silent> ,p :wincmd p<CR>
" close neighbour windows
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
" close current window
noremap <silent> ,cc :close<CR>
" close current window
noremap <silent> ,ct :tabclose<CR>
" close quickfix window (not used now becaue QF is toggled by ,tq)
"noremap <silent> ,cw :cclose<CR>
" adjust window size by one
noremap <silent> <C-Left>   <C-W><
noremap <silent> <C-Up>     <C-W>+
noremap <silent> <C-Down>   <C-W>-
noremap <silent> <C-Right>  <C-W>>

" adjust window size by five
"noremap <silent> <M-Left>   :vertical resize -5<CR>
"noremap <silent> <M-Up>     :resize +5<CR>
"noremap <silent> <M-Down>   :resize -5<CR>
"noremap <silent> <M-Right>  :vertical resize +5<CR>

" switch between tabs
noremap <silent> <M-Up>     :tabprev<CR>
noremap <silent> <M-Down>   :tabnext<CR>

" move tabs
noremap <silent> <M-Right>  :exec 'silent! tabmove ' . tabpagenr()<CR>
noremap <silent> <M-Left>  :exec 'silent! tabmove ' . (tabpagenr() - 2)<CR>

" switch window with full expand
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W>\|
nmap <C-L> <C-W>l<C-W>\|
" full expand current window
noremap <silent> ,wf :wincmd _<CR>
" make windows sizes equal
noremap <silent> ,w= :wincmd =<CR>
" exchange current and pervious windows
noremap <silent> ,wx :wincmd x<CR>
" split window
noremap <silent> ,ws :wincmd s<CR>
" split window vertically
noremap <silent> ,wv :wincmd v<CR>
" edit new empty buffer in current window
noremap <silent> ,we :enew<CR>
" split new empty buffer
noremap <silent> ,wn :new<CR>

" edit buffer with file from the same directory as current one
" allowing to autocomplete the name with <Tab>
nmap <silent> ,ee :e %:p:h/<C-X>

" split buffer with file from the same directory as current one
" allowing to autocomplete the name with <Tab>
nmap <silent> ,sp :sp %:p:h/<C-X>

" open empty buffer in current window
nmap <silent> ,ne :enew <CR>

" open empty buffer in split window
nmap <silent> ,ns :new <CR>

" open empty buffer in new tab
nmap <silent> ,nt :tabnew <CR>

" TODO: check this
" use Alt-Left and Alt-Right to move current tab to left or right
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Tabs handling ---------------------------------------------------------- {{{2
"
fu! TabMoveLeft()
    let current_tab = tabpagenr()
    if current_tab > 1
       let current_tab = current_tab - 2
       execute 'tabmove' current_tab
    endif
endf

fu! TabMoveRight()
    let current_tab = tabpagenr()
    execute 'tabmove' current_tab
endf

" prev tab
nnoremap <silent><M-j> :tabprevious<CR>
inoremap <silent><M-j> <C-O>:tabprevious<CR>
vnoremap <silent><M-j> <ESC>:tabprevious<CR>

" next tab
nnoremap <silent><M-k> :tabnext<CR>
inoremap <silent><M-k> <C-O>:tabnext<CR>
vnoremap <silent><M-k> <ESC>:tabnext<CR>

" first tab
nnoremap <silent><M-h> :tabfirst<CR>
inoremap <silent><M-h> <C-O>:tabfirst<CR>
vnoremap <silent><M-h> <ESC>:tabfirst<CR>

" last tab
nnoremap <silent><M-l> :tablast<CR>
inoremap <silent><M-l> <C-O>:tablast<CR>
vnoremap <silent><M-l> <ESC>:tablast<CR>

" move tab to the begining
nnoremap <silent><M-S-h> :tabmove 0<CR>
inoremap <silent><M-S-h> <C-O>:tabmove 0<CR>
vnoremap <silent><M-S-h> <ESC>:tabmove 0<CR>

" move tab to the end
nnoremap <silent><M-S-l> :tabmove<CR>
inoremap <silent><M-S-l> <C-O>:tabmove<CR>
vnoremap <silent><M-S-l> <ESC>:tabmove<CR>

" move tab backwards
nnoremap <silent><M-S-j> :call TabMoveLeft()<CR>
inoremap <silent><M-S-j> <C-O>:call TabMoveLeft()<CR>
vnoremap <silent><M-S-j> <ESC>:call TabMoveLeft()<CR>

" move tab forward
nnoremap <silent><M-S-k> :call TabMoveRight()<CR>
inoremap <silent><M-S-k> <C-O>:call TabMoveRight()<CR>
vnoremap <silent><M-S-k> <ESC>:call TabMoveRight()<CR>

" Perl mappings ---------------------------------------------------------- {{{2
"
nmap ,pt :.!perltidy<CR>
vmap ,pt :!perltidy<CR>

" Plugin mappings -------------------------------------------------------- {{{2
"
" build ctags/cscope for Asm/C/C++/Perl/Make project in current dir
nmap <F2> :!mktags -acxpms<CR>
" same as above but without Make
nmap <S-F2> :!mktags -acxps<CR>

" Project
"nmap <S-F3> :Project vimproject<CR>
"nmap <F3>   <Plug>ToggleProject

" MRU
nmap <F3>   :MRU<CR>

" TagList
nmap <F4>   :TlistToggle<CR>

" Tagbar
"
nmap <S-F4> :TagbarToggle<CR>

" MarksBrowser
nmap <F5>   :MarksBrowser<CR>

" Gundo
nmap <F6>   :GundoToggle<CR>

" NERDTree
nmap <F8>   :NERDTreeToggle<CR>
nmap <S-F8> :NERDTree %:p:h<CR>

" BuffExplorer uses the following mappings:
" \be - to start exploring in the current window
" \bs - to start exploring in a newly split horizontal window
" \bv - to start exploring in a newly split vertical window

" Alternate
nmap <silent> <Leader>aa :A<CR>
nmap <silent> <Leader>as :AS<CR>
nmap <silent> <Leader>av :AV<CR>
nmap <silent> <Leader>at :AT<CR>

" FuzzyFinder Settings
nmap ,fb :FufBuffer<CR>
nmap ,fm :FufBookmarkFile<CR>
nmap ,fma :FufBookmarkFileAdd<CR>
nmap ,ff :FufFile<CR>
nmap ,fo :FufCoverageFile<CR>
nmap ,ft :FufBufferTag<CR>
nmap ,fj :FufJumpList<CR>
nmap ,fc :FufChangeList<CR>
nmap ,fl :FufLine<CR>

" Color shceme
" nmap <Leader>\]  :call NextColorScheme()<CR>
" nmap <Leader>\[  :call PreviousColorScheme()<CR>

" Latex Suite
nmap <A-j> <Plug>IMAP_JumpForward
vmap <A-j> <Plug>IMAP_JumpForward

" Perl support
"nmap <silent> <A-j>  i<C-R>=Perl_JumpCtrlJ()<CR>

" DiffChanges
nmap <silent> <Leader>ddt :DiffChangesDiffToggle<CR>
nmap <silent> <Leader>dpt :DiffChangesPatchToggle<CR>

" BlockDiff
vmap ,b1 :call BlockDiff_GetBlock1()<CR>
vmap ,b2 :call BlockDiff_GetBlock2()<CR>

" CCTree
nmap <silent> ,ctl :CCTreeLoadDB<CR>
nmap <silent> ,ctr :CCTreeLoadXRefDB<CR>
nmap <silent> ,cts :CCTreeSaveXRefDB<CR>

" SessionMan
nmap <silent> \so :SessionOpen <C-X>
nmap <silent> \sc :SessionClose<CR>
nmap <silent> \ss :SessionSave<CR>
nmap <silent> \sl :SessionList<CR>

" Fugitive/Git
nmap <silent> ,gs :Git status<CR>
nmap <silent> ,gd :Git diff<CR>
nmap <silent> ,gt :!tig<CR>

" Tagselect
" open current file in new tab and do :Tselect on a word  under cursor
nmap <C-w>t :tab split<CR>:exec("Ts ".expand("<cword>"))<CR>

" DelimitMate
nmap <silent> ,tdm :DelimitMateSwitch<CR>

" Yankstack
"
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_older_paste

" Commands =============================================================== {{{1
"
" show current highlight groups in new buffer
command Hitest    runtime syntax/hitest.vim
command Colortest runtime syntax/colortest.vim

" Auto commands  ========================================================= {{{1
"
" simplify editing of binary files
"augroup Binary
    " au!
    " au BufReadPre   *.bin let &bin=1
    " au BufReadPost  *.bin if &bin | %!xxd
    " au BufReadPost  *.bin set filetype=xxd | endif
    " au BufWritePre  *.bin if &bin | %!xxd -r
    " au BufWritePre  *.bin endif
    " au BufWritePost *.bin if &bin | %!xxd
    " au BufWritePost *.bin set nomod | endif
"augroup END

" check perl code with :make
"au FileType perl set makeprg=/usr/share/vim/vim73/tools/efm_perl.pl\ %\ $*
"au FileType perl set makeprg=perl\ -c\ %\ $*
"au FileType perl set errorformat=%f:%l:%m

" format code with perltidy (using '=' key)
"au Filetype perl :set equalprg=perltidy

" format sql code
"au Filetype sql :set equalprg=sql-beautify.pl
"command! -range SQLF :'<,'>!$HOME/bin/sql-beautify

" escape symbols with html codes
"command! -range Entities :'<,'>!$HOME/bin/html-entities

" reading Ms-Word documents, requires antiword
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc %!antiword "%"

" highlight trailing whitespaces with color of TODO hl group
autocmd BufRead * match Todo /\s\+$/
autocmd BufNew  * match Todo /\s\+$/
"autocmd BufAdd  * match Todo /\s\+$/

" Abbreviations ========================================================== {{{1
"
" fix constant spelling mistakes
iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone

" Colors ================================================================= {{{1
"
" Generated from c:/pdsrc/xterm-222/256colres.h by allcolors.pl
hi x016_Grey0 ctermfg=16 guifg=#000000
hi x017_NavyBlue ctermfg=17 guifg=#00005f
hi x018_DarkBlue ctermfg=18 guifg=#000087
hi x019_Blue3 ctermfg=19 guifg=#0000af
hi x020_Blue3 ctermfg=20 guifg=#0000d7
hi x021_Blue1 ctermfg=21 guifg=#0000ff
hi x022_DarkGreen ctermfg=22 guifg=#005f00
hi x023_DeepSkyBlue4 ctermfg=23 guifg=#005f5f
hi x024_DeepSkyBlue4 ctermfg=24 guifg=#005f87
hi x025_DeepSkyBlue4 ctermfg=25 guifg=#005faf
hi x026_DodgerBlue3 ctermfg=26 guifg=#005fd7
hi x027_DodgerBlue2 ctermfg=27 guifg=#005fff
hi x028_Green4 ctermfg=28 guifg=#008700
hi x029_SpringGreen4 ctermfg=29 guifg=#00875f
hi x030_Turquoise4 ctermfg=30 guifg=#008787
hi x031_DeepSkyBlue3 ctermfg=31 guifg=#0087af
hi x032_DeepSkyBlue3 ctermfg=32 guifg=#0087d7
hi x033_DodgerBlue1 ctermfg=33 guifg=#0087ff
hi x034_Green3 ctermfg=34 guifg=#00af00
hi x035_SpringGreen3 ctermfg=35 guifg=#00af5f
hi x036_DarkCyan ctermfg=36 guifg=#00af87
hi x037_LightSeaGreen ctermfg=37 guifg=#00afaf
hi x038_DeepSkyBlue2 ctermfg=38 guifg=#00afd7
hi x039_DeepSkyBlue1 ctermfg=39 guifg=#00afff
hi x040_Green3 ctermfg=40 guifg=#00d700
hi x041_SpringGreen3 ctermfg=41 guifg=#00d75f
hi x042_SpringGreen2 ctermfg=42 guifg=#00d787
hi x043_Cyan3 ctermfg=43 guifg=#00d7af
hi x044_DarkTurquoise ctermfg=44 guifg=#00d7d7
hi x045_Turquoise2 ctermfg=45 guifg=#00d7ff
hi x046_Green1 ctermfg=46 guifg=#00ff00
hi x047_SpringGreen2 ctermfg=47 guifg=#00ff5f
hi x048_SpringGreen1 ctermfg=48 guifg=#00ff87
hi x049_MediumSpringGreen ctermfg=49 guifg=#00ffaf
hi x050_Cyan2 ctermfg=50 guifg=#00ffd7
hi x051_Cyan1 ctermfg=51 guifg=#00ffff
hi x052_DarkRed ctermfg=52 guifg=#5f0000
hi x053_DeepPink4 ctermfg=53 guifg=#5f005f
hi x054_Purple4 ctermfg=54 guifg=#5f0087
hi x055_Purple4 ctermfg=55 guifg=#5f00af
hi x056_Purple3 ctermfg=56 guifg=#5f00d7
hi x057_BlueViolet ctermfg=57 guifg=#5f00ff
hi x058_Orange4 ctermfg=58 guifg=#5f5f00
hi x059_Grey37 ctermfg=59 guifg=#5f5f5f
hi x060_MediumPurple4 ctermfg=60 guifg=#5f5f87
hi x061_SlateBlue3 ctermfg=61 guifg=#5f5faf
hi x062_SlateBlue3 ctermfg=62 guifg=#5f5fd7
hi x063_RoyalBlue1 ctermfg=63 guifg=#5f5fff
hi x064_Chartreuse4 ctermfg=64 guifg=#5f8700
hi x065_DarkSeaGreen4 ctermfg=65 guifg=#5f875f
hi x066_PaleTurquoise4 ctermfg=66 guifg=#5f8787
hi x067_SteelBlue ctermfg=67 guifg=#5f87af
hi x068_SteelBlue3 ctermfg=68 guifg=#5f87d7
hi x069_CornflowerBlue ctermfg=69 guifg=#5f87ff
hi x070_Chartreuse3 ctermfg=70 guifg=#5faf00
hi x071_DarkSeaGreen4 ctermfg=71 guifg=#5faf5f
hi x072_CadetBlue ctermfg=72 guifg=#5faf87
hi x073_CadetBlue ctermfg=73 guifg=#5fafaf
hi x074_SkyBlue3 ctermfg=74 guifg=#5fafd7
hi x075_SteelBlue1 ctermfg=75 guifg=#5fafff
hi x076_Chartreuse3 ctermfg=76 guifg=#5fd700
hi x077_PaleGreen3 ctermfg=77 guifg=#5fd75f
hi x078_SeaGreen3 ctermfg=78 guifg=#5fd787
hi x079_Aquamarine3 ctermfg=79 guifg=#5fd7af
hi x080_MediumTurquoise ctermfg=80 guifg=#5fd7d7
hi x081_SteelBlue1 ctermfg=81 guifg=#5fd7ff
hi x082_Chartreuse2 ctermfg=82 guifg=#5fff00
hi x083_SeaGreen2 ctermfg=83 guifg=#5fff5f
hi x084_SeaGreen1 ctermfg=84 guifg=#5fff87
hi x085_SeaGreen1 ctermfg=85 guifg=#5fffaf
hi x086_Aquamarine1 ctermfg=86 guifg=#5fffd7
hi x087_DarkSlateGray2 ctermfg=87 guifg=#5fffff
hi x088_DarkRed ctermfg=88 guifg=#870000
hi x089_DeepPink4 ctermfg=89 guifg=#87005f
hi x090_DarkMagenta ctermfg=90 guifg=#870087
hi x091_DarkMagenta ctermfg=91 guifg=#8700af
hi x092_DarkViolet ctermfg=92 guifg=#8700d7
hi x093_Purple ctermfg=93 guifg=#8700ff
hi x094_Orange4 ctermfg=94 guifg=#875f00
hi x095_LightPink4 ctermfg=95 guifg=#875f5f
hi x096_Plum4 ctermfg=96 guifg=#875f87
hi x097_MediumPurple3 ctermfg=97 guifg=#875faf
hi x098_MediumPurple3 ctermfg=98 guifg=#875fd7
hi x099_SlateBlue1 ctermfg=99 guifg=#875fff
hi x100_Yellow4 ctermfg=100 guifg=#878700
hi x101_Wheat4 ctermfg=101 guifg=#87875f
hi x102_Grey53 ctermfg=102 guifg=#878787
hi x103_LightSlateGrey ctermfg=103 guifg=#8787af
hi x104_MediumPurple ctermfg=104 guifg=#8787d7
hi x105_LightSlateBlue ctermfg=105 guifg=#8787ff
hi x106_Yellow4 ctermfg=106 guifg=#87af00
hi x107_DarkOliveGreen3 ctermfg=107 guifg=#87af5f
hi x108_DarkSeaGreen ctermfg=108 guifg=#87af87
hi x109_LightSkyBlue3 ctermfg=109 guifg=#87afaf
hi x110_LightSkyBlue3 ctermfg=110 guifg=#87afd7
hi x111_SkyBlue2 ctermfg=111 guifg=#87afff
hi x112_Chartreuse2 ctermfg=112 guifg=#87d700
hi x113_DarkOliveGreen3 ctermfg=113 guifg=#87d75f
hi x114_PaleGreen3 ctermfg=114 guifg=#87d787
hi x115_DarkSeaGreen3 ctermfg=115 guifg=#87d7af
hi x116_DarkSlateGray3 ctermfg=116 guifg=#87d7d7
hi x117_SkyBlue1 ctermfg=117 guifg=#87d7ff
hi x118_Chartreuse1 ctermfg=118 guifg=#87ff00
hi x119_LightGreen ctermfg=119 guifg=#87ff5f
hi x120_LightGreen ctermfg=120 guifg=#87ff87
hi x121_PaleGreen1 ctermfg=121 guifg=#87ffaf
hi x122_Aquamarine1 ctermfg=122 guifg=#87ffd7
hi x123_DarkSlateGray1 ctermfg=123 guifg=#87ffff
hi x124_Red3 ctermfg=124 guifg=#af0000
hi x125_DeepPink4 ctermfg=125 guifg=#af005f
hi x126_MediumVioletRed ctermfg=126 guifg=#af0087
hi x127_Magenta3 ctermfg=127 guifg=#af00af
hi x128_DarkViolet ctermfg=128 guifg=#af00d7
hi x129_Purple ctermfg=129 guifg=#af00ff
hi x130_DarkOrange3 ctermfg=130 guifg=#af5f00
hi x131_IndianRed ctermfg=131 guifg=#af5f5f
hi x132_HotPink3 ctermfg=132 guifg=#af5f87
hi x133_MediumOrchid3 ctermfg=133 guifg=#af5faf
hi x134_MediumOrchid ctermfg=134 guifg=#af5fd7
hi x135_MediumPurple2 ctermfg=135 guifg=#af5fff
hi x136_DarkGoldenrod ctermfg=136 guifg=#af8700
hi x137_LightSalmon3 ctermfg=137 guifg=#af875f
hi x138_RosyBrown ctermfg=138 guifg=#af8787
hi x139_Grey63 ctermfg=139 guifg=#af87af
hi x140_MediumPurple2 ctermfg=140 guifg=#af87d7
hi x141_MediumPurple1 ctermfg=141 guifg=#af87ff
hi x142_Gold3 ctermfg=142 guifg=#afaf00
hi x143_DarkKhaki ctermfg=143 guifg=#afaf5f
hi x144_NavajoWhite3 ctermfg=144 guifg=#afaf87
hi x145_Grey69 ctermfg=145 guifg=#afafaf
hi x146_LightSteelBlue3 ctermfg=146 guifg=#afafd7
hi x147_LightSteelBlue ctermfg=147 guifg=#afafff
hi x148_Yellow3 ctermfg=148 guifg=#afd700
hi x149_DarkOliveGreen3 ctermfg=149 guifg=#afd75f
hi x150_DarkSeaGreen3 ctermfg=150 guifg=#afd787
hi x151_DarkSeaGreen2 ctermfg=151 guifg=#afd7af
hi x152_LightCyan3 ctermfg=152 guifg=#afd7d7
hi x153_LightSkyBlue1 ctermfg=153 guifg=#afd7ff
hi x154_GreenYellow ctermfg=154 guifg=#afff00
hi x155_DarkOliveGreen2 ctermfg=155 guifg=#afff5f
hi x156_PaleGreen1 ctermfg=156 guifg=#afff87
hi x157_DarkSeaGreen2 ctermfg=157 guifg=#afffaf
hi x158_DarkSeaGreen1 ctermfg=158 guifg=#afffd7
hi x159_PaleTurquoise1 ctermfg=159 guifg=#afffff
hi x160_Red3 ctermfg=160 guifg=#d70000
hi x161_DeepPink3 ctermfg=161 guifg=#d7005f
hi x162_DeepPink3 ctermfg=162 guifg=#d70087
hi x163_Magenta3 ctermfg=163 guifg=#d700af
hi x164_Magenta3 ctermfg=164 guifg=#d700d7
hi x165_Magenta2 ctermfg=165 guifg=#d700ff
hi x166_DarkOrange3 ctermfg=166 guifg=#d75f00
hi x167_IndianRed ctermfg=167 guifg=#d75f5f
hi x168_HotPink3 ctermfg=168 guifg=#d75f87
hi x169_HotPink2 ctermfg=169 guifg=#d75faf
hi x170_Orchid ctermfg=170 guifg=#d75fd7
hi x171_MediumOrchid1 ctermfg=171 guifg=#d75fff
hi x172_Orange3 ctermfg=172 guifg=#d78700
hi x173_LightSalmon3 ctermfg=173 guifg=#d7875f
hi x174_LightPink3 ctermfg=174 guifg=#d78787
hi x175_Pink3 ctermfg=175 guifg=#d787af
hi x176_Plum3 ctermfg=176 guifg=#d787d7
hi x177_Violet ctermfg=177 guifg=#d787ff
hi x178_Gold3 ctermfg=178 guifg=#d7af00
hi x179_LightGoldenrod3 ctermfg=179 guifg=#d7af5f
hi x180_Tan ctermfg=180 guifg=#d7af87
hi x181_MistyRose3 ctermfg=181 guifg=#d7afaf
hi x182_Thistle3 ctermfg=182 guifg=#d7afd7
hi x183_Plum2 ctermfg=183 guifg=#d7afff
hi x184_Yellow3 ctermfg=184 guifg=#d7d700
hi x185_Khaki3 ctermfg=185 guifg=#d7d75f
hi x186_LightGoldenrod2 ctermfg=186 guifg=#d7d787
hi x187_LightYellow3 ctermfg=187 guifg=#d7d7af
hi x188_Grey84 ctermfg=188 guifg=#d7d7d7
hi x189_LightSteelBlue1 ctermfg=189 guifg=#d7d7ff
hi x190_Yellow2 ctermfg=190 guifg=#d7ff00
hi x191_DarkOliveGreen1 ctermfg=191 guifg=#d7ff5f
hi x192_DarkOliveGreen1 ctermfg=192 guifg=#d7ff87
hi x193_DarkSeaGreen1 ctermfg=193 guifg=#d7ffaf
hi x194_Honeydew2 ctermfg=194 guifg=#d7ffd7
hi x195_LightCyan1 ctermfg=195 guifg=#d7ffff
hi x196_Red1 ctermfg=196 guifg=#ff0000
hi x197_DeepPink2 ctermfg=197 guifg=#ff005f
hi x198_DeepPink1 ctermfg=198 guifg=#ff0087
hi x199_DeepPink1 ctermfg=199 guifg=#ff00af
hi x200_Magenta2 ctermfg=200 guifg=#ff00d7
hi x201_Magenta1 ctermfg=201 guifg=#ff00ff
hi x202_OrangeRed1 ctermfg=202 guifg=#ff5f00
hi x203_IndianRed1 ctermfg=203 guifg=#ff5f5f
hi x204_IndianRed1 ctermfg=204 guifg=#ff5f87
hi x205_HotPink ctermfg=205 guifg=#ff5faf
hi x206_HotPink ctermfg=206 guifg=#ff5fd7
hi x207_MediumOrchid1 ctermfg=207 guifg=#ff5fff
hi x208_DarkOrange ctermfg=208 guifg=#ff8700
hi x209_Salmon1 ctermfg=209 guifg=#ff875f
hi x210_LightCoral ctermfg=210 guifg=#ff8787
hi x211_PaleVioletRed1 ctermfg=211 guifg=#ff87af
hi x212_Orchid2 ctermfg=212 guifg=#ff87d7
hi x213_Orchid1 ctermfg=213 guifg=#ff87ff
hi x214_Orange1 ctermfg=214 guifg=#ffaf00
hi x215_SandyBrown ctermfg=215 guifg=#ffaf5f
hi x216_LightSalmon1 ctermfg=216 guifg=#ffaf87
hi x217_LightPink1 ctermfg=217 guifg=#ffafaf
hi x218_Pink1 ctermfg=218 guifg=#ffafd7
hi x219_Plum1 ctermfg=219 guifg=#ffafff
hi x220_Gold1 ctermfg=220 guifg=#ffd700
hi x221_LightGoldenrod2 ctermfg=221 guifg=#ffd75f
hi x222_LightGoldenrod2 ctermfg=222 guifg=#ffd787
hi x223_NavajoWhite1 ctermfg=223 guifg=#ffd7af
hi x224_MistyRose1 ctermfg=224 guifg=#ffd7d7
hi x225_Thistle1 ctermfg=225 guifg=#ffd7ff
hi x226_Yellow1 ctermfg=226 guifg=#ffff00
hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f
hi x228_Khaki1 ctermfg=228 guifg=#ffff87
hi x229_Wheat1 ctermfg=229 guifg=#ffffaf
hi x230_Cornsilk1 ctermfg=230 guifg=#ffffd7
hi x231_Grey100 ctermfg=231 guifg=#ffffff
hi x232_Grey3 ctermfg=232 guifg=#080808
hi x233_Grey7 ctermfg=233 guifg=#121212
hi x234_Grey11 ctermfg=234 guifg=#1c1c1c
hi x235_Grey15 ctermfg=235 guifg=#262626
hi x236_Grey19 ctermfg=236 guifg=#303030
hi x237_Grey23 ctermfg=237 guifg=#3a3a3a
hi x238_Grey27 ctermfg=238 guifg=#444444
hi x239_Grey30 ctermfg=239 guifg=#4e4e4e
hi x240_Grey35 ctermfg=240 guifg=#585858
hi x241_Grey39 ctermfg=241 guifg=#626262
hi x242_Grey42 ctermfg=242 guifg=#6c6c6c
hi x243_Grey46 ctermfg=243 guifg=#767676
hi x244_Grey50 ctermfg=244 guifg=#808080
hi x245_Grey54 ctermfg=245 guifg=#8a8a8a
hi x246_Grey58 ctermfg=246 guifg=#949494
hi x247_Grey62 ctermfg=247 guifg=#9e9e9e
hi x248_Grey66 ctermfg=248 guifg=#a8a8a8
hi x249_Grey70 ctermfg=249 guifg=#b2b2b2
hi x250_Grey74 ctermfg=250 guifg=#bcbcbc
hi x251_Grey78 ctermfg=251 guifg=#c6c6c6
hi x252_Grey82 ctermfg=252 guifg=#d0d0d0
hi x253_Grey85 ctermfg=253 guifg=#dadada
hi x254_Grey89 ctermfg=254 guifg=#e4e4e4
hi x255_Grey93 ctermfg=255 guifg=#eeeeee

" Functions ============================================================== {{{1
"
" Toggle tabstop, shiftwidth, expandtab for current buffer between 4 and 8 {{{2
function! MyToggleTabstop()
    if &ts == 4
        setl ts=8 sw=8 noet
    elseif &ts == 8
        setl ts=4 sw=4 et
    endif
    echo 'tabstop(' &ts ')' 'shiftwidth(' &sw ')' 'expandtab(' &et ')'
endfunction
nmap <silent> ,tt :call MyToggleTabstop()<CR>

" Toggle quickfix window ------------------------------------------------- {{{2
function! MyToggleQuickFix()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nmap <silent> ,tq :call MyToggleQuickFix()<CR>

" Toggle column highlighting --------------------------------------------- {{{2
if version >= 703
    " Toggle textwidth end column highlighting
    function! MyToggleColorcolumn()
      if empty(&colorcolumn)
          setl colorcolumn=+1
      else
          setl colorcolumn=
      endif
      set colorcolumn?
    endfunction

    nmap <silent> ,tc :call MyToggleColorcolumn()<CR>
endif

" Toggle virtual edit ---------------------------------------------------- {{{2
function! MyToggleVirtualEdit()
    if &ve == "all"
        set ve=""
    elseif empty(&ve)
        set ve=\all
    endif
    set ve?
endfunction

nmap <silent> ,tv :call MyToggleVirtualEdit()<CR>

" Toggle fold marker ----------------------------------------------------- {{{2
let s:old_fdm = ''
function! MyToggleFoldMarker()
    if &foldmarker == "{{{,}}}"
        let s:old_fdm = &foldmethod
        setl foldmethod=marker foldmarker=<<<<<<<,>>>>>>>
    else
        let &foldmethod = s:old_fdm
        setl foldmarker={{{,}}}
    endif
    set foldmethod? foldmarker?
endfunction

nmap <silent> ,tm :call MyToggleFoldMarker()<CR>

" Toggle doxygen syntax -------------------------------------------------- {{{2
let s:old_syntax = ''
function! MyToggleDoxygenSyntax()
    if &syntax != "cpp.doxygen"
        let s:old_syntax = &syntax
        setl syntax=cpp.doxygen
    else
        let &syntax=s:old_syntax
    endif
    set syntax?
endfunction

nmap <silent> ,td :call MyToggleDoxygenSyntax()<CR>

" Reload cscope db ------------------------------------------------------- {{{2
function! MyCscopeReload()
    cs kill 0
    cs add cscope.out
endfunction

nmap <silent> ,csr :call MyCscopeReload()<CR>

" Run perlcritic on current file ----------------------------------------- {{{2
function! MyPerlcritic(level)
    let l:old_makeprg = &makeprg
    let l:cmd = 'perlcritic --severity ' . a:level . ' --quiet --verbose "\%f:\%l:\%m\n" %'
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

nmap ,pc1 :call MyPerlcritic(1)<CR>
nmap ,pc2 :call MyPerlcritic(2)<CR>
nmap ,pc3 :call MyPerlcritic(3)<CR>
nmap ,pc4 :call MyPerlcritic(4)<CR>
nmap ,pc5 :call MyPerlcritic(5)<CR>

" Run perl -c on current file ------------------------------------------- {{{2
function! MyPerlcompile()
    let l:old_makeprg = &makeprg
    let l:cmd = '/usr/share/vim/vim73/tools/efm_perl.pl -c % $*'
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

nmap ,pm :call MyPerlcompile()<CR>

" Run perl on current file ---------------------------------------------- {{{2
function! MyPerlrun()
    let l:old_makeprg = &makeprg
    let l:cmd = 'perl % $*'
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

nmap ,pr :call MyPerlrun()<CR>

" tabline  --------------------------------------------------------------- {{{2
"
function MyTabLabel(n)

    let l:tab_num = tabpagenr()
    let l:win_nr = tabpagewinnr(a:n)
    let l:buf_list = tabpagebuflist(a:n)

    " select the highlighting for tab number
    let l:label = (a:n == l:tab_num ? '%1*' : '%2*') . ' '

    " add tab's serial number followed by number of opened windows in tabpage
    let l:label .= a:n . ':' . len( l:buf_list )

    " add '+' if one of the buffers in the tab page is modified
    for l:buf_num in l:buf_list
        if getbufvar(l:buf_num, "&modified")
            " select the highlighting for modified flag
            let l:label .= (a:n == l:tab_num ? '%3*' : '%4*')
            let l:label .= '+'
            break
        endif
    endfor

    " select the highlighting for main text
    let l:label .= (a:n == l:tab_num ? '%#TabLineSel#' : '%#TabLine#')

    " add delimiter
    let l:label .= ' '

    " append file name with shortened path
    let l:file_name = pathshorten( simplify( bufname( l:buf_list[l:win_nr - 1] ) ) )
    let l:label .= (l:file_name == '' ? '[No Name]' : l:file_name)

    return l:label . ' '

endfunction

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        "let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
        let s .= MyTabLabel(i + 1)

    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        "let s .= '%=%#TabLine#%999Xclose'
        let s .= '%=%#TabLine#%999XX'
    endif

    return s
endfunction

set tabline=%!MyTabLine()

" various tabline funcs  ------------------------------------------------- {{{3
"
" function MyTabline()
"   let label = v:lnum
"   let label .= ') '
"   let bufnrlist = tabpagebuflist(v:lnum)
"
"   " Add '+' if one of the buffers in the tab page is modified
"   for bufnr in bufnrlist
"     if getbufvar(bufnr, "&modified")
"       let label = '+'.label
"       break
"     endif
"   endfor
"
"   " Append the number of windows in the tab page if more than one
"   let wincount = tabpagewinnr(v:lnum, '$')
"   if wincount > 1
"     let label .= wincount
"   endif
"   if label != ''
"     let label .= ' '
"   endif
"
"   " Append the buffer name
"   return label . pathshorten(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]))
" endfunction
"
" function MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   return bufname(buflist[winnr - 1])
" endfunction
"
" function MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " select the highlighting
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (i + 1) . 'T'
"
"     " the label is made by MyTabLabel()
"     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
"   endfor
"
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
"
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999Xclose'
"   endif
"
"   return s
" endfunction

" set tabline=%{MyTabline()}
" set tabline=%!MyTabLine()

"    function MyTabLine()
"        let tabline = ''
"
"        " Формируем tabline для каждой вкладки -->
"            for i in range(tabpagenr('$'))
"                " Подсвечиваем заголовок выбранной в данный момент вкладки.
"                if i + 1 == tabpagenr()
"                    let tabline .= '%#TabLineSel#'
"                else
"                    let tabline .= '%#TabLine#'
"                endif
"
"                " Устанавливаем номер вкладки
"                let tabline .= '%' . (i + 1) . 'T'
"
"                " Получаем имя вкладки
"                let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
"            endfor
"        " Формируем tabline для каждой вкладки <--
"
"        " Заполняем лишнее пространство
"        let tabline .= '%#TabLineFill#%T'
"
"        " Выровненная по правому краю кнопка закрытия вкладки
"        if tabpagenr('$') > 1
"            let tabline .= '%=%#TabLine#%999XX'
"        endif
"
"        return tabline
"    endfunction
"
"    function MyTabLabel(n)
"        let label = ''
"        let buflist = tabpagebuflist(a:n)
"
"        " Имя файла и номер вкладки -->
"            let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')
"
"            if label == ''
"                let label = '[No Name]'
"            endif
"
"            let label .= ' (' . a:n . ')'
"        " Имя файла и номер вкладки <--
"
"        " Определяем, есть ли во вкладке хотя бы один
"        " модифицированный буфер.
"        " -->
"            for i in range(len(buflist))
"                if getbufvar(buflist[i], "&modified")
"                    let label = '[+] ' . label
"                    break
"                endif
"            endfor
"        " <--
"
"        return label
"    endfunction
"
"    function MyGuiTabLabel()
"        return '%{MyTabLabel(' . tabpagenr() . ')}'
"    endfunction
"
"    set tabline=%!MyTabLine()
"    set guitablabel=%!MyGuiTabLabel()

" modeline =============================================================== {{{1
" vim: set fdm=marker:
"
" 1}}}
