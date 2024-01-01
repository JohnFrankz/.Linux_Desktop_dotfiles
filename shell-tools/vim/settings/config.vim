" not vi compatible
set nocompatible 
" Turn on syntax highlighting.
syntax enable
syntax on
" show matching braces when text indicator is over them
set showmatch 
" set to force 256 colors
set t_Co=256
set termguicolors
" enable file type detection
filetype plugin indent on
set autoindent

" editor options
" -----------------------------------------------   
" disable startup message
set shortmess+=I
" incremental search (as string is being typed)
set incsearch
" highlight searc
set hls
set scrolloff=5
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" backspace over anything.
set backspace=indent,eol,start
" automatically set current directory to directory of last opened file
set autochdir
" Automatically update files when files are modified externally.
set autoread
" allow auto-hiding of edited buffers
set hidden
" more history
set history=8192
" Call the function when opening a buffer
" autocmd BufRead,BufNewFile * call SetCustomIndent()
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" enable mouse mode (scrolling, selection, etc)
set mouse=a
" disable folding by default
set nofoldenable
set clipboard=unnamed,unnamedplus
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
