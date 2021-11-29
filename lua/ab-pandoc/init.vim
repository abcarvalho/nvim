" Markdown
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
" let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#modules#enable = ["formatting", "folding", 'command', "toc"]
" let g:pandoc#formatting#mode = "h"
" let g:pandoc#folding#mode = 'stacked'
let g:pandoc#folding#mode = "syntax"

" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END

