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


" MAPPINGS {{{1
source $ARES_CONFIG_DIR/nvim/mappings.vim

" PLUGINS {{{1
source $ARES_CONFIG_DIR/nvim/plugins/plugins.vim

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

" TEXT WIDTH {{{2 
set tw=80                               " set textwidth

" LINE WRAPPING {{{2
set wrap linebreak nolist               " Soft wrap
set encoding=utf-8                      " The encoding displayed 

set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

set conceallevel=2 

" INDENTATION {{{2 
"Indentation  without hard tabs
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation

" LINE NUMBERS {{{2
" set number " Display Line Numbers
set number relativenumber

set cursorline                          " Enable highlighting of the current line

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" FOLDING {{{2
" Enable folding
set foldmethod=syntax
set foldlevel=1
set foldlevelstart=2

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

" COMMENTING {{{1
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" MY COMMANDS {{{1
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" Block-wise movements and block text-objects {{{1
" runtime macros/matchit.vim

