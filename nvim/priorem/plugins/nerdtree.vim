
" NERDTree       {{{1
let NERDTreeShowBookmarks=1

" Automatically delete the buffer of deleted files
let NERDTreeAutoDeleteBuffer = 1

" Make it pretty:
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automatically close a tab if the only remaining window is NerdTree
" (Automaticaly close vim/nvim if NERDTree is only thing left open)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set autochdir                                " the working directory is always the one where the active buffer is located
let NERDTreeChDirMode=2                        " make sure the working directory is set correctly.

" Toggle
" nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader><CR> :NERDTreeToggle<CR>

