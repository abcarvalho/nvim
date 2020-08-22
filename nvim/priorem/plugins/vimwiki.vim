
" Vim Wiki
let g:vimwiki_list = [{'path': '$work_dir/wiki/vw'}]
                       " \ 'syntax': 'markdown', 'ext': '.md'}]
nnoremap <leader>vv :VimwikiIndex<CR>

" let g:vimwiki_hl_headers = 1

" enable global highlighting
let g:vimwiki_folding='expr'

" prevent Vimwiki from considering every markdown-file as a wiki file
let g:vimwiki_global_ext = 0

" Set filetype to markdown in VimWiki:
" let g:vimwiki_folding = 'custom'

" au FileType vimwiki set filetype=pandoc
" au FileType vimwiki set syntax=markdown.pandoc

