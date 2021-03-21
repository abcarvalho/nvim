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

"  PLUGINS  {{{1
    " Git 
    " Plug 'tpope/vim-fugitive'

	" Org Mode

	" Quick TeX
	"Plug 'brennier/quicktex'

	" Buffers & Tabs
	"Plug 'qpkorr/vim-bufkill'

	" Languages
	" Plug 'sheerun/vim-polyglot'
  " Plug 'vim-pandoc/vim-pandoc'

  " Note Taking: VimWiki
	Plug 'vimwiki/vimwiki'
  Plug 'lervag/wiki.vim'
  Plug 'jceb/vim-orgmode'

  " Language: 
  Plug 'dkarter/bullets.vim'

  " Task Management
  Plug 'tbabej/taskwiki'
  Plug 'blindFS/vim-taskwarrior'

  " Autocompletion 
	"Plug 'valloric/youcompleteme'

  " Appearance: Themes
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
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

  " Appearance: Line Indentation
	" Plug 'Yggdroot/indentLine'

	Plug 'preservim/nerdcommenter'

  " Appearance: Math
  " Plug 'junegunn/rainbow_parentheses.vim'

  " Moving Text Around
  " Plug 'matze/vim-move'


"  MAPPINGS  {{{1

" use alt+hjkl to move between split/vsplit panels
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l
 
 
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Quick save in insert mode:
" inoremap zz <Esc>:update<cr>gi

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


" Languages {{{1

" Notes
" after loading pandoc markdown
source $HOME/.config/nvim/plugins/wiki.vim


"  ETC  {{{1

" LANGS {{{2
" PYTHON {{{3
" let g:pymode_python = 'python3'

" JULIA  {{{3
" :hi link juliaParDelim Delimiter
" :hi juliaComma guifg=Red ctermfg=Red
" Disable LaTeX-to-Unicode via Tab key
" :let g:latex_to_unicode_tab = 0
" LateX-to-Unicaode as you type
" let g:latex_to_unicode_auto = 1
" Enabling and disabling the LaTeX-to-Unicode functionality

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

" FILE EXPLORER {{{2
"" NERDTree
" Make it pretty:
" let g:NERDTreeWinSize=20
" let NERDTreeDirArrows = 1
"" Vim Wiki
" let g:vimwiki_folding='syntax'


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



" VIM WIKI  {{{1
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


" Appearance {{{1

" Rainbow Parenthesis {{{2
"let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"" List of colors that you do not want. ANSI code or #RRGGBB
""let g:rainbow#blacklist = [233, 234]

"" Activation based on file type
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType lisp,julia,tex RainbowParentheses
"augroup END

