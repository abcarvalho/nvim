" vim: set fdm=marker : 


" Ensure files are read as what I want:
" autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" VimTeX Zathura Synctex 

"  SETTINGS  {{{1
" let g:mapleader = "\<Space>"            " set leader key 
" set nowrap                              " Display long lines as just one line
" set conceallevel=0                      " So that I can see `` in markdown files
" set softtabstop=2
" set number                              " Line numbers
" set laststatus=0                        " Always display the status line
" set autochdir                           " Your working directory will always be the same as your working directory

" You can't stop me
" cmap w!! w !sudo tee %

"  PLUGINS {{{1
    " Git 
    Plug 'tpope/vim-fugitive'
    
    " Org Mode
    
    " Quick TeX
    Plug 'brennier/quicktex'
    
    " Buffers & Tabs
    Plug 'qpkorr/vim-bufkill'
    
    " Languages
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-pandoc/vim-pandoc'

    " Language: LaTeX
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

    " Language: 
    Plug 'dkarter/bullets.vim'
    
    " Markdown Preview:
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   
    " Note Taking: VimWiki
    Plug 'vimwiki/vimwiki'
    Plug 'lervag/wiki.vim'
    Plug 'jceb/vim-orgmode'
    
        " Task Management
    Plug 'tbabej/taskwiki'
    Plug 'blindFS/vim-taskwarrior'
    
    " Autocompletion 
    "Plug 'valloric/youcompleteme'

    " Snippets
    Plug 'sirver/ultisnips' " snippets engine

    " Appearance: Themes
    Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
    Plug 'cocopon/iceberg.vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'skreek/skeletor.vim'
    Plug 'Rigellute/shades-of-purple.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'fenetikm/falcon'
    Plug 'desmap/slick'
    Plug 'cocopon/iceberg.vim'
    Plug 'koirand/tokyo-metro.vim'
    Plug 'yuttie/hydrangea-vim'
    Plug 'wadackel/vim-dogrun'
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'Zabanaa/neuromancer.vim'
    Plug 'morhetz/gruvbox'
    Plug 'mhartington/oceanic-next'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'lifepillar/vim-solarized8'
    Plug 'dracula/vim',{ 'as': 'dracula' }
    Plug 'wadackel/vim-dogrun'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'rakr/vim-one'  
    Plug 'gruvbox-community/gruvbox'
    Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
    
    " Airline and LightLine
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
    
    " Appearance: Line Indentation
    " Plug 'Yggdroot/indentLine'

    Plug 'https://github.com/alok/notational-fzf-vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    
    Plug 'junegunn/limelight.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    
    Plug 'preservim/nerdcommenter'
    " Appearance: Math
    " Plug 'junegunn/rainbow_parentheses.vim'

    " Moving Text Around
    " Plug 'matze/vim-move'
"}}}1
"  MAPPINGS  {{{1
" Sessions {{{2
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>
" }}}2
" Folders {{{2
" Remote Folders
map <F3> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/<CR>
map <F4> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/<CR>
map <F5> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/Python/<CR>
" }}}2
" Quit {{{2
" nnoremap <Leader>q :q<cr>
" nnoremap <Leader>Q :qa!<cr>

" }}}2
" Directories {{{2
" Switch Directory to Work Directory (SHELL)
" nnoremap <leader>gr :cd $ZEN_REPOS_DIR<CR>
" nnoremap <leader>gk :cd $ZEN_WORK_DIR<CR>
" nnoremap <leader>gv :cd $ZEN_WIKI_DIR<CR>
" nnoremap <leader>go :cd $ZEN_ORG_DIR<CR>
" }}}2
" Save {{{2
" Quick save file 
" nnoremap zz :update<CR>
" inoremap <C-s>     <C-O>:update<cr>
" nnoremap <C-s>     :update<cr>
inoremap <leader>fs  <C-O>:w<cr>
noremap <leader>fs  :w<cr>
" }}}2
" Windows {{{2
" <tab> / <s-tab> | Circular windows navigation
" nnoremap <tab>   <c-w>w
" nnoremap <S-tab> <c-w>W
" nnoremap <leader><tab>   <c-w>w
" nnoremap <leader><S-tab> <c-w>W
" nnoremap ]w   <c-w>w
" nnoremap [w <c-w>W

" Better window navigation
" Shortcutting split navigation, saving a keypress:
" nnoremap <C-w> <C-w>w

" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>    :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>


" use alt+hjkl to move between split/vsplit panels
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l
" }}}2
" Buffers {{{2
" nnoremap ]b :bnext<cr>
" nnoremap [b :bprev<cr>

" List Buffers
" nmap <leader>bb :Buffers<CR>
" nmap <leader>bb :Buffers<CR>

" Buffer delete
" nmap <leader>bd :bd<CR>
" }}}2
" TABS {{{2
" New TAB
" nnoremap <leader><tab>n :tabnew<CR>

" Delete TAB
" nnoremap <leader><tab>d :tabclose<CR>

" Switch to next or previous tab
" nnoremap ]t :tabn<cr>
" nnoremap [t :tabp<cr>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" nnoremap [<tab> :tabprevious<CR>
" nnoremap ]<tab> :tabnext<CR>

" Go to tab by number
" noremap <leader>t1 1gt
" noremap <leader>t2 2gt
" noremap <leader>t3 3gt
" noremap <leader>t4 4gt
" noremap <leader>t5 5gt
" noremap <leader>t6 6gt
" noremap <leader>t7 7gt
" noremap <leader>t8 8gt
" noremap <leader>t9 9gt
" noremap <leader>t0 :tablast<cr>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Quick save in insert mode:
" inoremap zz <Esc>:update<cr>gi
" }}}2
" TABS v.s. WORKSPACES  {{{2
" }}}2
" ESCAPE Key  {{{2
" Use control-c instead of escape
" nnoremap <C-c> <Esc>

" " I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>
" }}}2
" Netrw {{{2
" nnoremap <leader><leader><CR> :Vex<CR>
nnoremap <leader>n :Vex<CR>
" }}}2
" Files
nmap <leader>gf :GFiles<CR>
" nmap <leader>ff :Files<CR>
nmap <leader><leader>f :Files<CR>

" Buffers
" nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

" Tags
nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

" Lines
" nmap <leader>l :BLines<CR>
nmap <leader>sb :BLines<CR>

" Search project
nmap <leader>sp :Rg<CR>

nmap <leader>L :Lines<CR>
nmap <leader>' :Marks<CR>

" Fuzzy Search
nnoremap <C-p> :FZF<CR>
" }}}2
" Goyo {{{2
noremap <leader>gg :Goyo<CR>
" }}}2
" }}}1
"  TEXT_EDITING  {{{1

" TextEdit might fail if hidden is not set.
" set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300


" INDENTATION {{{2
" ****** IndentLine ******
" The default settings for the indentLine plugin will have a negative impact on Vim scroll performance.
" let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0

" Autocompletion {{{2
" THESE HAVE BEEN SET in SETTINGS:
" AUTOCOMPLETION
" use dash in autocomplete
" set iskeyword+=\-

" COMMENTING {{{2

" *****  NERDcommenter ******
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" Load Plugin Config {{{1

" Text Editing {{{1
source $HOME/.config/nvim/plugins/bullets.vim
" }}}1
" Languages {{{1

" Notes
" after loading pandoc markdown
source $HOME/.config/nvim/plugins/wiki.vim
" }}}1
" Config  {{{1
" Which Key {{{2
" Forward and Backwards {{{3
nnoremap [ :WhichKey "search-prev"<CR>
let g:my_search_prev_map = {
      \ 'name' : '+switch-prev' ,
      \ 'w' : ['<c-w>W'     , 'window'],
      \ 'b' : [':bprev'     , 'buffer'],
      \ '<Tab>' : [':tabprevious', 'tab'],
      \}
call which_key#register('search-prev', "g:my_search_prev_map")

nnoremap ] :WhichKey "search-next"<CR>
let g:my_search_next_map = {
      \ 'name' : '+switch-next' ,
      \ 'w' : ['<c-w>w'     , 'window'],
      \ 'b' : [':bnext'     , 'buffer'],
      \ '<Tab>' : [':tabnext', 'tab'],
      \}
call which_key#register('search-next', "g:my_search_next_map")
" }}}3
" }}}2
" lf file manager {{{2
map <leader>m :Lf<CR>

" }}}2
" Netrw {{{2
" Open up netrw File Explorer
nnoremap <silent> <leader>fe :Lexplore<CR>

" }}}2
" fzf {{{2
nnoremap <leader>fp :call fzf#run({'options': '--reverse --prompt "ZEN PRIVATUS: "', 'down': 20, 'dir': '$ZEN_PRIVATUS_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fr :call fzf#run({'options': '--reverse --prompt "ZEN REPOS: "', 'down': 20, 'dir': '$ZEN_REPOS_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fk :call fzf#run({'options': '--reverse --prompt "ZEN WORK: "', 'down': 20, 'dir': '$ZEN_WORK_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fv :call fzf#run({'options': '--reverse --prompt "ZEN WIKI: "', 'down': 20, 'dir': '$ZEN_WIKI_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fo :call fzf#run({'options': '--reverse --prompt "ZEN ORG: "', 'down': 20, 'dir': '$ZEN_ORG_DIR', 'sink': 'e' })<CR>

command! -bang -nargs=* RGrepWiki
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 
            \1, fzf#vim#with_preview({ 'dir': '$ZEN_WIKI_DIR'}), <bang>0)
" nnoremap <leader>fb :call fzf#run({'options': '--reverse --prompt "Obsidian: "', 'down': 20, 'dir': '$ZEN_WIKI_DIR/obsd', 'sink': 'e' })<CR>
nnoremap <leader>rk :RGrepWiki<CR>

command! -bang -nargs=* RGrepObs
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 
            \1, fzf#vim#with_preview({ 'dir': '$ZEN_WIKI_DIR/obsd'}), <bang>0)
nnoremap <leader>ro :RGrepObs<CR>
" nnoremap <leader>fz :call fzf#run({'options': '--reverse --prompt "ZTK Notes: "', 'down': 20, 'dir': '$ZEN_WIKI_DIR/obsd/ztk', 'sink': 'e' })<CR>

" Include option to search for hidden files in the dotfiles directory:
" nnoremap <leader>fc :call fzf#run({'source': 'find .', 'options': '--reverse --prompt "ZEN DOTFILES: "', 'down': 20, 'dir': '$ZEN_DOTFILES_DIR', 'sink': 'e' })<CR>
"}}}2
" Easy-Align {{{2
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}2
" Notational FZF {{{2
let g:nv_search_paths = ['$ZEN_WIKI_DIR']
nnoremap <silent> <leader>fz :NV<CR>
" }}}2
" LANGS {{{2
" PYTHON {{{3
" let g:pymode_python = 'python3'
" }}}3
" JULIA  {{{3
" :hi link juliaParDelim Delimiter
" :hi juliaComma guifg=Red ctermfg=Red
" Disable LaTeX-to-Unicode via Tab key
" :let g:latex_to_unicode_tab = 0
" LateX-to-Unicaode as you type
" let g:latex_to_unicode_auto = 1
" Enabling and disabling the LaTeX-to-Unicode functionality
" }}}3 
" LateX Setup {{{3
"autocmd BufEnter *.tex set foldmethod=expr
"autocmd BufEnter *.tex set foldexpr=vimtex#fold#level(v:lnum)
"autocmd BufEnter *.tex set foldtext=vimtex#fold#text()

"let g:vimtex_fold_manual=1

"let g:vimtex_compiler_latexmk = {
"    \ 'backend' : 'jobs',
"    \ 'background' : 1,
"    \ 'build_dir' : '',
"    \ 'callback' : 1,
"    \ 'continuous' : 1,
"    \ 'executable' : 'latexmk',
"    \ 'options' : [
"    \   '-shell-escape',
"    \   '-verbose',
"    \   '-file-line-error',
"    \   '-synctex=1',
"    \   '-interaction=nonstopmode',
"    \ ],
"    \}
"

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
" autocmd VimLeave *.tex !texclear %

" Tex Conceal
" set conceallevel=2
" }}}3
" }}}2
" NERDTree {{{2
" let NERDTreeShowBookmarks=1

" " Automatically delete the buffer of deleted files
" let NERDTreeAutoDeleteBuffer = 1

" " Make it pretty:
" let g:NERDTreeShowHidden = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeIgnore = []
" let g:NERDTreeStatusline = ''

" " Automatically close a tab if the only remaining window is NerdTree
" " (Automaticaly close vim/nvim if NERDTree is only thing left open)
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " set autochdir                                " the working directory is always the one where the active buffer is located
" let NERDTreeChDirMode=2                        " make sure the working directory is set correctly.

" " Toggle
" " nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" nnoremap <silent> <leader><CR> :NERDTreeToggle<CR>
" }}}2
" VIM WIKI  {{{2
set nocompatible
filetype plugin on

" Ensure files are read as what I want:
" let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Vim Wiki
let g:vimwiki_list = [{'path': '/Users/acarvalho/Library/Mobile Documents/com~apple~CloudDocs/Work/wiki/vm'}] " , 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1

" enable global highlighting
let g:vimwiki_folding='expr'

" Set filetype to markdown in VimWiki:
au FileType vimwiki set filetype=vimwiki.wiki

" prevent Vimwiki from considering every markdown-file as a wiki file
" let g:vimwiki_global_ext = 0


" " Ensure files are read as what I want:
" " let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" " Vim Wiki
" let g:vimwiki_list = [{'path': '/Users/acarvalho/Library/Mobile Documents/com~apple~CloudDocs/Work/wiki/vw',
"       \ 'syntax': 'markdown', 'ext': '.md'}]
" " let g:vimwiki_hl_headers = 1

" " enable global highlighting
" " let g:vimwiki_folding='expr'

" " prevent Vimwiki from considering every markdown-file as a wiki file
" let g:vimwiki_global_ext = 0

" " Set filetype to markdown in VimWiki:
" let g:vimwiki_folding = 'custom'

" " au FileType vimwiki set filetype=pandoc
" au FileType vimwiki set syntax=markdown.pandoc
" }}}2 
" UltiSnippets {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" set runtimepath+=$ZEN_DOTFILES_DIR/nvim/UltiSnips
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "tex.snippets"]
"}}}2
" Appearance {{{2
" Appearance: Themes & Airline/Lightline {{{3
" Themes
" colorscheme dracula
" colorscheme OceanicNext
" colorscheme challenger_deep

" Dogrun
" colorscheme dogrun
" let g:lightline = {'colorscheme': 'dogrun'}

" Gruvbox
" autocmd vimenter * colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" let g:lightline = { 'colorscheme': 'gruvbox'}

" One 
" let g:one_allow_italics = 1 " I love italic for comments
" colorscheme one
" }}}3
" Rainbow Parenthesis {{{3
"let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"" List of colors that you do not want. ANSI code or #RRGGBB
""let g:rainbow#blacklist = [233, 234]

"" Activation based on file type
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType lisp,julia,tex RainbowParentheses
"augroup END
" }}}3
" }}}2
" }}}1
" BAD ASS FOLDING  {{{1
" See: https://vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file

" "" Autofolding .vimrc
" " see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" """ defines a foldlevel for each line of code
" function! VimFolds(lnum)
"   let s:thisline = getline(a:lnum)
"   if match(s:thisline, '^"" ') >= 0
"     return '>2'
"   endif
"   if match(s:thisline, '^""" ') >= 0
"     return '>3'
"   endif
"   let s:two_following_lines = 0
"   if line(a:lnum) + 2 <= line('$')
"     let s:line_1_after = getline(a:lnum+1)
"     let s:line_2_after = getline(a:lnum+2)
"     let s:two_following_lines = 1
"   endif
"   if !s:two_following_lines
"       return '='
"     endif
"   else
"     if (match(s:thisline, '^"""""') >= 0) &&
"        \ (match(s:line_1_after, '^"  ') >= 0) &&
"        \ (match(s:line_2_after, '^""""') >= 0)
"       return '>1'
"     else
"       return '='
"     endif
"   endif
" endfunction
" 
" """ defines a foldtext
" function! VimFoldText()
"   " handle special case of normal comment first
"   let s:info = '('.string(v:foldend-v:foldstart).' l)'
"   if v:foldlevel == 1
"     let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
"   elseif v:foldlevel == 2
"     let s:line = '   ●  '.getline(v:foldstart)[3:]
"   elseif v:foldlevel == 3
"     let s:line = '     ▪ '.getline(v:foldstart)[4:]
"   endif
"   if strwidth(s:line) > 80 - len(s:info) - 3
"     return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
"   else
"     return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
"   endif
" endfunction
" 
" """ set foldsettings automatically for vim files
" augroup fold_vimrc
"   autocmd!
"   autocmd FileType vim 
"                    \ setlocal foldmethod=expr |
"                    \ setlocal foldexpr=VimFolds(v:lnum) |
"                    \ setlocal foldtext=VimFoldText() |
"      "              \ set foldcolumn=2 foldminlines=2
" augroup END
" }}}1
" Block-wise movements and block text-objects {{{1
" runtime macros/matchit.vim
" }}}1
" ZTK {{{1
" function! FintechNote()

"   " build the file name
"   let l:fname = expand('~/$ZEN_ORF_DIR/fintech.org') 

"   " edit the new file
"   exec "e " . l:fname

"   " enter the title and timestamp (using ultisnips) in the new file
"   " exec "normal ggO# \<c-r>=strftime('%Y-%m-%d %H:%M')\<cr>\<cr>\<esc>ggo"
"   exec "normal ggO# [\<C-R>=strftime('%Y-%m-%d %H:%M')\<CR>]\<ESC>o"
" endfunction

" command! FintechOrg call FintechNote()
" nnoremap <leader>oO :OrgWork<CR>
" nnoremap  <leader>fn :FintechOrg<CR>
" nmap <leader>dt i# [<C-R>=strftime('%Y-%m-%d %H:%M')<CR>]<ESC>o
" nnoremap <leader>ft :e <C-R>=expand('$ZEN_ORG_DIR/fintech.org')<CR><CR>

function! Zettel(...)

  " build the file name
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif
  let l:fname = expand('~/$ZEN_WIKI_DIR/obsd/ztk/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

  " edit the new file
  exec "e " . l:fname

  " enter the title and timestamp (using ultisnips) in the new file
  if len(a:000) > 0
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr> " . join(a:000) . "\<cr>\<esc>G"
  else
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr>\<cr>\<esc>G"
  endif
endfunction

command! -nargs=* Ztk call Zettel(<f-args>)
" }}}1 
" Custom Sections {{{1
function! CustomSections(dir, regex)
	if a:dir ==# 'up'
		call search(a:regex,'bW')
	else
		call search(a:regex,'W')
	endif
endfunction
" }}}1
