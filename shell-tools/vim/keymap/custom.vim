" unbind keys
" -----------------------------------------------
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" No arrow keys --- force yourself to use the home row
" -----------------------------------------------
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" buffers
" -----------------------------------------------
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]B :blast<CR>
nnoremap [B :bfirst<CR>

" arguments
" -----------------------------------------------
nnoremap <Leader>A :buffers<CR>:args<Space>
nnoremap <Leader>a :args<CR>
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>
nnoremap ]A :last<CR>
nnoremap [A :first<CR>

" source
" -----------------------------------------------
nnoremap <Leader>s :source ~/.vimrc<CR>

"  new line
" -----------------------------------------------
nnoremap ]o :put _<CR>k
nnoremap [o :put! _<CR>j

" Some other useful mappings
" -----------------------------------------------
" Copy
vnoremap <C-S-Y> "+y
inoremap {<CR> {<CR>}<Esc>ko
" Clear search highlighting.
nnoremap <leader>c :let @/ = ""<CR>
" toggle line numbers
nnoremap <leader>n :set number!<CR>
" toggle line numbers and relative line numbers
nnoremap <leader>r :set number!<CR>:set relativenumber!<CR>
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

