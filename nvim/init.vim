" vim: set fdm=marker : 

" Settings {{{1
filetype plugin on
    
syntax enable

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

set formatoptions-=cro                  " Stop newline continuation of comments

" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$

set spell

set iskeyword+=-                      	" treat dash separated words as a word text object"

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Enable autocompletion:
set wildmode=longest,list,full

" ****** Key Behavior *****
set backspace=2 " make backspace work like most other programs

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set wrap linebreak nolist               " Soft wrap

" leader and local leader keys {{{2
" make sure SPC is not mapped to anything
nnoremap <SPACE> <Nop>
let g:mapleader = " "                  " set leader key
let maplocalleader = ';'
" }}}2
" }}}1
lua require('plugins')
lua require('ac-telescope')

" Configure Plugins {{{1
" Sneak and Quickscope {{{2
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;


" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150
" }}}2
" Netrw {{{2
" Open up netrw File Explorer
" Remove directory banner. Access it by pressing: I
let g:netrw_banner = 0

" Window Size
let g:netrw_winsize = 20

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of browser
let g:netrw_browse_split = 2
let g:netrow_altv = 1

" Default to tree mode
let g:netrw_liststyle = 3

" Open file, but keep focus in Explorer
autocmd filetype netrw nmap <c-a> <cr>:wincmd W<cr>
" }}}2
" Languages {{{2
" Markdown {{{3
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
" }}}3
" Julia {{{3
" Enabling and disabling the LaTeX-to-Unicode functionality
" noremap <expr> <leader>lu LaTeXtoUnicode#Toggle()
" noremap! <expr> <leader>lu LaTeXtoUnicode#Toggle()
let g:latex_to_unicode_tab = 0
" }}}3
" LaTeX - Vimtex {{{3
"LaTeX Setup
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
" }}}3
" }}}2
" Appearance: {{{2
" Ensure transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none

if (has("termguicolors"))
    set termguicolors
endif
" }}}2
" }}}1

lua require('ac-lsp')
lua require('ac-treesitter')
lua require('ac-autopairs')
lua require('ac-bullets')
lua require('ac-comment')
lua require('ac-gitsigns')
lua require('ac-wiki')
lua require('ac-zen')

lua require('keymappings')
lua require('ac-which-key')

" Define Shortcut:
" nnoremap <leader>st :SwapThemes<CR>
" }}}2
" }}}1
lua require('settings')
lua require('colorscheme')

" lua require('lsp.lua-ls')

" vim pandoc syntax
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
