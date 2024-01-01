call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'
"Plug 'preservim/nerdcommenter'
" Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'github/copilot.vim'
" Plug 'owickstrom/vim-colors-paramount'
" Plug 'tpope/vim-obsession'
" Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
" Plug 'cormacrelf/vim-colors-github'
Plug 'andreypopp/vim-colors-plain'
Plug 'owickstrom/vim-colors-paramount'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'lervag/vimtex'

call plug#end()
