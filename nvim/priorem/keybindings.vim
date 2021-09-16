" vim: fdm=marker

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

" [DONE] Single <space> mappings {{{3
let g:space_key_map['j'] = [ '<C-W>s'                     , 'split below']
let g:space_key_map['l'] = [ '<C-W>v'                     , 'split right']
" List default and user-defined commands
let g:space_key_map['C'] = [ ':Commands', 'list commands' ]
" }}}3
" [DONE] a is for acropolis {{{3
let g:space_key_map.a = {
      \ 'name' : '+acropolis-server' ,
      \ 'd' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/', 'bond-data'], 
      \ 'm' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/', 'bond-model'], 
      \}
" }}}3
" [DONE] b is for buffers {{{3
let g:space_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bd'     , 'delete'],
      \ 'n' : [':bnext', 'next-buffer'],
      \ 'p' : [':bprevious', 'previous-buffer'],
      \}

let g:space_key_map.b.b = 'list-buffers'

" }}}3
" [DONE] d is for directory {{{3
let g:space_key_map.d = {
      \ 'name' : '+directory' ,
      \ 'd' : [':cd $ZEN_DOTFILES_DIR'     , 'dotfiles'],
      \ 'r' : [':cd $ZEN_REPOS_DIR'     , 'repos'],
      \ 'k' : [':cd $ZEN_WORK_DIR'     , 'work'],
      \ 'v' : [':cd $ZEN_WIKI_DIR'     , 'wiki'],
      \}
" }}}3
" [DONE] f is for file {{{3
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
" [DONE] m is for markdown {{{3
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
" [DONE] p is for packer }}}3
let g:space_key_map.p = {
      \ 'name' : '+packer',
      \ 'u' : ['PackerUpdate', 'update'],
      \ 's' : ['PackerSync', 'sync'],
      \ 'S' : ['PackerStatus', 'status'],
    \}
" }}}3
" [DONE] q is for quitting {{{3
let g:space_key_map.q = {
      \ 'name' : '+quit',
      \ 'w' : ['wq', 'save-&-quit'],
      \ 'q' : [ 'q', 'quit' ],
      \ 'Q' : [ 'qa!', 'quit-without-saving' ],
    \}
" }}}3
" [DONE] r is for rgrep {{{3
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
" [DONE] s is for search {{{3
     " \ 'l' : [':Lines'        , 'fzf-lines'] ,
let g:space_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'b' : [':BLines'      , 'buffers'],
      \ 'B' : [':Buffers'      , '[NO] open-buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer-commits'],
      \ 'f' : [':Files'        , 'fzf-files'],
      \ 'g' : [':GFiles'       , 'fzf-git-files'],
      \ 'G' : [':GFiles?'      , 'git-status'],
      \ 'h' : [':History'      , 'file-history'],
      \ 'H' : [':History:'     , 'command-history'],
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal-maps'] ,
      \ 'p' : [':Rg'           , 'project'],
      \ 's' : [':Snippets'     , '[NO] snippets'],
      \ 'S' : [':Colors'       , 'color-schemes'],
      \ 't' : [':BTags'        , 'fzf-buffer-tags'],
      \ 'T' : [':Tags'         , 'project-tags'],
      \ 'w' : [':Windows'      , '[NO] search-windows'],
      \ 'y' : [':Filetypes'    , 'file-types'],
      \ 'z' : [':FZF'          , '[NO] fzf'],
      \ }
" }}}3
" [DONE] S is for sessions [ADJUST] {{{3
nnoremap <leader>Ss :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>Sl :source .quicksave.vim<CR>:echo "Session loaded."<CR>

let g:space_key_map.S = {
      \ 'name' : '+session' ,
      \} 
let g:space_key_map.S.s = 'save'
let g:space_key_map.S.l = 'load'
" }}}3
" [DONE] <tab> is for tabs {{{3
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
" [DONE] v is for wiki {{{3
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
" [DONE] w is for window {{{3
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
" [DONE] Which key - dotcomma {{{2
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
