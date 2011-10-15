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
colorscheme elflord
"
" enable 256 colors in terminal
"set t_Co=256

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
set ruf=%43([%3b/0x%-2B]\ Col:%-3v\ Line:%4l/%-4L\ [%P]%)
set nowrap
set showcmd
set wmh=0
set wildmenu
" show statusline even if there is only one window
set laststatus=2
" let yourself know what mode you're in
set showmode
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
set sessionoptions-=curdir
set sessionoptions+=sesdir

" Plugin options ========================================================= {{{1
" bash syntax ------------------------------------------------------------ {{{2
"
let is_bash = 1
let g:sh_fold_enabled= 1

" perl syntax ------------------------------------------------------------ {{{2
"
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

" Mappings =============================================================== {{{1
"
" Shortened commands ----------------------------------------------------- {{{2
"
" make 'Y' to be more consistent with 'D','C','S'
nmap Y y$

" map CTRL-s to do what ',' used to do
nnoremap <c-s> ,
vnoremap <c-s> ,

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
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

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

" Highlight all instances of the current word under the cursor
"nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search
" register and display matches
"nmap <silent> ,gs
     " \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
"nmap <silent> ,gw
     " \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
"nmap <silent> ,gW
     " \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words
"nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
"nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
"nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" find highlight group of symbol under cursor
"nmap <silent> <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     " \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     " \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     " \ . ">"<CR>

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
noremap <silent> <M-Left>   :vertical resize -5<CR>
noremap <silent> <M-Up>     :resize +5<CR>
noremap <silent> <M-Down>   :resize -5<CR>
noremap <silent> <M-Right>  :vertical resize +5<CR>
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

" split buffer with file from the same directory as current one
" allowing to autocomplete the name with <Tab>
nmap <silent> ,sp :sp %:p:h/<C-X>

" open empty buffer in split window
nmap <silent> ,nw :new <CR>

" open empty buffer in new tab
nmap <silent> ,nt :tabnew <CR>

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

" MarksBrowser
nmap <F5>   :MarksBrowser<CR>

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

" reading Ms-Word documents, requires antiword
autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc %!antiword "%"

" highlight trailing whitespaces with color of TODO hl group
autocmd BufRead * match Todo /\s\+$/
autocmd BufNew  * match Todo /\s\+$/

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

" tabline  --------------------------------------------------------------- {{{2
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

"======================================================================
" vim: set fdm=marker:
"
" 1}}}
