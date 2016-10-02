" Options ================================================================ {{{1

if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

" enconding
set encoding=utf-8
scriptencoding utf-8

" forget being compatible with good old vi
set nocompatible

" this should be at the beginning to allow pathogen plugin to generate
" runtimepath before other plugings are loaded
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()

" detect operating system
let s:os = substitute(system('uname'), "\n", "", "")

" detect terminal emulator
let s:term_prog     = substitute(system('printenv TERM_PROGRAM'), "\n", "", "")
let s:term_session  = substitute(system('printenv SESSIONTYPE'), "\n", "", "")
let s:iterm_profile = substitute(system('printenv ITERM_PROFILE'), "\n", "", "")

" Filetype --------------------------------------------------------------- {{{2
"
filetype indent on
filetype plugin on

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
if match($TERM, '256color') != -1
    set t_Co=256
endif

if s:term_prog == "iTerm.app" && s:iterm_profile =~? ".*solarized.*" || s:term_session == "gnome-session"
    if s:os == "Linux" && !empty($TMUX)
        set background=dark
    endif
    colorscheme solarized
else
    colorscheme chumakd-elflord
endif

" enable ToggleBG command from solarized plugin for light/dark bg switching
runtime autoload/togglebg.vim

" disable Powerline plugin if we don't have full color terminal
" because it makes status line totally black in this mode
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
set foldopen+=insert,jump

" set 'foldmethod' to 'manual' when entering insert mode
" this improves completion speed in order of magnitude
" from http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

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
"

set dictionary=/usr/share/dict/words

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
"set rulerformat=%43([%3b/0x%-2B]\ %y\ Line:%4l:%-2v/\ %-4L\ [%P]%)

" show statusline even if there is only one window
set laststatus=2

"set statusline=%f\ %=\ <\ ts:%{&ts}\ et:%{&et}\ <\ %{&ff}\ <\ %{&enc}\ <\ %{&ft}\ \ \ LN:%3l:%-2v/\ %-4L\ [%P]
if version >= 703
    set statusline=%h%w%q\ %f\ \%m%r\ %=\ <\ ts:%{&ts}\ et:%{&et}\ <\ %{&ft}\ \ \ LN:%3l:%-2v/\ %-4L\ [%P]
else
    set statusline=%h%w\ %f\ \%m%r\ %=\ <\ ts:%{&ts}\ et:%{&et}\ <\ %{&ft}\ \ \ LN:%3l:%-2v/\ %-4L\ [%P]
endif

set tabline=%!MyTabLine()

" let yourself know what mode you're in
set showmode

set nowrap
set showcmd
set winminheight=0
set wildmenu
"set textwidth=78

" disable any fillchars for folds and vertical splits
" NOTE: the space after vert: is essential
set fillchars=fold:\ ,vert:\ 

" turn on cursor highliting for current window
"set cursorline
"set cursorcolumn
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn

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

" don't update the display while executing macros
set lazyredraw

set novisualbell

" hide the mouse pointer while typing
set mousehide

" when the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
"set scrolloff=8

if version >= 703
  " show line numbers relative to cursor position
  set relativenumber
else
  set number
endif

set numberwidth=3

" highlight textwidth column
"set colorcolumn=+1

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

" show cscope search results in quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Edit ------------------------------------------------------------------- {{{2
"

" ask to save/not/cancel if buffer is modified and going to be closed/unvisible
set confirm
set nohidden

" disable virtualedit by default
set virtualedit=

" set timeouts for keycodes and mappings
set timeout
set timeoutlen=700
"set ttimeoutlen=100
set ttimeoutlen=2

" speed up completion significantly

" don't allow ^N completion to scan included files by default
" that can be requested directly with i_^x^i
set complete-=i

" don't allow ^N completion to scan tags by default
" that can be requested directly with i_^x^]
set complete-=t

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

" Alternate -------------------------------------------------------------- {{{2
"
let g:alternateNoDefaultAlternate=0
let g:alternateRelativeFiles=1
"let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

" Bash syntax ------------------------------------------------------------ {{{2
"
let is_bash = 1
let g:sh_fold_enabled= 1

" BufExplorer ------------------------------------------------------------ {{{2
"
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitBelow=1
let g:bufExplorerShowRelativePath=1

" do not go to active window.
let g:bufExplorerFindActive=0

" CCTree ----------------------------------------------------------------- {{{2
"
let g:CCTreeOrientation = "rightbelow"
let g:CCTreeRecursiveDepth = 3
let g:CCTreeMinVisibleDepth = 1
let g:CCTreeWindowMinWidth = -1
let g:CCTreeDisplayMode = 2
let g:CCTreeWindowVertical = 1
let g:CCTreeUsePerl = 1
let g:CCTreeUseUTF8Symbols = 1
let g:CCTreeWindowMinWidth = 32
let g:CCTreeWindowWidth = 55

" Clang_complete --------------------------------------------------------- {{{2
"
" default clang completion mapping is i_<C-x><C-u>
"let g:clang_complete_auto = 0
let g:clang_omnicppcomplete_compliance = 1
if s:os == "Darwin"
  let g:clang_library_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
elseif s:os == "Linux"
  let g:clang_library_path = "/usr/lib/llvm-3.8/lib/libclang.so.1"
endif

" Conque shell ----------------------------------------------------------- {{{2
"
let g:ConqueTerm_Color = 0
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

" CSApprox --------------------------------------------------------------- {{{2
"

" disabled to not slowdown vim start-up time
let g:CSApprox_loaded = 1

" tune color palette for Konsole
let g:CSApprox_konsole = 1

" Cscope_quickfix -------------------------------------------------------- {{{2
"
let g:Cscope_OpenQuickfixWindow = 1
let g:Cscope_JumpError = 0
let g:Cscope_PopupMenu = 0
let g:Cscope_ToolsMenu = 0

" DelimitMate ------------------------------------------------------------ {{{2
"
let delimitMate_offByDefault = 1

" DirDiff ---------------------------------------------------------------- {{{2
"
let g:DirDiffEnableMappings = 1

" EasyMotion ------------------------------------------------------------- {{{2
"
hi EasyMotionTarget cterm=bold ctermbg=NONE ctermfg=red
hi EasyMotionShade  cterm=NONE ctermbg=NONE ctermfg=darkgray

" EnhancedCommentify ----------------------------------------------------- {{{2
"
let g:EnhCommentifyUseAltKeys = 'n'
let g:EnhCommentifyTraditionalMode = 'n'
let g:EnhCommentifyRespectIndent = 'y'
"let g:EnhCommentifyPretty = 'y'
let g:EnhCommentifyMultiPartBlocks = 'y'

" File explorer ---------------------------------------------------------- {{{2
"
let g:netrw_altv = 1

" Filer ------------------------------------------------------------------ {{{2
"
let g:vimfiler_as_default_explorer = 1

" GetLatestVimScripts ---------------------------------------------------- {{{2
"
let g:GetLatestVimScripts_allowautoinstall= 0

" Gundo ------------------------------------------------------------------ {{{2
"
let g:gundo_width = 75
"let g:gundo_preview_bottom = 1

" Indent guides ---------------------------------------------------------- {{{2
"
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"if g:colors_name == 'solarized' && !has("gui_running")
"    let g:indent_guides_auto_colors = 0
"    augroup indent_guides
"        au!
"        au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=white
"        au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
"    augroup end
"endif

" Latex suite ------------------------------------------------------------ {{{2
"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_ViewRule_dvi = "okular"
let g:Tex_ViewRule_ps  = "okular"
"let g:Tex_ViewRule_pdf = "acroread"
let g:Tex_ViewRule_pdf = "okular"
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

" MRU -------------------------------------------------------------------- {{{2
"
let MRU_Max_Entries = 1000
let MRU_Add_Menu = 0
let MRU_Auto_Close = 1

" MultipleSearch --------------------------------------------------------- {{{2
"
let g:MultipleSearchMaxColors=8
let g:MultipleSearchColorSequence="red,blue,green,magenta,cyan,gray,brown,yellow"
let g:MultipleSearchTextColorSequence="white,white,black,white,black,black,white,black"

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

" Omnicppcomplete -------------------------------------------------------- {{{2
"
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowPrototypeInAbbr = 1

" Perl syntax ------------------------------------------------------------ {{{2
"

" this is managed via symlinks in after/syntax/perl/
"augroup perl_contrib
"    autocmd!
"    autocmd FileType perl runtime contrib/highlight-all-pragmas.vim
"    autocmd FileType perl runtime contrib/carp.vim
"    autocmd FileType perl runtime contrib/moose.vim
"    autocmd FileType perl runtime contrib/function-parameters.vim
"    autocmd FileType perl runtime contrib/method-signatures.vim
"    autocmd FileType perl runtime contrib/test-more.vim
"    autocmd FileType perl runtime contrib/try-tiny.vim
"augroup end

let perl_fold = 1
" disabled, until it becomes more sofisticated
"let perl_fold_blocks = 1

" enable syntax highlighting for perl POD documentation
let perl_include_pod = 1

" Perl-local-lib-path ---------------------------------------------------- {{{2
"
let g:perl_local_lib_path = "lib"
let perl_inc_path = system("perl -e 'print join qq(,), @INC'")
if !empty(perl_inc_path)
    let g:perl_local_lib_path = g:perl_local_lib_path ."," . perl_inc_path
endif
autocmd FileType perl PerlLocalLibPath

" Perl-support ----------------------------------------------------------- {{{2
"
let g:Perl_Ctrl_j   = 'off'

" Powerline -------------------------------------------------------------- {{{2
"

" temporarily disable powerline plugin because it has several look&feel issues
" but keep it enabled for Gvim (because I rarely use it anyway ;)
if !has("gui_running")
    let g:Powerline_loaded = 1
endif

" options
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'relative'

" theme and colors
"let g:Powerline_theme = 'skwp'
"let g:Powerline_colorscheme = 'chumakd'
let g:Powerline_colorscheme = 'solarized256'

" add total line number segment after lineinfo
"call Pl#Theme#InsertSegment('charcode', 'before', 'scrollpercent')
"call Pl#Theme#ReplaceSegment('lineinfo', 'linesinfo:lineinfo')

" Project ---------------------------------------------------------------- {{{2
"
let g:proj_window_width = 32
let Tlist_Show_One_File = 1
"let g:proj_flags .= "g"

" quick-scope ------------------------------------------------------------ {{{2
"
" disabled by default, see plugin mappings
let g:qs_enable = 0

" R ------------------------------------------------------------------ {{{2
"
let vimrplugin_r_args = "--no-save --quiet"
let vimrplugin_term = "xterm"
let vimrplugin_vimpager = "horizontal"
let vimrplugin_screenplugin = 0
let vimrplugin_conqueplugin = 1

" disable the underscore replacement with <-
let vimrplugin_underscore = 0

" open .Rout files in a split window
let vimrplugin_notab = 1

" show list elements in object browser
"let vimrplugin_open_list = 1

" Securemodeline --------------------------------------------------------- {{{2
"
let g:secure_modelines_verbose=1

" SessionMan ------------------------------------------------------------- {{{2
"
let sessionman_save_on_exit = 0

" Showmarks -------------------------------------------------------------- {{{2
"
let g:showmarks_enable = 0
let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" Solarized -------------------------------------------------------------- {{{2
"
" set this for terminals which haven't got custom solarized color palette installed
"let g:solarized_termcolors=256

" Syntastic -------------------------------------------------------------- {{{2
"
let g:syntastic_check_on_open=0
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height = 3

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [
                           \    'asciidoc',
                           \    'dockerfile',
                           \    'eruby',
                           \    'haml',
                           \    'javascript',
                           \    'json',
                           \    'lua',
                           \    'markdown',
                           \    'perl',
                           \    'pod',
                           \    'ruby',
                           \    'sass',
                           \    'scss',
                           \    'sh',
                           \    'spec',
                           \    'vim',
                           \    'yaml'
                           \  ],
                           \ 'passive_filetypes': [] }

" C/C++ options
let g:syntastic_clang_check_config_file = '.clang_complete'
let g:syntastic_c_checkers = ['clang_check', 'clang_tidy', 'gcc']
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_checkers = ['clang_check', 'clang_tidy', 'gcc']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++14'

" Perl options
let g:syntastic_perl_checkers = ['perlcritic', 'podchecker']
let g:syntastic_perl_perlcritic_post_args = '--verbose "%s:%f:%l:%c: %s/%p %m (%e)\n"'

" Ruby options
let g:syntastic_ruby_checkers = ['rubylint', 'robocop']

" Bash/Shell options
let g:syntastic_sh_checkers = ['bashate']
" E003: Indent not multiple of 4
" E006: Line too long
" E042: local declaration hides errors
let g:syntastic_sh_bashate_args = '--ignore "E006,E042,E003"'

" Haml options
let g:syntastic_haml_checkers = ['haml_lint']

" JavaScript options
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_javascript_checkers = ['eslint']

" VimL options
let g:syntastic_vim_checkers = ['vint']

" YAML options
let g:syntastic_yaml_checkers = ['yamllint', 'yamlxs']
let g:syntastic_yaml_yamllint_args = '-c ~/.yamllintrc.yml'

" Tagbar ----------------------------------------------------------------- {{{2
"
let g:tagbar_left = 1
let g:tagbar_width = 33
let g:tagbar_sort = 0

" Taglist ---------------------------------------------------------------- {{{2
"
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 35

" Unite ------------------------------------------------------------------ {{{2
"

" enable fuzzy matching by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Xml -------------------------------------------------------------------- {{{2
"
let g:xml_syntax_folding = 1

" YankRing --------------------------------------------------------------- {{{2
"

" ommit single letter deletes
let g:yankring_min_element_length = 2

" don't store yankring contents between vim restarts
"let g:yankring_persist = 0

" don't share yankring contents between different instances of vim
"let g:yankring_share_between_instances = 0

" YouCompleteMe ---------------------------------------------------------- {{{2
"

" needed for Syntastic
"let g:ycm_show_diagnostics_ui = 0

" Zencoding -------------------------------------------------------------- {{{2
"
let g:user_zen_leader_key = '\z'

" Mappings =============================================================== {{{1

" Shortened commands ----------------------------------------------------- {{{2
"

" let yankstack plugin to know that we remap default Y behavior
call yankstack#setup()

" make 'Y' to be more consistent with 'D','C','S'
nmap Y y$

" search of selected text in visual mode
vmap * y/<C-R>"<CR>
vmap # y?<C-R>"<CR>

" quit all windows (by analogy with ZZ and ZQ)
nmap ZA :qa<CR>

" don't jump to the next occurrence of the word, but just highlight it
nnoremap *   *N
nnoremap g*  g*N
nnoremap #   #N
nnoremap g#  g#N

" Highlight all instances of the current word under the cursor
"nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Ctrl mappings ---------------------------------------------------------- {{{2
"

" Yankstack
" TODO: change P to p
nmap <C-P> <Plug>yankstack_substitute_older_paste

" map CTRL-s to do what ',' used to do
nnoremap <C-s> ,
vnoremap <C-s> ,

" Tagselect
" open current file in new tab and do :Tselect on a word  under cursor
nmap <C-t>] :tab split<CR>:exec("Ts ".expand("<cword>"))<CR>

" Maps to make handling windows a bit easier ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {{{3
"

" switch window with full expand
" TODO: change to lowercase
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-H> <C-W>h<C-W>\|
nnoremap <C-L> <C-W>l<C-W>\|

" adjust window size by one
nnoremap <silent> <C-Left>   <C-W><
nnoremap <silent> <C-Up>     <C-W>+
nnoremap <silent> <C-Down>   <C-W>-
nnoremap <silent> <C-Right>  <C-W>>

" Alt mappings ----------------------------------------------------------- {{{2
"

" intro to Alt keys mapping in vim :h :map-alt-keys

" map Alt-key combinations to escape codes (this is required because all major
" terminals use escape codes for Alt- combinations instead of setting 8th bit
" as vim expects by default)

" these M-hjkl mappings are disabled cause they cause problems with macros
" for some key combinations, like ESC-j, which turns into ê

" we need :exectue here to substitue \e with the actual escape code
"execute "set <M-h>=\eh"
"execute "set <M-j>=\ej"
"execute "set <M-k>=\ek"
"execute "set <M-l>=\el"

" adjust window size (MacOS)
"nnoremap <silent> <M-h>  <C-W><
"nnoremap <silent> <M-j>  <C-W>+
"nnoremap <silent> <M-k>  <C-W>-
"nnoremap <silent> <M-l>  <C-W>>

" Latex Suite
" this mapping is required to be done in vimrc, see latex suite docs
nmap <A-]> <Plug>IMAP_JumpForward
vmap <A-]> <Plug>IMAP_JumpForward

" Perl support
" TODO: use au for perl file types
"nmap <silent> <A-j>  i<C-R>=Perl_JumpCtrlJ()<CR>

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
noremap <silent> <M-Left>   :exec 'silent! tabmove ' . (tabpagenr() - 2)<CR>

" \ mappings ------------------------------------------------------------- {{{2
"

" Color shceme
" nmap <Leader>\]  :call NextColorScheme()<CR>
" nmap <Leader>\[  :call PreviousColorScheme()<CR>

" = (indent) ~~~~~~~~~~~~~~~~ {{{3
"

" indent selected C code using `indent` command with linux kernel coding style
vmap \= :!indent -linux<CR>

" a (alternate) ~~~~~~~~~~~~~ {{{3
"

" Alternate
nmap <silent> <Leader>aa :A<CR>
nmap <silent> <Leader>as :AS<CR>
nmap <silent> <Leader>av :AV<CR>
nmap <silent> <Leader>at :AT<CR>

" b (buffexplorer) ~~~~~~~~~~ {{{3
"

" BuffExplorer uses the following mappings:
"   \be - to start exploring in the current window
"   \bs - to start exploring in a newly split horizontal window
"   \bv - to start exploring in a newly split vertical window
" open new tab and start exploring
nmap \bt :tabnew<Bar>BufExplorer<CR>
" \bt breaks default \be mapping, so we need to restore it
nmap \be :BufExplorer<CR>

" d (diffchanges) ~~~~~~~~~~~ {{{3
"

" DiffChanges
nmap <silent> <Leader>ddt :DiffChangesDiffToggle<CR>
nmap <silent> <Leader>dpt :DiffChangesPatchToggle<CR>

" l (Latex-Suite) ~~~~~~~~~~~ {{{3
"

" Latex-Suite

" default latex-suite mappings:
" \ll - Compile
" \lv - View
" \ls - ForwardSearch

"augroup CustomLatexSuite
    "au!
    "au! BufRead,BufNewFile *.tex  nmap <F9>
"augroup end

" q (quick-scope) ~~~~~~~~~~~ {{{3
"

" quick-scope
nmap <leader>q <plug>(QuickScopeToggle)

" s (sessionman) ~~~~~~~~~~~~ {{{3
"

" SessionMan
nmap <silent> \so :SessionOpen <C-X>
nmap <silent> \sc :SessionClose<CR>
nmap <silent> \ss :SessionSave<CR>
nmap <silent> \sl :SessionList<CR>

" u (unite) ~~~~~~~~~~~~~~~~~ {{{3
"

" Unite

" the prefix key.
nnoremap  [unite]   <Nop>
nmap  <leader>u [unite]

nnoremap <silent> [unite]a :Unite -start-insert mapping<CR>
nnoremap <silent> [unite]b :Unite -start-insert buffer<CR>
nnoremap <silent> [unite]c :Unite -start-insert command<CR>
nnoremap <silent> [unite]d :UniteWithBufferDir -start-insert file_rec/async:!<CR>
nnoremap <silent> [unite]f :Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> [unite]j :Unite jump<CR>
nnoremap <silent> [unite]m :Unite -start-insert file_mru<CR>
nnoremap <silent> [unite]r :Unite register<CR>
nnoremap <silent> [unite]t :Unite -start-insert tab<CR>

" , mappings ------------------------------------------------------------- {{{2
"

" /? (search) ~~~~~~~~~~~~~~~ {{{3
"
"nmap <silent> ,/
"nmap <silent> ,?

" b (blockdiff) ~~~~~~~~~~~~~ {{{3
"

" BlockDiff
vmap ,b1 :call BlockDiff_GetBlock1()<CR>
vmap ,b2 :call BlockDiff_GetBlock2()<CR>

" c (camelcasemotion) ~~~~~~~ {{{3
"

" CamelCaseMotion
map <silent> ,,w <Plug>CamelCaseMotion_w
map <silent> ,,b <Plug>CamelCaseMotion_b
map <silent> ,,e <Plug>CamelCaseMotion_e

" c (cd/cscope) ~~~~~~~~~~~~~ {{{3
"

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" reload cscope database
nmap <silent> ,csr :call MyCscopeReload()<CR>

" cc (close) ~~~~~~~~~~~~~~~~ {{{3
"

" close current window
noremap <silent> ,cc :close<CR>

" close neighbour windows
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>

" close current tab
noremap <silent> ,ct :tabclose<CR>

" close lOcation window
noremap <silent> ,co :lclose<CR>

" close quickfix window (not used now becaue QF is toggled by ,tq)
"noremap <silent> ,cw :cclose<CR>

" ct (cctree) ~~~~~~~~~~~~~~~ {{{3
"

" CCTree
nmap <silent> ,cto :CCTreeOptsEnable EnhancedSymbolProcessing<CR>
nmap <silent> ,ctl :CCTreeLoadDB<CR>
nmap <silent> ,ctr :CCTreeLoadXRefDB<CR>
nmap <silent> ,cts :CCTreeSaveXRefDB<CR>
nmap <silent> ,ctt :CCTreeWindowToggle<CR>

" d ~~~~~~~~~~~~~~~~~~~~~~~~~ {{{3
"

" Delete all buffers
"nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" e (edit) ~~~~~~~~~~~~~~~~~~ {{{3
"

" edit buffer with file from the same directory as current one
" allowing to autocomplete the name with <Tab>
nmap <silent> ,ee :e %:p:h/<C-X>

" f (fuzzyfinder) ~~~~~~~~~~~ {{{3
"

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

" g (grep/git) ~~~~~~~~~~~~~~ {{{3
"

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

" Fugitive/Git
nmap <silent> ,gs :Git status<CR>
nmap <silent> ,gd :Git diff<CR>
nmap <silent> ,gt :!tig<CR>

" Git-gutter
nmap <silent> ,gg :GitGutterToggle<CR>

" hjkl ~~~~~~~~~~~~~~~~~~~~~~ {{{3
"

" switch between windows
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>

" m (make) ~~~~~~~~~~~~~~~~~~ {{{3
"

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
"nmap <silent> ,md :!mkdir -p %:p:h<CR>

" run make in current directory
nmap ,m :Make<CR>
nmap ,M :Make!<CR>

" o (lOcation window) ~~~~~~~ {{{3
"

" open location window
noremap <silent> ,oo :lopen<CR>

" p (perl) ~~~~~~~~~~~~~~~~~~ {{{3
"

" perlcritic
nmap ,pC1 :call MyPerlcritic(1)<CR>
nmap ,pC2 :call MyPerlcritic(2)<CR>
nmap ,pC3 :call MyPerlcritic(3)<CR>
nmap ,pC4 :call MyPerlcritic(4)<CR>
nmap ,pC5 :call MyPerlcritic(5)<CR>

" perl make (compile only)
nmap ,pc :call MyPerlcompile()<CR>

" perl run (execute script in current buffer)
nmap ,pr :call MyPerlrun()<CR>

" perltidy
nmap ,pt :.!perltidy<CR>
vmap ,pt :!perltidy<CR>

" p (prev) ~~~~~~~~~~~~~~~~~~ {{{3
"

" go to previous (last accessed) window.
" this is the same as ,wp mapping, just shorter
noremap <silent> ,p :wincmd p<CR>

" r (run/remove) ~~~~~~~~~~~~ {{{3
"

" Run the command that was just yanked
"nmap <silent> ,rc :@"<cr>

" remove trailing spaces
nmap <silent> ,rs :%s/\s\+$//<CR>

" s (scroll/swap/split) ~~~~~ {{{3
"

" Show all available VIM servers
"nmap <silent> ,ss :echo serverlist()<CR>

" make vertical scrolling easier
nmap <silent> ,se 10<C-e>
nmap <silent> ,sy 10<C-y>

" make horizontal scrolling easier
nmap <silent> ,sl 5zl
nmap <silent> ,sh 5zh

" Swap two words
nmap <silent> ,sw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" split buffer with file from the same directory as current one
" allowing to autocomplete the name with <Tab>
nmap <silent> ,sp :sp %:p:h/<C-X>

" t (toggles) ~~~~~~~~~~~~~~~ {{{3
"

" toggle textwidth column highlighting
if version >= 703
    nmap <silent> ,tc :call MyToggleColorcolumn()<CR>
endif

" toggle scrollbind
nmap <silent> ,tb :set invscrollbind<CR>:set scrollbind?<CR>

" toggle doxygen comments highlighting
nmap <silent> ,td :call MyToggleDoxygenSyntax()<CR>

" DelimitMate
nmap <silent> ,tdm :DelimitMateSwitch<CR>

" toggle search inside folds
nmap <silent> ,tf :call MyToggleFoldSearch()<CR>

" colorscheme solarized
nmap <silent> ,tg :ToggleBG<CR>

" toggle list option
nmap <silent> ,tl :set invlist<CR>:set list?<CR>

" toggle fold marker between syntax and git merge markers
nmap <silent> ,tm :call MyToggleFoldMarker()<CR>

" toggle highlight search
"nmap <silent> ,tn :set invhls<CR>:set hls?<CR>

" disable current highlight search
nmap <silent> ,tn :nohlsearch<CR>

" toggle paste mode
nmap <silent> ,tp :set invpaste<CR>:set paste?<CR>

" toggle spell check
nmap <silent> ,ts :set invspell<CR>:set spell?<CR>

" toggle read-only mode
nmap <silent> ,tr :set invreadonly<CR>:set readonly?<CR>

nmap <silent> ,tt :call MyToggleTabstop()<CR>

nmap <silent> ,tq :call MyToggleQuickFix()<CR>

nmap <silent> ,tv :call MyToggleVirtualEdit()<CR>

" toggle text wrapping
nmap <silent> ,tw :set invwrap<CR>:set wrap?<CR>

" toggle text width
nmap <silent> ,t0 :set textwidth=0<CR>:set tw?<CR>
nmap <silent> ,t8 :set textwidth=80<CR>:set tw?<CR>
nmap <silent> ,t78 :set textwidth=78<CR>:set tw?<CR>

" u (update) ~~~~~~~~~~~~~~~~ {{{3
"

" save current buffer
nmap ,u :update<CR>

" Underline the current line with '='
"nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" v (vimrc) ~~~~~~~~~~~~~~~~~ {{{3
"

" edit the vimrc file
nmap <silent> ,ve :e $MYVIMRC<CR>
nmap <silent> ,vs :so $MYVIMRC<CR>

" w (window) ~~~~~~~~~~~~~~~~ {{{3
"

" TODO: use noremap only when it's really needed

" make windows sizes equal
noremap <silent> ,w= :wincmd =<CR>

" edit new empty buffer in current window
noremap <silent> ,we :enew<CR>

" full expand current window
noremap <silent> ,wf :wincmd _<CR>

" split new empty buffer
noremap <silent> ,wn :new<CR>

" go to previous (last accessed) window.
noremap <silent> ,wp :wincmd p<CR>

" split window
noremap <silent> ,ws :wincmd s<CR>

" open empty buffer in new tab
nmap <silent> ,wt :tabnew <CR>

" split window vertically
noremap <silent> ,wv :wincmd v<CR>

" exchange current and pervious windows
noremap <silent> ,wx :wincmd x<CR>

" Cmdline editing -------------------------------------------------------- {{{2
"

" remap <C-f> (which is used to open command-line window) to <C-y>
set cedit=<C-Y>

" following mappings are now provided by vim-rsi plugin:

" allow command line editing like emacs
"cnoremap <C-A>  <Home>
"cnoremap <C-B>  <Left>
"cnoremap <C-F>  <Right>
"cnoremap <M-b>  <S-Left>
"cnoremap <M-f>  <S-Right>
"cnoremap <ESC>b <S-Left>
"cnoremap <ESC>f <S-Right>

" allow command line completion with Alt key
"cnoremap <M-p>  <Up>
"cnoremap <M-n>  <Down>
"cnoremap <ESC>p <Up>
"cnoremap <ESC>n <Down>

" Fn keys appings -------------------------------------------------------- {{{2
"

" build ctags/cscope for Asm/C/C++/Perl/Python/Shell/Make project in current dir
nmap <F2> :!mktags -acxpyems<CR>

" same as above but without Make
"nmap <S-F2> :!mktags -acxps<CR>

" Project
"nmap <S-F3> :Project vimproject<CR>
"nmap <F3>   <Plug>ToggleProject

" MRU
nmap <F3>   :MRU<CR>

" TagList/Tagbar
nmap <F4>   :TagbarToggle<CR>
nmap <S-F4> :TlistToggle<CR>

" MarksBrowser
nmap <F5>   :MarksBrowser<CR>

" Gundo
nmap <F6>   :GundoToggle<CR>

" Syntastic
nmap <F7>   :SyntasticCheck<CR>

" NERDTree
nmap <F8>   :NERDTreeToggle<CR>
nmap <S-F8> :NERDTree %:p:h<CR>

" Show syntax highlighting groups for word under cursor
nmap <S-F9> :call <SID>SynStack()<CR>

" find highlight group of symbol under cursor
nmap <silent> <M-F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
      \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
      \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
      \ . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")
      \ . " BG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#")<CR>

" Commands =============================================================== {{{1
"

" show current highlight groups in new buffer
command! Hitest    runtime syntax/hitest.vim
command! Colortest runtime syntax/colortest.vim

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
"autocmd BufReadPre  *.doc set ro
"autocmd BufReadPost *.doc %!antiword "%"

" highlight trailing whitespaces with color of TODO/IncSearch hl group
if g:colors_name == 'solarized'
    augroup trailing_spaces
        autocmd!
        autocmd! BufNew   * match IncSearch /\s\+$/
        autocmd! BufRead  * match IncSearch /\s\+$/
        autocmd! BufEnter * match IncSearch /\s\+$/
    augroup END
else
    augroup trailing_spaces
        autocmd!
        autocmd! BufNew   * match Todo /\s\+$/
        autocmd! BufRead  * match Todo /\s\+$/
        autocmd! BufEnter * match Todo /\s\+$/
    augroup END
endif

" enable relative line numbers in tagbar window
if version >= 703
  au Filetype tagbar nested :set relativenumber
endif

" highlight comments in different color from main text, for 'conf' and 'cfg'
" filetypes, if we are usingsolarized colorscheme
if g:colors_name == 'solarized'
    let s:default_comments_color=10
    let s:comments_color=24
    augroup solarized_comments
        au!
        au! BufEnter  * if &ft == 'conf' || &ft == 'cfg' | exe 'hi Comment ctermfg='.s:comments_color | endif
        au! FileType  * exe 'hi Comment ctermfg='.s:default_comments_color
        au! FileType  conf\|cfg exe 'hi Comment ctermfg='.s:comments_color
        au! BufLeave  * exec 'hi Comment ctermfg='.s:default_comments_color
    augroup END
endif

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

" Fix Meta-Esc ----------------------------------------------------------- {{{2
"
" fix meta-keys which generate <Esc>a .. <Esc>z
function! MyFixMetaEsc()
    let c='a'
    while c <= 'z'
        "exec "set <M-".toupper(c).">=\e".c
        exec "set <M-".c.">=\e".c
        exec "imap \e".c." <M-".c.">"
        let c = nr2char(1+char2nr(c))
    endw
endfunction

" temporarily disable, because breaks ESC and immediate command
"call MyFixMetaEsc()

" Reload cscope db ------------------------------------------------------- {{{2
function! MyCscopeReload()
    cs kill 0
    cs add cscope.out
endfunction

" Run perlcritic on current file ----------------------------------------- {{{2
function! MyPerlcritic(level)
    let l:old_makeprg = &makeprg
    let l:cmd = 'perlcritic --severity ' . a:level . ' --quiet --verbose "\%f:\%l:\%m\n" %'
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

" Run perl -c on current file ------------------------------------------- {{{2
function! MyPerlcompile()
    let l:old_makeprg = &makeprg
    "let l:cmd = "$VIMHOME/tools/efm_perl_old.pl % $*"
    let l:cmd = pathogen#runtime_findfile('tools/efm_perl.pl', 0) . " % $*"
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

" Run perl on current file ---------------------------------------------- {{{2
function! MyPerlrun()
    let l:old_makeprg = &makeprg
    let l:cmd = "perl % $*"
    let &makeprg = l:cmd
    :make
    let &makeprg = l:old_makeprg
endfunction

" Syntax highlighting --------------------------------------------------- {{{2

" show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Toggle tabstop, shiftwidth, expandtab for current buffer between 4 and 8 {{{2
function! MyToggleTabstop()
    if &ts == 4
        setl ts=8 sw=8 noet
    elseif &ts == 8
        setl ts=4 sw=4 et
    endif
    echo 'tabstop(' &ts ')' 'shiftwidth(' &sw ')' 'expandtab(' &et ')'
endfunction

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

" Toggle cursor/column highlight ----------------------------------------- {{{2
function! MyToggleCursorColumnHl()
    if &cursorline && &cursorcolumn
        au! WinLeave *
        au! WinEnter *
        set nocursorline nocursorcolumn
        echo "disabled"
    else
        au WinLeave * set nocursorline nocursorcolumn
        au WinEnter * set cursorline cursorcolumn
        set cursorline cursorcolumn
        echo "enabled"
    endif
endfunction

" Toggle fold search ----------------------------------------------------- {{{2
function! MyToggleFoldSearch()
    if &foldopen =~ 'search'
        setl foldopen-=search
        echo 'foldopen-=search'
    else
        setl foldopen+=search
        echo 'foldopen+=search'
    endif
endfunction

" Set work project styling ----------------------------------------------- {{{2
function! MySetWorkStyling()
    set textwidth=80
    set colorcolumn=+1
    set makeprg=ssh\ devvm@centos7-devvm\ 'make\ -C\ /data/prj/mero'
    aug c_tab | au! FileType c  :setl tabstop=8 shiftwidth=8 noexpandtab
    cd ~/prj/mero
endfunction

command! MySetWorkStyling call MySetWorkStyling()

" tabline  --------------------------------------------------------------- {{{2
"
function! MyTabLabel(n)

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
    let l:cur_buf =  l:buf_list[l:win_nr - 1]
    let l:file_name = pathshorten( simplify( bufname(l:cur_buf) ) )
    let l:buf_type = getbufvar(l:cur_buf, '&buftype')
    let l:label .= l:file_name != ''          ? l:file_name
                 \ : l:buf_type == 'quickfix' ? '[Quickfix]'
                 \ :                            '[No Name]'

    return l:label . ' '

endfunction

function! MyTabLine()
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

" modeline =============================================================== {{{1
" vim: foldmethod=marker
"
" 1}}}
