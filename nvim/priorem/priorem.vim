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
" Automatically Install Vim-Plug {{{2
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}2 
" Vim-Plug {{{2
call plug#begin('$HOME/.config/nvim/plugged')
    " Which Key
    Plug 'liuchengxu/vim-which-key'

    " Files and Folders: fzf
    Plug 'junegunn/fzf.vim'

   	" Code Editing:
    Plug 'unblevable/quick-scope'
    Plug 'justinmk/vim-sneak'

    " Commands:
    " Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'

    " Git 
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    
    " Quick TeX
    Plug 'brennier/quicktex'
    
    " Buffers & Tabs
    Plug 'qpkorr/vim-bufkill'
    
    " Languages
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-pandoc/vim-pandoc'

    " Files and Folders: Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'https://github.com/alok/notational-fzf-vim'

    " Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
   " Languages: Julia
    Plug 'JuliaEditorSupport/julia-vim'

    " Language: Python
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
  
    " Language: LaTeX
    Plug 'lervag/vimtex'
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

    " Language: Org
    Plug 'dhruvasagar/vim-dotoo' 
    " Plug 'jceb/vim-orgmode'

    " Language: Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'dhruvasagar/vim-table-mode'

    " Language: 
    Plug 'dkarter/bullets.vim'
  
    " Text Alignment:
    Plug 'junegunn/vim-easy-align'

    " Code Editing:
    Plug 'tpope/vim-commentary'
    Plug 'easymotion/vim-easymotion'
    
    " Markdown Preview:
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   
    " Note Taking:
    Plug 'lervag/wiki.vim'
    " Plug 'vimwiki/vimwiki'
    
    " Task Management
    Plug 'tbabej/taskwiki'
    Plug 'blindFS/vim-taskwarrior'
    
    " Autocompletion 
    "Plug 'valloric/youcompleteme'

    " Snippets:
    Plug 'honza/vim-snippets' " snippet files
    " Plug 'sirver/ultisnips' " snippets engine

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
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'ajmwagar/vim-deus'
    
    " Airline and LightLine
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'

    " Appearance: Lightline 
    " Plug 'itchyny/lightline.vim'
  
    " Appearance: Line Indentation
    " Plug 'Yggdroot/indentLine'

    Plug 'https://github.com/alok/notational-fzf-vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    
    Plug 'junegunn/limelight.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    
    Plug 'preservim/nerdcommenter'

    " Appearance: Math
    Plug 'junegunn/rainbow_parentheses.vim'

    " Moving Text Around
    Plug 'matze/vim-move'

    " Writing Experience: LaTeX
    Plug 'junegunn/goyo.vim'
call plug#end()
" }}}2
" Automatically install missing plugins on startup {{{2
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
" }}}2 
"}}}1
" Appearance: Themes & Airline/Lightline {{{1
" colorscheme deus
" let g:lightline = {'colorscheme': 'deus' }
" colorscheme tokyonight
" let g:tokyonight_transparent = true

" let g:lightline = {'colorscheme': 'nightfly' }
" }}}1
"  mappings  {{{1
" Forward and Backwards {{{2
" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" Tabs
nnoremap ]<tab> :tabn<cr>
nnoremap [<tab> :tabp<cr>

"Windows
nnoremap ]w <c-w>w
nnoremap [w <c-w>W

" Coc Diagnostics
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" }}}2
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
inoremap <C-Q>     <esc>:q<cr>
" }}}2
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

" Better window navigation
" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
" time {{{2
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" }}}2
" }}}2
" replace all {{{2
nnoremap R :%s//gc<Left><Left><Left>
" }}}2
" Reordering lines  {{{2
" :nnoremap <M-k> <Up>"add"ap<p>
" :nnoremap <M-j> "add"ap
:nnoremap <silent><M-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><M-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
" }}}2
" toggle folding {{{2
nnoremap <TAB> za
onoremap <TAB> <C-C>za
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
" Note Taking {{{2
" Bullets {{{3
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \]

" Disable the plugin for empty buffers
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}3
" WikiVim {{{3
let g:wiki_root=$ZEN_WIKI_DIR
let g:wiki_filetypes = ['md']
let g:wiki_link_target_type = 'md'
let g:wiki_link_extension = '.md'

let g:wiki_mappings_use_default=0
let g:wiki_global_load=0
let g:wiki_link_toggle_on_follow=0
" let g:wiki_mappings_use_defaults='global'
" let g:wiki_mappings_global = {
"          \ '<plug>(wiki-link-follow)' : ',fl',
"          \ '<plug>(wiki-link-return)'  : ',bl',
"          \}
" }}}3
" }}}2
" Coc Autocompletion and Explorer{{{2
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300 " already set

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=yes 

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc-Explorer {{{4
" let g:coc_explorer_global_presets = {
" \   'floating': {
" \     'position': 'floating',
" \   },
" \   'floatingLeftside': {
" \     'position': 'floating',
" \     'floating-position': 'left-center',
" \     'floating-width': 30,
" \   },
" \   'floatingRightside': {
" \     'position': 'floating',
" \     'floating-position': 'left-center',
" \     'floating-width': 30,
" \   },
" \   'simplify': {
" \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
" \   }
" \ }

" " Use preset argument to open it
" " nmap <space>ed :CocCommand explorer --preset .julia<CR>
" nmap <space>ef :CocCommand explorer --preset floatingLeftSide<CR>

" " List all presets
" nmap <space>el :CocList explPresets
" }}}3
" Coc-Snippets {{{3
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" }}}3
" }}}2
" Org Mode {{{2
autocmd! BufRead,BufNewFile *.org  setlocal filetype=dotoo

let g:dotoo#agenda#files=['$ZEN_ORG_DIR/*.org']
let g:dotoo#capture#refile=expand('$ZEN_ORG_DIR/refile.org')

let g:dotoo#parser#todo_keywords = [
  \ 'TODO',
  \ 'INPROGRESS', 
  \ 'NEXT',
  \ 'WAIT',
  \ '|',
  \ 'CANCELLED',
  \ 'DONE']

let g:dotoo#agenda_views#agenda#span = 'week'
" }}}2
" Note Taking {{{2
" Bullets {{{3
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'org',
    \ 'dotoo',
    \]

" Disable the plugin for empty buffers
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}3
" }}}2
" Coc Autocompletion and Explorer {{{2
" My CONFIG {{{3
" autocmd FileType markdown,org,dotoo let b:coc_suggest_disable = 1

" enable/disable coc integration with airline:
" let g:airline#extensions#coc#enabled = 1
" }}}3
" }}}2
" Org Mode {{{2
autocmd! BufRead,BufNewFile *.org  setlocal filetype=dotoo

let g:dotoo#agenda#files=['$ZEN_ORG_DIR/*.org']
let g:dotoo#capture#refile=expand('$ZEN_ORG_DIR/refile.org')

" let g:dotoo_todo_keyword_faces = [
"                                \  ['TODO', [':foreground 160', ':weight bold']],
"                                \  ['INPROGRESS', [':foreground 202', ':weight bold']],
"                                \  ['NEXT', [':foreground 27', ':weight bold']],
"                                \  ['WAIT', [':foreground 202', ':weight bold']],
"                                \  ['HOLD', [':foreground 53', ':weight bold']],
"                                \  ['MEETING', [':foreground 22', ':weight bold']],
"                                \  ['PHONE', [':foreground 22', ':weight bold']],
"                                \  ['KILL', [':foreground 22', ':weight bold']],
"                                \  ['CANCELLED', [':foreground 22', ':weight bold']],
"                                \  ['DONE', [':foreground 22', ':weight bold']],
"                                \ ]

let g:dotoo#parser#todo_keywords = [
  \ 'TODO',
  \ 'INPROGRESS', 
  \ 'NEXT',
  \ 'WAIT',
  \ 'HOLD',
  \ 'MEETING',
  \ 'PHONE',
  \ '|',
  \ 'KILL', 
  \ 'CANCELLED',
  \ 'DONE']

nnoremap <buffer><silent> ]] :call CustomSections('down', '^\* ')<CR>
nnoremap <buffer><silent> [[ :call CustomSections('up', '^\* ')<CR>
xnoremap <buffer><silent> [[ :<C-U>exe "norm! gv"<bar>call CustomSections('up', '^\* ')<CR>
xnoremap <buffer><silent> ]] :<C-U>exe "norm! gv"<bar>call CustomSections('down', '^\* ')<CR>

autocmd FileType org,dotoo inoreabbrev todo TODO
autocmd FileType org,dotoo inoreabbrev done DONE
" }}}2
" ranger file manager {{{2
" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 1

" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 0

" Change the border's color
" let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Add a shadow window, value is equal to 100 will disable shadow
" let g:rnvimr_shadow_winblend = 70

" Draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine
" }}}2
" Which Key {{{2
" Which Key - Space {{{3
let g:space_key_map['n'] = [ 'RnvimrToggle' , 'ranger' ]
let g:space_key_map['z'] = [ 'Goyo'      , 'zen' ]
" b is for buffers {{{4
let g:space_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'b' : [':Buffers', 'list-buffers'],
      \}
" }}}4
" c for CoC {{{4
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cb  <Plug>(coc-codeaction)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Use <leader>cx for convert visual selected code to snippet
xmap <leader>cv  <Plug>(coc-convert-snippet)

" Apply AutoFix to problem on the current line.
nmap <leader>cx  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>

let g:space_key_map.c = {
      \ 'name' : '+coc' ,
      \}

let g:space_key_map.c.a = 'codeaction-selected'
let g:space_key_map.c.b = 'codeaction buffer'
let g:space_key_map.c.c = 'commands'
let g:space_key_map.c.d = 'diagnostics'
let g:space_key_map.c.e = 'extensions'
let g:space_key_map.c.f = 'format-selected'
let g:space_key_map.c.j = 'next'
let g:space_key_map.c.k = 'prev'
let g:space_key_map.c.o = 'outline'
let g:space_key_map.c.p = 'list resume'
let g:space_key_map.c.r = 'rename symbol'
let g:space_key_map.c.s = 'list symbols'
let g:space_key_map.c.v = 'convert-snippet'
let g:space_key_map.c.x = 'fix-current'
" }}}4
" d is for directory {{{4
let g:space_key_map.d = {
      \ 'name' : '+directory' ,
      \ 'r' : [':cd $ZEN_REPOS_DIR'     , 'repos'],
      \ 'k' : [':cd $ZEN_WORK_DIR'     , 'work'],
      \ 'v' : [':cd $ZEN_WIKI_DIR'     , 'wiki'],
      \ 'o' : [':cd $ZEN_ORG_DIR'     , 'org'],
      \}
" }}}4
" f is for file {{{4
command! ZenPrivatus call fzf#run({'options': '--reverse --prompt "ZEN PRIVATUS: "', 'down': 20, 'dir': '$ZEN_PRIVATUS_DIR', 'sink': 'e' })<CR>
command! ZenOrg call fzf#run({'options': '--reverse --prompt "ZEN ORG: "', 'down': 20, 'dir': '$ZEN_ORG_DIR', 'sink': 'e' })
command! ZenRepos call fzf#run({'options': '--reverse --prompt "ZEN REPOS: "', 'down': 20, 'dir': '$ZEN_REPOS_DIR', 'sink': 'e' })<CR>
command! ZenWork call fzf#run({'options': '--reverse --prompt "ZEN WORK: "', 'down': 20, 'dir': '$ZEN_WORK_DIR', 'sink': 'e' })<CR>
command! ZenWiki call fzf#run({'options': '--reverse --prompt "ZEN WIKI: "', 'down': 20, 'dir': '$ZEN_WIKI_DIR', 'sink': 'e' })<CR>
" Include option to search for hidden files in the dotfiles directory:
command! ZenDotFiles call fzf#run({'source': 'find .', 'options': '--reverse --prompt "ZEN DOTFILES: "', 'down': 20, 'dir': '$ZEN_DOTFILES_DIR', 'sink': 'e' })<CR>

" Notational FZF 
let g:nv_search_paths = ['$ZEN_WIKI_DIR']

let g:space_key_map.f = { 
     \ 'name' : '+file', 
     \ 'p' : [':ZenPrivatus', 'ZEN PRIVATUS'], 
     \ 'o' : [':ZenOrg', 'ZEN ORG'], 
     \ 'r' : [':ZenRepos', 'ZEN REPOS'], 
     \ 'k' : [':ZenWork', 'ZEN WORK'], 
     \ 'v' : [':ZenWiki', 'ZEN WIKI'], 
     \ 'c' : [':ZenDotFiles', 'ZEN DOTFILES'],
     \ 'z' : [':NV', 'NV DOTFILES'],
     \}
" }}}4
" o is for org {{{4
" Org Date
autocmd FileType org,dotoo nmap <leader>od i<<C-R>=strftime("%Y-%m-%d %a")<CR>>

" Org DateTime
autocmd FileType org,dotoo nmap <leader>ot i<<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR>>

" Org Schedule
autocmd FileType org,dotoo nmap <leader>os iSCHEDULE: <<C-R>=strftime("%Y-%m-%d %a")<CR>><Esc>
autocmd FileType org,dotoo nmap <leader>oD iDEADLINE: <<C-R>=strftime("%Y-%m-%d %a")<CR>><Esc>

let g:space_key_map.o = {
      \ 'name' : '+org-mode',
      \ 'a' : ['<Plug>(dotoo-agenda)a', 'agenda']
    \}

let g:space_key_map.o.D = 'deadline'
let g:space_key_map.o.s = 'schedule'
let g:space_key_map.o.d = 'date'
let g:space_key_map.o.t = 'datetime'
" }}}4
" r is for ranger {{{4
let g:space_key_map.r = { 
     \ 'name' : '+ranger', 
    \ 'r' : ['RnvimrToggle', 'ranger-toggle']
    \}

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
" }}}4
" s is for search {{{4
let g:space_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text-Ag'],
      \ 'b' : [':BLines'       , 'current-buffer'],
      \ 'B' : [':Buffers'      , 'open-buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer-commits'],
      \ 'f' : [':Files'        , 'fzf-files'],
      \ 'g' : [':GFiles'       , 'fzf-git-files'],
      \ 'G' : [':GFiles?'      , 'fzf-modified-git-files'],
      \ 'h' : [':History'      , 'file-history'],
      \ 'H' : [':History:'     , 'command-history'],
      \ 'l' : [':Lines'        , 'fzf-lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal-maps'] ,
      \ 'p' : [':Rg'           , 'project'] ,
      \ 'P' : [':Tags'         , 'project-tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color-schemes'],
      \ 't' : [':BTags'        , 'fzf-buffer-tags'],
      \ 'T' : [':Tags'         , 'fzf-tags'],
      \ 'w' : [':Windows'      , 'search-windows'],
      \ 'y' : [':Filetypes'    , 'file-types'],
      \ 'z' : [':FZF'          , 'fzf'],
      \ }
" }}}4
" }}}3
" Which Key - [, ] {{{3
" nnoremap <silent> [ :<c-u>WhichKey 'bb'<CR>
" " vnoremap <silent> [ :<c-u>WhichKeyVisual '['<CR>

" nnoremap <silent> ] :<c-u>WhichKey 'ff'<CR>
" " vnoremap <silent> ] :<c-u>WhichKeyVisual ']'<CR>

" " Register which key maps
" call which_key#register('bb', "g:prev_key_map")
" call which_key#register('ff', "g:next_key_map")

" " Create map to add keys to
" let g:prev_key_map = {}
" let g:next_key_map = {} 
" Forward and Backwards {{{4
" let g:prev_key_map['b'] = ['bprev'     , 'prev-buffer']
" let g:prev_key_map['<Tab>'] = ['tabp'     , 'prev-tab']
" let g:prev_key_map['w'] = ['<c-w>W'     , 'prev-window']
" let g:prev_key_map['g'] = ['<Plug>(coc-diagnostic-prev)'     , 'coc-diagnostic-prev']
" " let g:prev_key_map['s'] = 'prev-mispell'

" let g:next_key_map['b'] = ['bnext'     , 'next-buffer']
" let g:next_key_map['<Tab>'] = ['tabn'     , 'next-tab']
" let g:next_key_map['w'] = ['<c-w>W'     , 'next-window']
" let g:next_key_map['g'] = ['<Plug>(coc-diagnostic-next)'     , 'coc-diagnostic-next']
" " let g:next_key_map['s'] = 'next-mispell'

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
" }}}4
" }}}3
" Which key - backslash {{{3
nnoremap <silent> <Bslash> :<c-u>WhichKey  '\<Bslash\>'<CR>

" Register which key map
call which_key#register('\<Bslash\>', "g:back_key_map")

let g:back_key_map =  {
        \ 'name' : '+tex,latex,org,md'}

" org autocmds {{{4
" Org Date
autocmd FileType org,dotoo nmap \od i<<C-R>=strftime("%Y-%m-%d %a")<CR>>
autocmd FileType org,dotoo imap \od <<C-R>=strftime("%Y-%m-%d %a")<CR>>

" Org DateTime
autocmd FileType org,dotoo nmap \ot i<<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR>>
autocmd FileType org,dotoo imap \ot <<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR>>

" Org Schedule
autocmd FileType org,dotoo nmap \os iSCHEDULE: <<C-R>=strftime("%Y-%m-%d %a")<CR>><Esc>
autocmd FileType org,dotoo imap \os SCHEDULE: <<C-R>=strftime("%Y-%m-%d %a")<CR>>
autocmd FileType org,dotoo nmap \oD iDEADLINE: <<C-R>=strftime("%Y-%m-%d %a")<CR>><Esc>
autocmd FileType org,dotoo imap \oD DEADLINE: <<C-R>=strftime("%Y-%m-%d %a")<CR>>

let g:back_key_map.o = {
    \ 'name' : '+org',
    \ 'D' : ['call feedkeys("i"."\\oD")' , 'deadline'],
    \ 's' : ['call feedkeys("i"."\\os")' , 'schedule'],
    \ 'd' : ['call feedkeys("i"."\\od")' , 'date'],
    \ 't' : ['call feedkeys("i"."\\ot")' , 'datetime'],
    \}
" }}}4
" markdown autcmds {{{4
autocmd FileType markdown inoremap \m1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap \m2 ##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap \m3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap \m4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap \m5 #####<Space><CR><CR><++><Esc>2k<S-a>

autocmd FileType markdown inoremap \ms ```sh<CR><CR>```<CR><ESC>kki<Tab>

" Markdown Dates
autocmd FileType markdown nmap \md i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>
autocmd FileType markdown imap \md [<C-R>=strftime("%Y-%m-%d")<CR>]

" Markdown DateTime
autocmd FileType markdown nmap \mt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
autocmd FileType markdown imap \mt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

let g:back_key_map.m = {
    \ 'name' : '+markdown',
    \ 'd' : ['call feedkeys("i"."\\md")' , 'date'],
    \ 's' : ['call feedkeys("i"."\\ms")' , 'shell block'],
    \ 't' : ['call feedkeys("i"."\\mt")' , 'datetime'],
    \ '1' : ['call feedkeys("i"."\\m1")' , 'header 1'],
    \ '2' : ['call feedkeys("i"."\\m2")' , 'header 2'],
    \ '3' : ['call feedkeys("i"."\\m3")' , 'header 3'],
    \ '4' : ['call feedkeys("i"."\\m4")' , 'header 4'],
    \ '5' : ['call feedkeys("i"."\\m5")' , 'header 5'],
    \ }
let g:back_key_map.m.d = 'date'
let g:back_key_map.m.t = 'datetime'
" }}}4
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
" INSERT COMMANDS {{{1
" markdown {{{2
autocmd FileType markdown inoremap ,i ![](<++>){#fig:<++>}<Space><CR><CR><++><Esc>kkF]i
autocmd FileType markdown inoremap ,a [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,f +@fig:
" }}}2
" latex {{{2
autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
" }}}2
" }}}1

