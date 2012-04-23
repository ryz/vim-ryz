" -----------------------------------
" vimrc / 'Vim' configuration file 
"
" written by ryz <ryzawy@gmail.com>
" last update: 2012-04-17 10:45:00
" -----------------------------------
" latest changes/additions/removals:
" [+] disabled font anti aliasing
" [=] changed font to terminus
" [-] -
" -----------------------------------
" to use this vimrc, copy it to
" for GNU/Linux and Unix: ~/.vimrc
" for MS-DOS and Win32  : $VIM\_vimrc
" -----------------------------------


" pathogen needs to be called BEFORE plugident
call pathogen#infect()
call pathogen#helptags()

" general settings {{{
" ----------------

set nocompatible " don't emulate vi-behaviour, must be the first option

set backup " make backup files
set backspace=2 " backspacing in insert mode over everything else; same as 'backspace=indent,eol,start'
filetype on " detect the type of file
set history=50 " How many lines of history to remember
set showcmd " display incomplete commands

if has ("mouse")
    set mouse=a " enable mouse support (all modes) 
endif

" scrolling 
set scrolloff=3 " start scrolling three lines before the horizontal window border

" line numbering
set number " show line numbers
set relativenumber " line numbering relative to the current one
set numberwidth=4 " use 'x' spaces for numbers, e.g. '4' for '999 '

set cursorline " show cursor line (colorscheme dependent)
set ruler " show the cursor position all the time 
set nopaste " not in paste mode per default

" search related
set hls " highlight search-pattern
set incsearch " incremential search ("set is" also works)
set ignorecase " case-insensitive if search is all-lowercase...
set smartcase " ...but if one or more characters are uppercase, be case-sensitive

" substitute related
set gdefault " add g (global) flag to subsitutions 

set autochdir " working directory is the same as the current file

" set backup directories
if has ("unix")
set backupdir=~/.vim/backup " where to put backup files under unix/linux
set directory=~/.vim/tmp " where to put swap (.swp) files under unix/linux

elseif has ("mac")
set backupdir=~/.vim/backup " where to put backup files under mac osx 
set directory=~/.vim/tmp " where to put swap (.swp) files under mac osx

elseif has ("win32")
set backupdir=$TEMP " where to put backup files under windows
set directory=$TEMP " where to put swap (.swp) files under windows

endif

set fileformats=unix,dos,mac " support all three, in this order

set wildmenu " sane <Tab> completion, stops at longest unique prefix
set wildmode=list:longest,full " enables a list of possible filenames to tab-completed
set wildignore=*.o,*.png,*.jpg " ignore these filetypes while expanding chars

" disable sound on errors
set noerrorbells
set t_vb=
set tm=500

" }}}

" theme/colors {{{
" ----------------------

set background=dark
syntax on " syntax highlighting 

if has ("gui_running")
    colorscheme solarized " awesome theme
    " colorscheme ir_dark " my custom theme, see http://github.com/ryz/vim-irdark
else
    colorscheme solarized " great colortheme
endif

set t_Co=256 " set terminal to 256 colors

" }}}

" status bar {{{
" ----------------------

" show paste mode in status bar
function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

set statusline=%{hostname()}:%F%m%r%h%w\ [%{&ff}][%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [ln=%L]\ %{HasPaste()}" informative status line
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

" set nowrap " no line wrapping at all
set wrap " line wrapping
set textwidth=79 " wrap at line x
set formatoptions=qrn1 
if exists('+colorcolumn')
    set colorcolumn=+1 " show colored column at line x (+x of textwidth)
else
endif

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

" SnipMate related
let g:snippets_dir = '$VIM\vimfiles\bundle\snipmate-snippets\snippets'

" SuperTab related
let g:SuperTabDefaultCompletionType = "context"

" TagList related
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = 'd:\tools\ctags58\ctags.exe' " set Exuberant Ctags directory for TagList

" NERDTree related
let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.vim$', '\~$', '.png', '.swp']

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

" disable the infamous help key
inoremap <F1> <ESC> 
nnoremap <F1> <ESC> 
vnoremap <F1> <ESC> 

" remap 'jj' in INSERT mode to escape
inoremap jj <ESC>

" remap leader key to , (useful for plugins like NERDCommenter)
let mapleader=","

" some leader mappings
" fast window switching
map <leader>w <C-w><C-w>
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>

" map leader + space to clear search-highlighting
nnoremap <leader><space> :noh<CR>

" map leader + s to replace word under cursor
nnoremap <Leader>s :%s#\<<C-r><C-w>\>#
nnoremap <Leader>S :%s#<C-r><C-w>#

" map '%' to TAB for fast switching between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" map leader + m to open the MRU plugin
nnoremap <leader>m :MRU<CR>

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

"" executing/compiling files
" execute current file
map <F5> :!%<CR>

" compile current TeX file with 'pdflatex' (needs MiKTeX)
map <F6> :!pdflatex % &<CR>

" programming

" toggle NERDTree and TagList via F-keys
map <F8> :TlistToggle<CR>

" NERDTree via leader key
nnoremap <leader>n :NERDTreeToggle .<CR>

" }}}

" gui settings {{{
" ------------

" everything GUI-related that was not defined earlier

if has ("gui_running")
    " set a nice, readable GUI font

    if has ("win32") 
        set guifont=Dina:h16 " not a standard font
    endif

    if has ("mac") 
        set guifont=TerminusMedium:h12 " not a standard font
    endif

    set noantialias " turn off font anti aliasing

    " turn off the GUI widgets
    set guioptions-=T " remove the toolbar (icons on top of the screen)
    set guioptions-=m " remove the menu bar 
    set guioptions-=r " remove the right scroll bar
endif

" }}}

" EOF
