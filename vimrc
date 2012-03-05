" ---------------------------------
" vimrc / 'Vim' configuration file 
"
" written by ryz <ryzawy@gmail.com>
" last update: 2011-10-25 11:15:47
" ---------------------------------
" latest changes/additions/removals:
" [+] keybindings, pathogen-stuff 
" [=] remapped leader key 
" [-] -
" ---------------------------------
" to use this vimrc, copy it to
" for GNU/Linux and Unix: ~/.vimrc
" for MS-DOS and Win32  : $VIM\_vimrc
" ---------------------------------


" needs to be called BEFORE plugident
call pathogen#infect()
call pathogen#helptags()

" general settings {{{
" ----------------

set nocompatible " don't emulate vi-behaviour, must be the first option

set backup " make backup files
set backspace=2 " allow backspacing in insert mode over everything else; same as 'backspace=indent,eol,start'
filetype on " detect the type of file
set history=50 " How many lines of history to remember
set showcmd " display incomplete commands

if has ("mouse")
    set mouse=a " enable mouse support (all modes) 
endif

set nowrap " no line wrapping at all
set number " show line numbers
set numberwidth=4 " use 'x' spaces for numbers, e.g. '4' for '999 '

set cursorline " show cursor line (colorscheme dependent)
set ruler " show the cursor position all the time 
set nopaste " not in paste mode per default


set hls " highlight search-pattern
set incsearch " incremential search ("set is" also works)

set pdev=canon4300 " printer setting

set autochdir " working directory is the same as the current file

" set backup directories

if has ("unix")
set backupdir=~/.vim/backup " where to put backup files under unix/linux
set directory=~/.vim/tmp " where to put swap (.swp) files under unix/linux

elseif has ("win32")
set backupdir=$TEMP " where to put backup files
set directory=$TEMP " where to put swap (.swp) files

endif

set fileformats=unix,dos,mac " support all three, in this order

" }}}

" theme/colors {{{
" ----------------------

set background=dark
syntax on " syntax highlighting 

if has ("gui_running")
    colorscheme desert " nice darkish, stadard GUI theme
else
    colorscheme ir_black " not a standard theme?
endif

set t_Co=256 " set terminal to 256 colors

" }}}

" status bar {{{
" ----------------------

set statusline=%F%m%r%h%w\ [%{&ff}][%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [ln=%L] " informative status line 
set laststatus=2 " always show status line 
set cmdheight=2 " height of the command line, e.g. two lines; helps to avoid 'hit ENTER to continue' message
set shortmess=a " keep status messages short; helps to avoid 'hit ENTER to continue' message

" }}}

" folding {{{
" ----------------------

if has ("folding")
    set foldenable " turn on folding
    set foldmethod=marker " auto-fold on marker
endif
" }}}

" text formatting/layout {{{
" ----------------------

set ai " autoindent
set si " smartindent
set ci 

" tab behaviour
set expandtab " use spaces in place of tabs.
set tabstop=8 " number of spaces for a tab.
set softtabstop=4 " number of spaces for a tab in editing operations.
set shiftwidth=4 " number of spaces for indent (>>, <<, ...)


"au BufWinLeave * mkview " save fold/view state on exit
"au BufWinEnter * silent loadview " silently reload saved view state

" }}}

" plugin-stuff {{{
" ----------------------

" SuperTab related
let g:SuperTabDefaultCompletionType = "context"

" TagList related
let Tlist_Use_Right_Window = 1

" NERDTree related
let NERDTreeChDirMode = 2

" }}}

" key bindings {{{
" ------------

" unmap cursor/arrow keys for navigation (to help me sticking to hjkl)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" remap leader key to , (useful for plugins like NERDCommenter)
let mapleader=","

"" .vimrc related stuff
" open new tab and edit $MYVIMRC

map <F9> :tabnew<CR>:e $MYVIMRC<CR>

" SOURCE current file
map <F10> :so %<CR>

" time and date via F3

nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" tabs

map <S-h> gT
map <S-l> gt
map tn :tabnew<CR>
map td :tabclose<CR>

"" executing/compiling files
" execute current file
map <F5> :!%<CR>

" compile current TeX file with 'pdflatex' (needs MiKTeX)
map <F6> :!pdflatex % &<CR>

" programming

" toggle NERDTree and TagList via F-keys
map <F7> :NERDTreeToggle<CR>
map <F8> :TlistToggle<CR>

" NERDTree via leader key
nnoremap <leader>n :NERDTree .<CR>

" auto-insert opening and closing characters

" imap <C-F> {<CR>}<C-O>O " deprecated alternative

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap "      ""<Left>
inoremap ""     "

inoremap '      ''<Left>
inoremap ''     '

" }}}

" gui settings {{{
" ------------

" everything GUI-related that was not defined earlier

if has ("gui_running")

    " set a nice, readable GUI font
    set guifont=Dina:h8:cANSI " not a standard font

    " turn off the GUI widgets
    set guioptions-=T " remove the toolbar (icons on top of the screen)
    set guioptions-=m " remove the menu bar 
    set guioptions-=r " remove the right scroll bar
endif

" }}}

" EOF
