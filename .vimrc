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
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'dyng/ctrlsf.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

" fzf
set rtp+=~/.fzf
" Map Ctrl-P to fzf open file (tracked in git)
map <C-p> :Files<Enter>
" Map Ctrl-F to some CtrlSF stuff (searching in files)
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set encoding to utf-8
set encoding=utf8

" Set colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

" Show vertical ruler at 80 character line
set colorcolumn=+1

" Use system clipboard
set clipboard=unnamedplus

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

" Keep unsaved buffers open
set hidden

" Enable mouse mode
set mouse=a

" Bindings to help move between buffers
map <leader>n :bn<Enter>
map <leader>p :bp<Enter>
map <leader>o :Files<Enter>
map <leader>b :Buffers<Enter>

" Bindings to help comment
xmap <leader>/  <Plug>Commentary
nmap <leader>/  <Plug>Commentary
omap <leader>/  <Plug>Commentary
nmap <leader>// <Plug>CommentaryLine


" Source local-specific config
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
