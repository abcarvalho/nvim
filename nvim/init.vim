" vim: set fdm=marker : 

" install pynvim: conda install pynvim
" check health:  :checkhealth

" Some basics: {{{1
" nnoremap c "_c
set nocompatible

filetype plugin on

" Automatically change the current directory
set autochdir

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" source $HOME/.config/nvim/settings.vim

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}
" MAPPINGS {{{1

" make sure SPC is not mapped to anything
nnoremap <SPACE> <Nop>
let g:mapleader = " "                  " set leader key
" let mapleader      = ' '
let maplocalleader = ';'

" open nerdtree pane with bookmarks: <SPC><CR> : see nerdtree.vim file

" Windows {{{2
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
" Save {{{2
" Quick save file 
nnoremap zz :update<CR>

inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
" }}}
" Quit {{{2
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
" nnoremap <Leader>q :q<cr>
" nnoremap <Leader>Q :qa!<cr>
" }}}
" Buffers {{{2
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" List Buffers
nmap <leader>bb :Buffers<CR>
" }}}
" TABS {{{2
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
" TABS v.s. WORKSPACES  {{{2
" }}}
" Enable folding with the spacebar {{{2
" nnoremap <space> za
nnoremap <SPACE> za
"nnoremap <TAB> za
" }}}
" INDENTATION {{{2
" Better tabbing 
vnoremap < <gv
vnoremap > >gv
" }}}
" Reordering lines  {{{2
" :nnoremap <M-k> <Up>"add"ap<p>
" :nnoremap <M-j> "add"ap
:nnoremap <silent><C-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><C-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
" }}}
" FZF Plugin Maps {{{2

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
" List default and user-defined commands  {{{2
nmap <Leader>C :Commands<CR>
" }}}
" Alias replace all to R {{{2
nnoremap R :%s//gc<Left><Left><Left>
" }}}
" Sessions {{{2
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>
" }}}
" Soft Wrap Mode {{{2
" ******* Remapping keys for Soft Wrap Mode *******
" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$
" }}}
" ESCAPE Key  {{{2
" Use control-c instead of escape
" nnoremap <C-c> <Esc>

" " I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>
" }}}
" Folders {{{2
" Remote Folders
map <F3> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/<CR>
map <F4> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/<CR>
map <F5> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/Python/<CR>

" Switch Directory to Work Directory (SHELL)
nnoremap <leader>gw :cd $AMDG_WORK_DIR<CR>
" }}}
" Netrw {{{2
nnoremap <leader><leader><CR> :Vex<CR>
" }}}
" INSERT COMMANDS {{{2
" Dates {{{3
" Dates
nmap <localleader>id i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>
imap <localleader>id [<C-R>=strftime("%Y-%m-%d")<CR>]

" Datetime
nmap <leader>idt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <leader>idt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" }}}
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
" }}}
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
" }}}
" my commands {{{3
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
" }}} 
" PLUGINS {{{1
" Automatically Install Vim-Plug
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-Plug {{{2
call plug#begin('$HOME/.config/nvim/plugged')
    " Languages: Julia
    Plug 'JuliaEditorSupport/julia-vim'

    " Git
    Plug 'tpope/vim-fugitive'
   
   	" Language: Python
   	" Plug 'python-mode/python-mode', { 'branch': 'develop' }
   
    " Language: Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'dhruvasagar/vim-table-mode'
   
    " Languages: LaTeX
    Plug 'lervag/vimtex'
   
   	" Code Editing:
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
   
    " Note Taking Task Management:
    Plug 'dkarter/bullets.vim'
    Plug 'lervag/wiki.vim'
   
   	" Files Folders: 
   	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   	Plug 'junegunn/fzf.vim'
   	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   
   	" Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Snippets: are separated from the engine. Add this if you want them:
   	Plug 'honza/vim-snippets'
   
    " Writing Experience: LaTeX
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    Plug 'junegunn/goyo.vim'
    " Plug 'junegunn/limelight.vim'

    " Markdown Preview:
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   
   	" Appearance: Themes
   	Plug 'dracula/vim',{ 'as': 'dracula' }
    Plug 'mhartington/oceanic-next'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'gruvbox-community/gruvbox'
    Plug 'rakr/vim-one'  
  
    " Appearance: Airline
    Plug 'itchyny/lightline.vim'

    " Plug 'ctrlpvim/ctrlp.vim'

    " Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Press gx to open the GitHub URL for a plugin or a commit with the default browser.
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END
" }}}
" Load Plugin Files {{{2
source $AMDG_CONFIG_DIR/nvim/plugins/vimtex.vim
source $AMDG_CONFIG_DIR/nvim/plugins/fzf.vim

" File Explorer
source $AMDG_CONFIG_DIR/nvim/plugins/netrw.vim
source $AMDG_CONFIG_DIR/nvim/plugins/nerdtree.vim

" " Note Taking
source $AMDG_CONFIG_DIR/nvim/plugins/bullets.vim
source $AMDG_CONFIG_DIR/nvim/plugins/wikivim.vim

" Coc Autocompletion and Explorer
source $AMDG_CONFIG_DIR/nvim/plugins/coc.vim

" Languages
source $AMDG_CONFIG_DIR/nvim/plugins/markdown.vim
source $AMDG_CONFIG_DIR/nvim/plugins/easy-align.vim
source $AMDG_CONFIG_DIR/nvim/plugins/julia.vim

" Appearance: Themes & Airline/Lightline
" source $AMDG_CONFIG_DIR/nvim/plugins/themes.vim

" Writing
source $AMDG_CONFIG_DIR/nvim/plugins/goyo.vim
" }}}
" }}}
" SETTINGS {{{1 
syntax enable                          " Enables syntax highlighing
set hidden                             " Required to keep multiple buffers open multiple buffers

set pumheight=10                        " Makes popup menu smaller
" set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set mouse=a                             " Enable your mouse
set t_Co=256                            " Support 256 colors

set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs 
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set timeoutlen=300                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else

" SELL CHECKING {{{2
set spell
" }}}
" TEXT WIDTH {{{2 
set tw=80                               " set textwidth
" }}}
" LINE WRAPPING {{{2
set wrap linebreak nolist               " Soft wrap
set encoding=utf-8                      " The encoding displayed 

set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

set conceallevel=2 
" }}}
" INDENTATION {{{2 
"Indentation  without hard tabs
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
" }}}
" LINE NUMBERS {{{2
" set number " Display Line Numbers
set number relativenumber

set cursorline                          " Enable highlighting of the current line

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" }}}
" FOLDING {{{2
" Enable folding
set foldmethod=syntax
" set foldlevel=1
set foldlevelstart=1
" }}}
" AUTOCOMPLETION {{{2
" Enable autocompletion:
set wildmode=longest,list,full

" ****** Key Behavior *****
set backspace=2 " make backspace work like most other programs

" Fuzzy Search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" }}}
" }}}
" COMMENTING {{{1
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" MY COMMANDS {{{1
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" }}}
" Block-wise movements and block text-objects {{{1
" runtime macros/matchit.vim
" }}}

" Transparency
 source $AMDG_CONFIG_DIR/nvim/plugins/themes.vim

