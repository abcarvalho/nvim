" LaTeX - Vimtex
" LaTeX Setup
let g:vimtex_enabled=1
let g:vimtex_complete_recursive_bib=1
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname='nvr'  " required in neovim 
let g:vimtex_quickfix_mode=0
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1

let g:vimtex_compiler_latexmk = {
\ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1', 
    \   '-interaction=nonstopmode',
    \ ],
\}

" Tex Conceal
" let g:tex_conceal='abdmg'
"set conceal level to zero in latex files
let g:tex_conceal=""
