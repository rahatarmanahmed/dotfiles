" Don't try to be vi compatible
set nocompatible

" Leader
let g:mapleader = "\<Space>"

" Autoinstall vim-plug if it's not already there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

" fzf
set rtp+=~/.fzf

" Set encoding to utf-8
set encoding=utf8

" Set colorscheme
colorscheme monokai
set background=dark

" Set wordwrap
set wrap

" Make sure there's space around cursor while scrolling 
set scrolloff=3

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Wrap cursor when going left/right
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start

" Turn on syntax highlighting
syntax on

" Show line numbers
set number

" Set to auto read when a file is changed from the outside
" set autoread

" Show location of cursor using a horizontal line.
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=8

" Always show current position
set ruler

" Highlight search results while searching
set hlsearch
set incsearch

" Ignore case in searching, except when it has uppercase letters
set ignorecase
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" Show mode and cmd on bottom line
set showmode
set showcmd

" Blink cursor on error instead of beeping
set visualbell

" Always show the status line
set laststatus=2

" Visualize whitespace
set listchars=tab:▸\ ,eol:¬,trail:·
set list

" Set soft tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Start newlines with same indentation as current line
set autoindent
set smarttab

" Enable wildmode command completion
set wildmenu

" Enable mouse in all modes
set mouse=a

" Source local-specific config
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
