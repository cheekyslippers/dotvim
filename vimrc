" Basic Stuff {

  set nocompatible                        " explicitly get out of VI-compatible mode
  set term=xterm-256color                 " ensure 256 color terminal settings are used in VIM
  set t_Co=256


  "Set background/visual highlight colours
  if &t_Co > 2 || has("gui_running")      " If terminal has colors set syntax highlighting on
  "  syntax on
    syntax enable
  endif

  colorscheme          elflord            " Choose a default color scheme
  behave xterm
" }

" Pathogen {
    call pathogen#infect()
    call pathogen#helptags()
" }

" Bundle {
"
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
 
  " Let Vundle manage Vundle
  Plugin 'gmarik/vundle'
 
  Plugin 'danilo-augusto/vim-afterglow'
  Plugin 'flazz/vim-colorschemes'

  " Installed bundles are listed here
"  Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"  Plugin 'klen/python-mode'
 
  filetype plugin indent on

  Bundle 'craigemery/vim-autotag'


" }



" General Stuff {

  filetype plugin indent on               " load filetype plugins and indent settings
  set backspace=indent,eol,start          " make backspace more flexible
  set autochdir                           " always change directory to the file your editing
  set backup                              " keep a backup file
  set bdir=~/backup,.,~/tmp,~/            " where to put backup files
  set directory=~/swp                     " where to put swap files
  set fileformats=unix,dos,mac            " support file formats in this order
  set selectmode=mouse
  set mouse=a                             " use mouse everywhere
  set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore these with * wildcards
  set wildmenu                            " turn on command-line completion
  set wildmode=list:longest               " turn on wild menu with a large list
  set autowrite                           " write files automatically when jumping between multiple windows
  set omnifunc=syntaxcomplete#Complete    " switch on auto-complete for syntax files

  "if &term =~ "^xterm\\|xterm256-color\\|cterm"
  let &t_SI = "\]12;CursorShape=1;yellow\x7"       " Cursor colour in insert mode
  let &t_EI = "\]12;CursorShape=0;yellow\x7"        " Cursor colour in command mode
  "endif



" }

" DIFF options {
  set diffopt+=iwhite                      " ignore white spaces when diffing two files
" }



" { VIM User Interface

  set cursorcolumn                        " highlight the current column
  "set cursorline                          " highlight the current line
  set history=50                          " keep 50 lines of command line history
  set incsearch                           " do incremental searching
  set laststatus=2                        " always show the last status line
  set lazyredraw                          " do not redraw while running macros - increases speed
  set linespace=0                         " no extra pixels between rows
  "set list                                " show tabs to ensure they are removed from files (set to nolist for now)
  set listchars=tab:>-,trail:-            " show tabs and trailing white space
  set nostartofline                       " Prevent the cursor from changing column from one line to the other
  set numberwidth=5                       " allows for up to 99999 lines
  set report=0                            " tell when anything is changed via :...
  set ruler                               " always show current position along the bottom
  set scrolloff=5                         " keep lines visible top and bottom before/after cursor
  set shortmess=atI                       " removed press a key prompt
  set showcmd                             " show the command being typed
  set hlsearch                            " enable highlighting of the last used search pattern
  set autoindent                          " always set autoindenting on
  set iskeyword-=-                        " the - could be used as a word divider

  au FileType verilog set iskeyword-=-       " force the iskeyword setting in verilog files
  au FileType verilog set inc=`include       " understand verilog include files
  au FileType verilog set define=`\s*define  " understand verilog define files

  set statusline=%t%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ \ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ [BN=%n]\ [PATH=%F]

  set number                              " turn on line numbers

  if version >= 700
     au InsertEnter * hi StatusLine ctermfg=Red
     au InsertLeave * hi StatusLine ctermfg=White
  endif
    

" }


" Text Formatting / Layout {

  set completeopt=menu,longest            " improve the way autocomplete works
  set expandtab                           " ensure no real tabs are created
  set formatoptions=rq                    " automatically insert comment leader on return
  set ignorecase                          " default as case insensitive
  set smartcase                           " become case sensitive if capitals are used
  "set nowrap                              " don't wrap text lines
  set shiftwidth=3                        " shift > by 3 spaces
  set softtabstop=3                       " soft tab to 3 spaces
  set tabstop=3                           " tab stops if used, will be 3 spaces
  set fileformat=unix                     " ensure compatibility with Unix file system (eg line-endings etc)

  match DiffDelete    /\s\+$/             " Highlight extraneous white space at the end of lines

  
  autocmd FileType text setlocal textwidth=0

  "Python specific formatting
  au BufNewFile,BufRead *.py set tabstop=4              " Set tabstop to 4 for Python files only
  au BufNewFile,BufRead *.py set softtabstop=4          " Set soft-tabstop to 4 for Python files only
  au BufNewFile,BufRead *.py set shiftwidth=4           " Set shiftwidth to 4 for Python files only
  au BufNewFile,BufRead *.py set textwidth=79           " Set line width to 80 for Python files only
  au BufNewFile,BufRead *.py set cursorcolumn           " Show cursor column lines for Python files only
  "au BufNewFile,BufRead *.py set cursorline             " Show cursor row lines for Python files only



" }

" TAGS {
  
  set tags=./tags,tags;                                 " Search for tags file in current dir, or up and up an up until one found
  nnoremap <silent> <Leader>b :TagbarToggle<CR>

" }


" Folding {

  set foldenable                          " Turn on folding
  set foldmarker={,}                      " C style automatic folding
  set foldmethod=marker                   " fold on the marker
  set foldlevel=100                       " don't autofold anything - but can fold manually
  set foldopen=block,hor,mark,percent,quickfix,tag   " moves to open folds on

  let perl_fold=1                         " enable PERL folding

" }


" Plugin settings {

  let b:match_ignorecase = 1              " case is ignored
  let perl_extended_vars = 1              " highlight advanced PERL vars inside strings

" }

" Taglist settings {

  let Tlist_Auto_Open=0                 " let the tag list open automagically
  let Tlist_Compact_Format = 1          " show small menu
  let Tlist_Ctags_Cmd = 'ctags'         " location of ctags
  let Tlist_Enable_Fold_Column = 0      " do show folding tree
  let Tlist_Exist_OnlyWindow = 1        " if you are the last, kill yourself
  let Tlist_File_Fold_Auto_Close = 1    " fold closed other trees
  let Tlist_Sort_Type = "name"          " order by
  let Tlist_Use_Right_Window = 1        " split to the right side of the screen
  let Tlist_WinWidth = 40               " 40 cols wide, so i can (almost always) read    
    
  let g:tlist_vhdl_settings = 'vhdl;d:package declarations;b:package_bodies;e:entities;a:architecture specifications;t:type declarations;p:preprocesses;f:functions;r:procedures'
" }


" GUI options {

  if has("gui_running")
    set guioptions+=a                     " Copy register to Windows clipboard in Select Mode
    set mousehide                         " hide the mouse cursor when typing
  
"    set gfn=-misc-fixed-medium-r-normal-*-*-130-*-*-c-*-iso8859-1  " set gui font
    set gfn=-misc-fixed-medium-r-normal--10-100-75-75-c-60-iso8859-1   " set gui font
  endif
" }

" Path specific settings {

  if &term == "xterm-color" || &term == "xterm-16color"             " added for window terminal
    set t_kb=
    fixdel
  endif
" }

" PERFORCE plugin settings {
" }


" USEFUL MACROS {
"
" Move character under cursor to specified column :  <nn> \l
  map <F3> i\r?[^\\]\\*a!!wc -c:s/.*/&A &|D:j!/"ldd-@l
"
" }


" Imagination abbreviations {
  ab rmc %s/\%x1b\[\d\+m//g
" }

