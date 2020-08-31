" vim: set fdm=marker : 

" make sure SPC is not mapped to anything
nnoremap <SPACE> <Nop>
" let g:mapleader = " "                  " set leader key
let mapleader      = ' '
let maplocalleader = ' '

" open nerdtree pane with bookmarks: <SPC><CR> : see nerdtree.vim file

" Windows {{{1
" <tab> / <s-tab> | Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Better window navigation
" Shortcutting split navigation, saving a keypress:
" nnoremap <leader>ww <C-w>w
" nnoremap <leader>wh <C-w>h
" nnoremap <leader>wj <C-w>j
" nnoremap <leader>wk <C-w>k
" nnoremap <leader>wl <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>
" }}}
" Save {{{1
" Quick save file 
nnoremap zz :update<CR>

inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
" }}}
" Quit {{{1
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
" nnoremap <Leader>q :q<cr>
" nnoremap <Leader>Q :qa!<cr>
" }}}
" Buffers {{{1
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" List Buffers
nmap <leader>bb :Buffers<CR>
" }}}
" TABS {{{1
" New TAB
nnoremap <leader>tn :tabnew<CR>

" Delete TAB
nnoremap <leader>td :tabclose<CR>

" Switch to next or previous tab
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" Go to tab by number
noremap <leader>t1 1gt
noremap <leader>t2 2gt
noremap <leader>t3 3gt
noremap <leader>t4 4gt
noremap <leader>t5 5gt
noremap <leader>t6 6gt
noremap <leader>t7 7gt
noremap <leader>t8 8gt
noremap <leader>t9 9gt
noremap <leader>t0 :tablast<cr>
" }}}
" TABS v.s. WORKSPACES  {{{1
" }}}
" Enable folding with the spacebar {{{1
" nnoremap <space> za
nnoremap <SPACE> za
"nnoremap <TAB> za
" }}}
" INDENTATION {{{1
" Better tabbing 
vnoremap < <gv
vnoremap > >gv
" }}}
" Reordering lines  {{{1
" :nnoremap <M-k> <Up>"add"ap<p>
" :nnoremap <M-j> "add"ap
:nnoremap <silent><M-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><M-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
" }}}
" FZF Plugin Maps {{{1

" Files
nmap <leader>gf :GFiles<CR>
nmap <leader>ff :Files<CR>

" Buffers
" nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

" Tags
nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

" Lines
nmap <leader>l :BLines<CR>
nmap <leader>L :Lines<CR>
nmap <leader>' :Marks<CR>
" }}}
" List default and user-defined commands  {{{1
nmap <Leader>C :Commands<CR>
" }}}
" Alias replace all to R {{{1
nnoremap R :%s//gc<Left><Left><Left>
" }}}
" Sessions {{{1
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>
" }}}
" Soft Wrap Mode {{{1
" ******* Remapping keys for Soft Wrap Mode *******
" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$
" }}}
" ESCAPE Key  {{{1
" Use control-c instead of escape
" nnoremap <C-c> <Esc>

" " I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>
" }}}
" Folders {{{1
" Remote Folders
map <F3> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/<CR>
map <F4> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/<CR>
map <F5> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/Python/<CR>

" Switch Directory to Work Directory (SHELL)
nnoremap <leader>gw :cd $ARES_WORK_DIR<CR>
" }}}
" Netrw {{{1
nnoremap <leader><leader><CR> :Vex<CR>
" }}}
" INSERT COMMANDS {{{1
" Dates {{{2
" Dates
nmap <leader>id i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>
imap <leader>id [<C-R>=strftime("%Y-%m-%d")<CR>]

" Datetime
nmap <leader>idt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <leader>idt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" }}}
" markdown {{{2
" autocmd FileType markdown inoremap ,i ![](<++>){#fig:<++>}<Space><CR><CR><++><Esc>kkF]i
autocmd FileType markdown inoremap ,a [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,f +@fig:
" }}}
" latex {{{2
autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
" autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
autocmd FileType tex,latex inoremap ,ti \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,a \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,mt \maketitle<CR><CR>
autocmd FileType tex,latex inoremap ,s \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,ss \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,sss \subsubsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i
autocmd FileType tex,latex inoremap ,tf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li
autocmd FileType tex,latex inoremap ,lt {\LaTeX}<Space>
autocmd FileType tex,latex inoremap ,b \bfseries
autocmd FileType tex,latex inoremap ,t \tiny
autocmd FileType tex,latex inoremap ,sc \scriptsize
autocmd FileType tex,latex inoremap ,fn \footnotesize
autocmd FileType tex,latex inoremap ,sm \small
autocmd FileType tex,latex inoremap ,l \large
autocmd FileType tex,latex inoremap ,h \huge
" }}}
" my commands   {{{2}
" emphasize
autocmd FileType tex,latex inoremap ,em \emph{}<CR><CR><++><Esc>?}<CR>i

" insert braces
autocmd FileType tex,latex inoremap ,i( \left(\right)<Esc>?(<CR>a  

" insert brackets
autocmd FileType tex,latex inoremap ,i[ \left[\right]<Esc>?[<CR>a

" inline math
autocmd FileType tex,latex inoremap ,im ~\(\)<Esc>?(<CR>a  

" outline math
autocmd FileType tex,latex inoremap ,om \[<CR><space><CR><BS>\]<Esc>kA

" insert comment
autocmd FileType tex,latex inoremap ,bc \begin{comment}<CR><CR>\end{comment}<Esc>ki

" begin equation
autocmd FileType tex,latex inoremap ,be \begin{equation}<CR><Space><Space>=<Space><CR>\end{equation}<Esc>khhi

" begin align
autocmd FileType tex,latex inoremap ,ba \begin{align}<CR><Space><Space>&=<Space><CR>\end{align}<Esc>khhhi
" }}}
" }}}

