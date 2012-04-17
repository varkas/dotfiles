"General
"""""""""""

"set guifont="Bitstream_Vera_Sans_Mono:h10:cANSI"

set t_Co=256
set nocompatible        "not vi-compatible
set history=1000        "lines of history saved
set cf                  "enable error file jumping
set clipboard+=unnamed  "share clipboard 
set ffs=unix,dos,mac    "support other oses
filetype plugin indent on      "load filetype plugins
set viminfo+=!          "save viminfo: macros, marks, etc.
set isk+=_,$,@,%,#,-    "not word dividers
set t_kb=
set tags=./tags
fixdel
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencodings=utf-8,usc-bom
  set termencoding=iso-8859-15
  set fileencodings=usc-bom,utf-8,iso-8859-15
else
  echoerr "no multi_byte"
endif

function! ChineseFont()
    set guifont='NSimSun:h12:cDEFAULT'
endfunction

" Theme/Colors
"""""""""""""""
set background=light
syntax on

if has('gui_running')
  colorscheme ir_black4
else
  colorscheme inkpot256
endif


" Backups
"""""""""""""""
set backupdir=~/.backup/vim
set backup
set directory=~/.backup/vim/swap
set makeef=error.err

" Vim UI
""""""""""""""
set wildmenu
set wildmode=longest,list
set number
set ruler
set backspace=eol,start,indent
set mouse=a
set noerrorbells
set textwidth=80
set ignorecase
set smartcase
set title
set titlestring=VIM:\ %F

" Visual cues
""""""""""""""
set showmatch
set incsearch
set hlsearch
set mat=5
set novisualbell
set laststatus=2
set showcmd

" Text Formatting/Layout
"""""""""""""""""""""""""
set formatoptions=tcrqn
set smartindent
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cinoptions=1s,(0,g0
set smarttab
set expandtab
set wrap

" Folding
"""""""""""""""""
set foldenable
set foldmethod=syntax
set foldlevel=100


" Mappings
""""""""""""""
map <F2> <esc>:TlistToggle<cr><esc>
let Tlist_WinWidth = 40
"map <F5> <esc>0i//<esc>
"map <F6> <esc>0xx<esc>
map <F7> <esc>:cprev<cr><esc>
map <F8> <esc>:cnext<cr><esc>
map <F9> <esc>:make<cr>:cw 4<cr>

map <C-J> <C-W>j
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-K> <C-W>k

:command -nargs=* Make make <args> | botright cwindow 4
:command -nargs=* Grep grep <args>

map <Leader>m :Make<cr>
map <Leader>g :Grep 
map <Leader>c :botright cwindow 5<cr>

map <Leader>j :cn<cr>
map <Leader>k :cp<cr>
imap ;j <esc>

"map <BS> bdw
"imap <BS> <Esc>bdwa

noremap Y y$

"Space toggles fold
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

map <f5> [I:let nr = input("Which one: ") <Bar> exe "normal " . nr ."[\t"<CR>

"GVim hacks
"""""""""""""""
set guioptions-=T "remove toolbar
set guioptions-=m "remove menu
set guioptions-=r "remove scrollbar
set guioptions-=L "remove scrollbar
set guioptions-=t "remove scrollbar
set guioptions+=ai

"Fun, themes
map <C-F12> :execute RotateColorTheme()<cr>

function InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <Tab> <C-R>=InsertTabWrapper()<CR>

let python_highlight_all = 1

function! Chinese()
  if has('gui_running') && has('multi_byte')
    set ambiwidth=double
    set encoding=utf-8
    set guifont=NSimSun:h12:cDEFAULT
  endif
endfunction
