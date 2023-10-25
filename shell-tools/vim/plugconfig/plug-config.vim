" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:hardhacker_darker = 1
" colorscheme hardhacker
" set background=dark
colorscheme plain

" vim-cpp-modern
" -----------------------------------------------
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" fzf
" -----------------------------------------------
let g:fzf_layout = { 'down': '25%' }
" Empty value to disable preview window altogether
let g:fzf_preview_window = ['hidden,right', 'ctrl-/']
