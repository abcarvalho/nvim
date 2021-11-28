" vim: set fdm=marker : 

" SETTINGS {{{1 
let g:mapleader = ";"                  " set leader key 

syntax enable                          " Enables syntax highlighing
set hidden                             " Required to keep multiple buffers open multiple buffers

" Line Wrapping
set wrap linebreak nolist               " Soft wrap
set encoding=utf-8                      " The encoding displayed 

set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

set conceallevel=2 

" INDENTATION 
"Indentation  without hard tabs
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation

" Line Numbers
" set number " Display Line Numbers
set number relativenumber

set cursorline                          " Enable highlighting of the current line

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" * REVIEW * *************************************************************
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set mouse=a                             " Enable your mouse
set t_Co=256                            " Support 256 colors


set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs 
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set timeoutlen=300                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else

" MAPPINGS {{{1 

" Alias replace all to R
nnoremap R :%s//gc<Left><Left><Left>

" SESSIONS *****************
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>

" ****** Key Behavior *****
set backspace=2 " make backspace work like most other programs

" Enable folding with the spacebar
nnoremap <space> za

" Quick save file
nnoremap zs :update<CR>

" ******* Remapping keys for Soft Wrap Mode *******
:map j gj
:map k gk
:map 0 g0
:map $ g$

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Fuzzy Search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ESCAPE Key  {{{2

" Use control-c instead of escape
nnoremap <C-c> <Esc>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" FZF Plugin Maps {{{2

" Files
nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>

" Buffers
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

" Tags
nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

" Lines
nmap <leader>l :BLines<CR>
nmap <leader>L :Lines<CR>
nmap <leader>' :Marks<CR>

" List default and user-defined commands
nmap <Leader>C :Commands<CR>

" Insert Commands {{{2
" Dates {{{3
" Dates
nmap <leader>id i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <leader>id <C-R>=strftime("%Y-%m-%d")<CR>

" Datetime
nmap <leader>idt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <leader>idt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" markdown {{{3
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

" latex {{{3
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

" my commands
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

" TEXT_EDITING {{{1
" Enable folding
set foldmethod=syntax
set foldlevel=1
set foldlevelstart=2

" set textwidth
set tw=80

" AUTCOMPLETION {{{1
" Enable autocompletion:
set wildmode=longest,list,full

" COMMENTING {{{1
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" PLUGINS {{{1
source $HOME/.config/nvim/plugins/plugins.vim

" Vim-Plug {{{2
	" Track the engine.
	Plug 'SirVer/ultisnips'

  " Note Taking Task Management:
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'tools-life/taskwiki'

" }}}2
" Configure Plugins {{{2

" Note Taking {{{3
" VimWiki {{{4
let g:vimwiki_list = [{'path': '$AMDG_WIKI_DIR/vwk', 
            \ 'nested_syntaxes': {'python': 'python', 'latex': 'tex'}}]

                       " \ 'syntax': 'markdown', 'ext': '.md'}]
" nnoremap <leader>vv :VimwikiIndex<CR>

" let g:vimwiki_hl_headers = 1

" enable global highlighting
let g:vimwiki_folding='expr'

" prevent Vimwiki from considering every markdown-file as a wiki file
let g:vimwiki_global_ext = 0
" }}}4
" TaskWiki {{{4
set wildcharm=<tab>
autocmd FileType vimwiki nnoremap <leader>tw :TaskWiki<tab>
autocmd FileType vimwiki nnoremap <leader>tm :TaskWikiMod
" }}}4
" }}}3
" }}}2
" }}}1 


