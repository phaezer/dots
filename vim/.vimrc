" Basic Vim configuration

" Enable syntax highlighting
syntax enable

" Set line numbers
set number
set relativenumber

" Enable mouse support
set mouse=a

" Set indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" UI improvements
set cursorline
set showmatch
set ruler
set showcmd
set wildmenu
set laststatus=2

" File handling
set nobackup
set noswapfile
set autoread

" Color scheme
set background=dark
colorscheme default

" Key mappings
let mapleader = ","

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Clear search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Navigation between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Enable filetype plugins
filetype plugin indent on

" Show whitespace characters
set list
set listchars=tab:>-,trail:·,nbsp:·

" Better backspace behavior
set backspace=indent,eol,start