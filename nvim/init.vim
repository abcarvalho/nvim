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
lua require('keymappings')

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

" Mappings {{{1
" Which Key - pre config {{{2
" Create map to add keys to
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" }}}2
" Which Key - space {{{2
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Register which key map
call which_key#register('<Space>', "g:space_key_map")

" Create map to add keys to
let g:space_key_map =  {}

" Single <space> mappings {{{3
let g:space_key_map['j'] = [ '<C-W>s'                     , 'split below']
let g:space_key_map['l'] = [ '<C-W>v'                     , 'split right']
" List default and user-defined commands
let g:space_key_map['C'] = [ ':Commands', 'list commands' ]
" }}}3
" a is for acropolis {{{3
let g:space_key_map.a = {
      \ 'name' : '+acropolis-server' ,
      \ 'd' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/', 'bond-data'], 
      \ 'm' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/', 'bond-model'], 
      \}
" }}}3
" b is for buffers {{{3
let g:space_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bd'     , 'delete'],
      \ 'n' : [':bnext', 'next-buffer'],
      \ 'p' : [':bprevious', 'previous-buffer'],
      \}

let g:space_key_map.b.b = 'list-buffers'

" }}}3
" d is for directory {{{3
let g:space_key_map.d = {
      \ 'name' : '+directory' ,
      \ 'd' : [':cd $ZEN_DOTFILES_DIR'     , 'dotfiles'],
      \ 'r' : [':cd $ZEN_REPOS_DIR'     , 'repos'],
      \ 'k' : [':cd $ZEN_WORK_DIR'     , 'work'],
      \ 'v' : [':cd $ZEN_WIKI_DIR'     , 'wiki'],
      \}
" }}}3
" f is for file {{{3
" nnoremap <silent> <leader>fs :update<CR>
inoremap <leader>fs  <C-O>:w<cr>
noremap <leader>fs  :w<cr>

let g:space_key_map.f = { 
     \ 'name' : '+file', 
     \ 'n' : [':Lexplore', 'netrw'],
     \ 'a' : [':edit ${ZEN_WIKI_DIR}/tasks.md', 'tasks'],
     \ 't' : [':edit ${ZEN_REPOS_DIR}/dissertation/paper/abcarvalho_paper.tex', 'thesis'],
     \}

let g:space_key_map.f.b = 'file-browser'
let g:space_key_map.f.s = 'save-file'
let g:space_key_map.f.d = 'ZEN DOTFILES'
let g:space_key_map.f.r = 'ZEN REPOS'
let g:space_key_map.f.v = 'ZEN WIKI'
let g:space_key_map.f.w = 'ZEN WORK'

" }}}3
" g is for git {{{3
let g:space_key_map.g = { 
      \ 'name' : '+git/version-control' ,
      \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
      \ 'c' : ['BCommits'               , 'commits-for-current-buffer'] ,
      \ 'C' : ['Gcommit'                , 'fugitive-commit']            ,
      \ 'd' : ['Gdiff'                  , 'fugitive-diff']              ,
      \ 'e' : ['Gedit'                  , 'fugitive-edit']              ,
      \ 'l' : ['Glog'                   , 'fugitive-log']               ,
      \ 'r' : ['Gread'                  , 'fugitive-read']              ,
      \ 's' : ['Gstatus'                , 'fugitive-status']            ,
      \ 'w' : ['Gwrite'                 , 'fugitive-write']             ,
      \ 'p' : ['Git push'               , 'fugitive-push']              ,
     \} 
" }}}3
" h is for help [ADJUST] {{{3
let g:space_key_map.h = {
      \ 'name' : '+help',
      \ }
" }}}3
" m is for markdown {{{3
let g:table_mode_map_prefix = '<Leader>m'

autocmd FileType markdown,pandoc nmap <leader>m1 i#<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m2 i##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m3 i###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m4 i####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m5 i#####<Space><CR><CR><++><Esc>2k<S-a>

autocmd FileType markdown,pandoc nmap <leader>ms i```sh<CR><CR>```<CR><ESC>kki<Tab>

" Markdown Dates
autocmd FileType markdown,pandoc nmap <leader>mid i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>

" Markdown DateTime
autocmd FileType markdown,pandoc nmap <leader>mit i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

let g:space_key_map.m = {
      \ 'name' : '+md-mode',
    \}
let g:space_key_map.m.s = 'shell block'
let g:space_key_map.m.1 = 'header 1'
let g:space_key_map.m.2 = 'header 2'
let g:space_key_map.m.3 = 'header 3'
let g:space_key_map.m.4 = 'header 4'
let g:space_key_map.m.5 = 'header 5'

let g:space_key_map.m.i = {
      \ 'name' : '+md-insert',
    \}
let g:space_key_map.m.i.d = 'date'
let g:space_key_map.m.i.t = 'datetime'

let g:space_key_map.m.t = {
      \ 'name' : '+md-table-mode',
      \ 'e' : ['TableEvalFormulaLine', 'eval formula line'],
      \ 't' : ['TableModeEnable', 'table-mode-enable'],
      \ 'd' : ['TableModeEnable', 'table-mode-disable'],
    \}
" }}}3
" q is for quitting {{{3
let g:space_key_map.q = {
      \ 'name' : '+quit',
      \ 'w' : ['wq', 'save-&-quit'],
      \ 'q' : [ 'q', 'quit' ],
      \ 'Q' : [ 'qa!', 'quit-without-saving' ],
    \}
" }}}3
" r is for rgrep {{{3
command! -bang -nargs=* RGrepWiki
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 
            \1, fzf#vim#with_preview({ 'dir': '$ZEN_WIKI_DIR'}), <bang>0)

let g:space_key_map.r = { 
     \ 'name' : '+rgrep', 
     \ 'r' : [':Rg', 'rgrep'], 
     \ 'v' : [':RGrepWiki', 'rgrep wiki'],
    \}
" }}}3
" s is for search {{{3
      " \ '/' : [':History/'     , 'history'],
      " \ ';' : [':Commands'     , 'commands'],
      " \ 'b' : [':BLines'      , 'buffers'],
      " \ 'f' : [':Files'        , 'fzf-files'],
      " \ 'h' : [':History'      , 'file-history'],
      " \ 'H' : [':History:'     , 'command-history'],
      " \ 'M' : [':Maps'         , 'normal-maps'] ,
      " \ 'p' : [':Rg'           , 'project'],
      " \ 'S' : [':Colors'       , 'color-schemes'],
      " \ 't' : [':BTags'        , 'fzf-buffer-tags'],
let g:space_key_map.s = {
      \ 'name' : '+search' ,
      \ 'a' : [':Ag'           , 'text-Ag'],
      \ 'B' : [':Buffers'      , 'open-buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer-commits'],
      \ 'g' : [':GFiles'       , 'fzf-git-files'],
      \ 'G' : [':GFiles?'      , 'fzf-modified-git-files'],
      \ 'l' : [':Lines'        , 'fzf-lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'P' : [':Tags'         , 'project-tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'T' : [':Tags'         , 'fzf-tags'],
      \ 'w' : [':Windows'      , 'search-windows'],
      \ 'y' : [':Filetypes'    , 'file-types'],
      \ 'z' : [':FZF'          , 'fzf'],
      \ }

let g:space_key_map.s['/'] = 'search-history' 
let g:space_key_map.s[';'] = 'commands' 
let g:space_key_map.s.b = 'current-buffer' 
let g:space_key_map.s.f = 'fzf-files' 
let g:space_key_map.s.h = 'file-history'
let g:space_key_map.s.h = 'command-history'
let g:space_key_map.s.M = 'keymaps'
let g:space_key_map.s.p = 'rgrep-project'
let g:space_key_map.s.S = 'colorschemes'
let g:space_key_map.s.t = 'tags-buffer'


" }}}3
" S is for sessions [ADJUST] {{{3
nnoremap <leader>Ss :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>Sl :source .quicksave.vim<CR>:echo "Session loaded."<CR>

let g:space_key_map.S = {
      \ 'name' : '+session' ,
      \} 
let g:space_key_map.S.s = 'save'
let g:space_key_map.S.l = 'load'
" }}}3
" <tab> is for tabs {{{3
let g:space_key_map['<Tab>'] = {
      \ 'name' : '+tab' ,
      \ '1' : [':1gt', 'tab-1'],
      \ '2' : [':2gt', 'tab-2'],
      \ '3' : [':3gt', 'tab-3'],
      \ '4' : [':4gt', 'tab-4'],
      \ '5' : [':5gt', 'tab-5'],
      \ '6' : [':6gt', 'tab-6'],
      \ '7' : [':7gt', 'tab-7'],
      \ '8' : [':8gt', 'tab-8'],
      \ '9' : [':9gt', 'tab-9'],
      \ '0' : [':tablast', 'last'],
      \ 'n' : [':tabnew', 'new'],
      \ 'd' : [':tabclose', 'delete'],
      \ 'o' : [':tabonly', 'close-all-tabs-except-current'],
      \}
" }}}3
" v is for wiki {{{3
let g:wiki_mappings_global = {
        \ '<plug>(wiki-index)' : '<leader>vv',
        \ '<plug>(wiki-link-next)' : '<leader>vj',  
        \ '<plug>(wiki-link-prev)' : '<leader>vk', 
        \ '<plug>(wiki-link-follow)' : '<leader>vf', 
        \ '<plug>(wiki-link-return)' : '<leader>vb',
        \}
let g:space_key_map.v = {
      \ 'name' : '+wikivim',
      \}
let g:space_key_map.v.v = 'wiki-index'
let g:space_key_map.v.j = 'wiki-link-next'
let g:space_key_map.v.k = 'wiki-link-prev'
let g:space_key_map.v.f = 'wiki-link-follow'
let g:space_key_map.v.b = 'wiki-link-return'
" }}}3
" w is for window {{{3
let g:space_key_map.w = {
      \ 'name' : '+window' ,
      \ 'w' : ['<C-w>w'     , 'other-window'],
      \ 'c' : ['<C-w>c'     , 'window-close'],
      \ 'h' : ['<C-w>h'     , 'window-left'],
      \ 'j' : ['<C-w>j'     , 'window-below'],
      \ 'k' : ['<C-w>k'     , 'window-right'],
      \ 'l' : ['<C-w>l'     , 'window-up'],
      \ 'H' : [':vertical resize +2','expand-window-left' ],
      \ 'J' : [':resize -2','expand-window-below'],
      \ 'L' : [':vertical resize -2', 'expand-window-right'],
      \ 'K' : [':resize +2'     ,'expand-window-up'   ],
      \ '-' : ['split' , 'split-window-below'],
      \ '|' : ['vs' , 'split-window-right'],
      \ '=' : ["<C-w>=", 'balance-window'],
      \ 'o' : [":only", 'close-all-windows-except-current'],
      \}
" }}}3
" }}}2
" Which key - dotcomma {{{2
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>
vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual ';'<CR>

" Register which key map
call which_key#register(';', "g:dotcomma_key_map")

" Create map to add keys to
let g:dotcomma_key_map =  {}
" }}}2
" Which key - backslash {{{2
nnoremap <silent> <Bslash> :<c-u>WhichKey  '\<Bslash\>'<CR>

" Register which key map
call which_key#register('\<Bslash\>', "g:back_key_map")

let g:back_key_map =  {
        \ 'name' : '+tex,latex,md'}

" latex autocmds {{{3
" emphasize
autocmd FileType tex,latex inoremap \le ~\emph{}<Esc>i 

" citation
autocmd FileType tex,latex inoremap \lc ~\citet{}<Esc>a

" reference
autocmd FileType tex,latex inoremap \lr ~\ref{}<Esc>a

" autocmd FileType tex,latex inoremap \rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i


" Create map to add keys to
let g:back_key_map.l = {
    \ 'name' : '+latex',
    \ 'e' : ['call feedkeys("i"."\\le")' , 'emph'],
    \ 'c' : ['call feedkeys("i"."\\lc")' , 'citet'],
    \ 'r' : ['call feedkeys("i"."\\lr")' , 'ref'],
    \ }

" math {{{4
" begin align
autocmd FileType tex,latex,vimwiki inoremap \lma \begin{align}<CR><Space><Space>&=<Space><CR>\end{align}<Esc>khhhi

" inline math
autocmd FileType tex,latex inoremap \lmi ~\(\)<ESC>hi

" outline math
autocmd FileType tex,latex,vimwiki inoremap \lmo \[<CR><space><CR><BS>\]<Esc>kA

" begin equation
autocmd FileType tex,latex,vimwiki inoremap \lme \begin{equation}<CR><Space><Space>=<Space><CR>\end{equation}<Esc>khhi

" insert braces
autocmd FileType tex,latex,vimwiki inoremap \lm( \left(\right)<Esc>?(<CR>:noh<CR>a  

" insert brackets
autocmd FileType tex,latex,vimwiki inoremap \lm[ \left[\right]<Esc>?[<CR>:noh<CR>a

" insert curly brackets
autocmd FileType tex,latex,vimwiki inoremap \lm{ \{\}<Esc>hi

let g:back_key_map.l.m = {
    \ 'name' : '+math',
    \ 'a' : ['call feedkeys("i"."\\lma")' , 'align'],
    \ 'e' : ['call feedkeys("i"."\\lme")' , 'equation'],
    \ 'i' : ['call feedkeys("i"."\\lmi")' , 'inline'],
    \ 'o' : ['call feedkeys("i"."\\lmo")' , 'outline'],
    \ '(' : ['call feedkeys("i"."\\lm(")' , 'braces'],
    \ '[' : ['call feedkeys("i"."\\lm[")' , 'brackets'],
    \ '{' : ['call feedkeys("i"."\\lm{")' , 'curly brackets'],
  \ }
" }}}4 
" sections {{{4
autocmd FileType tex,latex inoremap \ls1 \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ls2 \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ls3 \subsubsection{}<CR><CR><++><Esc>?}<CR>i

" autocmd FileType tex,latex inoremap \lsf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li

let g:back_key_map.l.s = {
    \ 'name' : '+sections',
    \ 't' : ['call feedkeys("i"."\\lst")' , 'title'],
    \ 'a' : ['call feedkeys("i"."\\lsa")' , 'author'],
    \ 'm' : ['call feedkeys("i"."\\lsm")' , 'maketitle'],
    \ '1' : ['call feedkeys("i"."\\ls1")' , 'section'],
    \ '2' : ['call feedkeys("i"."\\ls2")' , 'subsection'],
    \ '3' : ['call feedkeys("i"."\\ls3")' , 'huge'],
  \ }
" }}}4
" document {{{4
autocmd FileType tex,latex inoremap \lda \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ldt \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ldm \maketitle<CR><CR>

let g:back_key_map.l.d = {
    \ 'name' : '+sections',
    \ 't' : ['call feedkeys("i"."\\ldt")' , 'title'],
    \ 'a' : ['call feedkeys("i"."\\lda")' , 'author'],
    \ 'm' : ['call feedkeys("i"."\\ldm")' , 'maketitle'],
  \ }
" }}}4
" insert {{{4
" textcolor
autocmd FileType tex,latex inoremap \lic ~\textcolor{}{<++>}<Esc>?{<CR>n:noh<CR>a

" insert comment
autocmd FileType tex,latex inoremap \lim \begin{comment}<CR><CR>\end{comment}<Esc>ki

" symbol
autocmd FileType tex,latex inoremap \lis {\LaTeX}<Space>

let g:back_key_map.l.i = {
    \ 'name' : '+insert',
    \ 'c' : ['call feedkeys("i"."\\lic")' , 'textcolor'],
    \ 'm' : ['call feedkeys("i"."\\lim")' , 'comment'],
    \ 's' : ['call feedkeys("i"."\\lis")' , 'symbol (LaTeX)'],
    \}
" }}}4
" text size {{{4 
" autocmd FileType tex,latex inoremap \ltb \bfseries
autocmd FileType tex,latex inoremap \ltt \tiny
autocmd FileType tex,latex inoremap \ltp \scriptsize
autocmd FileType tex,latex inoremap \ltf \footnotesize
autocmd FileType tex,latex inoremap \lts \small
autocmd FileType tex,latex inoremap \ltl \large
autocmd FileType tex,latex inoremap \lth \huge
let g:back_key_map.l.t = {
    \ 'name' : '+text',
    \ 't' : ['call feedkeys("i"."\\ltt")' , 'tiny'],
    \ 'p' : ['call feedkeys("i"."\\ltp")' , 'scriptsize'],
    \ 'f' : ['call feedkeys("i"."\\ltf")' , 'footnotesize'],
    \ 's' : ['call feedkeys("i"."\\lts")' , 'small'],
    \ 'l' : ['call feedkeys("i"."\\ltl")' , 'large'],
    \ 'h' : ['call feedkeys("i"."\\lth")' , 'huge'],
  \ }
" }}}4
" }}}3
" }}}2
" Indenting text {{{2
" Better tabbing 
vnoremap < <gv
vnoremap > >gv
" }}}2
" FZF Plugin Maps {{{2
" Fuzzy Search
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" }}}2
" switch NVim and iTerm2 Themes {{{2
function! Theme_Swapper()
    if &background ==? 'dark'
        set background=light
        colorscheme solarized8
    else
        set background=dark
        colorscheme nightfly
    endif
    silent !osascript -e 'tell app "System Events" to keystroke "s" using {shift down, option down, control down}'
endfunction 

command! SwapThemes call Theme_Swapper()

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
