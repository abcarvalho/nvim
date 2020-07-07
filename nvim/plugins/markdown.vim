
" Markdown     {{{1
" let g:vim_markdown_folding_level = 1

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
" let g:vim_markdown_conceal = 0

" disable math tex conceal feature
" let g:vim_markdown_math = 1

let g:markdown_folding = 1
let g:markdown_enable_folding = 1

let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#mode = "syntax"
let g:pandoc#modules#enable = ["formatting", "folding", "toc"]
let g:pandoc#formatting#mode = "h"

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" au! BufRead,BufNewFile *.markdown set filetype=markdown
" au! BufRead,BufNewFile *.md       set filetype=pandoc.markdown

