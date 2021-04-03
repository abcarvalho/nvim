" vim: set fdm=marker : 

" Settings {{{1
" Some basics: {{{2
" nnoremap c "_c
set nocompatible

filetype plugin on
syntax on 

" Automatically change the current directory
set autochdir

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

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
" }}}2
" python {{{2
" install pynvim: conda install pynvim
" check health:  :checkhealth
" let g:python3_host_prog = "/usr/local/Caskroom/miniconda/base/bin/python3"
let g:python3_host_prog = "/usr/local/Caskroom/miniconda/base/bin/python"
" }}}2
" TAB completion {{{2
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}2
" leader and local leader keys {{{2
" make sure SPC is not mapped to anything
nnoremap <SPACE> <Nop>
let g:mapleader = " "                  " set leader key
let maplocalleader = ';'
" }}}2
" Soft Wrap Mode {{{2
" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$
" }}}2
" SELL CHECKING {{{2
set spell
" }}}2
" TEXT WIDTH {{{2 
set tw=80                               " set textwidth
" }}}2
" LINE WRAPPING {{{2
set wrap linebreak nolist               " Soft wrap
set encoding=utf-8                      " The encoding displayed 

set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"

set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right

set conceallevel=2 
" }}}2
" INDENTATION {{{2 
"Indentation  without hard tabs
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
" }}}2
" LINE NUMBERS {{{2
" set number " Display Line Numbers
set number relativenumber

set cursorline                          " Enable highlighting of the current line

set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" }}}2
" FOLDING {{{2
" Enable folding
set foldmethod=syntax
" set foldlevel=1
set foldlevelstart=1
" }}}2
" AUTOCOMPLETION {{{2
" Enable autocompletion:
set wildmode=longest,list,full

" ****** Key Behavior *****
set backspace=2 " make backspace work like most other programs

" }}}2
" COMMENTING {{{2
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}2
" }}}1
" Plugins {{{1
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
    "File Manager
    Plug 'ptzz/lf.vim'
    Plug 'voldikss/vim-floaterm'

    " Which Key
    Plug 'liuchengxu/vim-which-key'

    " Commands:
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'

    " Git:
    Plug 'jreybert/vimagit'
    Plug 'mhinz/vim-signify'

    " Language: Org
    Plug 'dhruvasagar/vim-dotoo' 

    " Language: Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'dhruvasagar/vim-table-mode'

    " Languages: Julia
    Plug 'JuliaEditorSupport/julia-vim'
   
    " Language: Python
   	" Plug 'python-mode/python-mode', { 'branch': 'develop' }
   
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
    Plug 'https://github.com/alok/notational-fzf-vim'
  
   	" Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Snippets:     
    Plug 'honza/vim-snippets' " snippet files
   
    " Writing Experience: LaTeX
    Plug 'junegunn/goyo.vim'

    " Appearance: Themes
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'ajmwagar/vim-deus'

    " Lightline 
    Plug 'itchyny/lightline.vim'
  
    " Initialize plugin system
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
" Configure Plugins {{{2
" lf file manager {{{3
let g:lf_map_keys = 0

let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
" }}}3
" Org Mode {{{3
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
" }}}3
" VimMagit {{{3
let g:magit_default_fold_level = 0
"}}}3
" Netrw {{{3
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
" }}}3
" Note Taking {{{3
" Bullets {{{4
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'org',
    \ 'dotoo',
    \]

" Disable the plugin for empty buffers
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}4
" WikiVim {{{4
let g:wiki_root=$ZEN_WIKI_DIR
let g:wiki_filetypes = ['md']
let g:wiki_mappings_use_default=0
" }}}4
" }}}3
" Coc Autocompletion and Explorer{{{3
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
" }}}4
" Coc-Snippets {{{4
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
" }}}4
" My CONFIG {{{4
" autocmd FileType markdown,org,dotoo let b:coc_suggest_disable = 1

" enable/disable coc integration with airline:
" let g:airline#extensions#coc#enabled = 1
" }}}4
" }}}3
" Languages {{{3
" Markdown {{{4
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
" }}}4
" Julia {{{4
" Enabling and disabling the LaTeX-to-Unicode functionality
" noremap <expr> <leader>lu LaTeXtoUnicode#Toggle()
" noremap! <expr> <leader>lu LaTeXtoUnicode#Toggle()
let g:latex_to_unicode_tab = 0
" }}}
" LaTeX - Vimtex {{{4
"LaTeX Setup
let g:vimtex_enabled=1
let g:vimtex_complete_recursive_bib=1
let g:tex_flavor='latex'
let g:vimtex_compiler_progname='nvr'  " required in neovim 
let g:vimtex_view_method='zathura'
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
" }}}4
" }}}3
" Appearance: Themes & Airline/Lightline {{{3
" Ensure transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none

if (has("termguicolors"))
    set termguicolors
endif

 " colorscheme nightfly
colorscheme deus
" let g:lightline = {'colorscheme': 'nightfly' }
let g:lightline = {'colorscheme': 'deus' }
" }}}3
" }}}2
" }}}1
" Mappings {{{1
" Which Key {{{2
" pre config {{{3
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" }}}3
" Single mappings {{{3
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
" List default and user-defined commands
let g:which_key_map['C'] = [ ':Commands', 'list commands' ]
let g:which_key_map['Q'] = [ ':q'                       , 'quit' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]
" }}}3
" a is for acropolis {{{3
let g:which_key_map.a = {
      \ 'name' : '+acropolis-server' ,
      \ 'd' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/', 'bond-data'], 
      \ 'm' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/', 'bond-model'], 
      \}
" }}}3
" b is for buffers {{{3
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bd'     , 'delete'],
      \ 'b' : [':Buffers', 'list buffers'],
      \}
" }}}3
" c for CoC {{{3
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

let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \}

let g:which_key_map.c.a = 'codeaction-selected'
let g:which_key_map.c.b = 'codeaction buffer'
let g:which_key_map.c.c = 'commands'
let g:which_key_map.c.d = 'diagnostics'
let g:which_key_map.c.e = 'extensions'
let g:which_key_map.c.f = 'format-selected'
let g:which_key_map.c.j = 'next'
let g:which_key_map.c.k = 'prev'
let g:which_key_map.c.o = 'outline'
let g:which_key_map.c.p = 'list resume'
let g:which_key_map.c.r = 'rename symbol'
let g:which_key_map.c.s = 'list symbols'
let g:which_key_map.c.v = 'convert-snippet'
let g:which_key_map.c.x = 'fix-current'
" }}}3
" d is for directory {{{3
let g:which_key_map.d = {
      \ 'name' : '+directory' ,
      \ 'r' : [':cd $ZEN_REPOS_DIR'     , 'repos'],
      \ 'k' : [':cd $ZEN_WORK_DIR'     , 'work'],
      \ 'v' : [':cd $ZEN_WIKI_DIR'     , 'wiki'],
      \ 'o' : [':cd $ZEN_ORG_DIR'     , 'org'],
      \}
" }}}3
" f is for file {{{3
" nnoremap <silent> <leader>fs :update<CR>
inoremap <leader>fs  <C-O>:w<cr>
noremap <leader>fs  :w<cr>
command! ZenPrivatus call fzf#run({'options': '--reverse --prompt "ZEN PRIVATUS: "', 'down': 20, 'dir': '$ZEN_PRIVATUS_DIR', 'sink': 'e' })<CR>
command! ZenOrg call fzf#run({'options': '--reverse --prompt "ZEN ORG: "', 'down': 20, 'dir': '$ZEN_ORG_DIR', 'sink': 'e' })
command! ZenRepos call fzf#run({'options': '--reverse --prompt "ZEN REPOS: "', 'down': 20, 'dir': '$ZEN_REPOS_DIR', 'sink': 'e' })<CR>
command! ZenWork call fzf#run({'options': '--reverse --prompt "ZEN WORK: "', 'down': 20, 'dir': '$ZEN_WORK_DIR', 'sink': 'e' })<CR>
command! ZenWiki call fzf#run({'options': '--reverse --prompt "ZEN WIKI: "', 'down': 20, 'dir': '$ZEN_WIKI_DIR', 'sink': 'e' })<CR>
" Include option to search for hidden files in the dotfiles directory:
command! ZenDotFiles call fzf#run({'source': 'find .', 'options': '--reverse --prompt "ZEN DOTFILES: "', 'down': 20, 'dir': '$ZEN_DOTFILES_DIR', 'sink': 'e' })<CR>

" Notational FZF 
let g:nv_search_paths = ['$ZEN_WIKI_DIR']

let g:which_key_map.f = { 
     \ 'name' : '+file', 
     \ 'p' : [':ZenPrivatus', 'ZEN PRIVATUS'], 
     \ 'o' : [':ZenOrg', 'ZEN ORG'], 
     \ 'r' : [':ZenRepos', 'ZEN REPOS'], 
     \ 'k' : [':ZenWork', 'ZEN WORK'], 
     \ 'v' : [':ZenWiki', 'ZEN WIKI'], 
     \ 'c' : [':ZenDotFiles', 'ZEN DOTFILES'],
     \ 'z' : [':NV', 'NV DOTFILES'],
     \ 'n' : [':Lexplore', 'netrw'],
     \ 'l' : [':Lf', 'lf'],
     \}
let g:which_key_map.f.s = 'save-file'
" }}}3
" md tables {{{3
let g:table_mode_map_prefix = '<Leader>m'
let g:which_key_map.m = {
      \ 'name' : '+md-table-mode',
      \ 'e' : ['TableEvalFormulaLine', 'eval formula line']
    \}
" }}}3
" r is for RGrep {{{3
command! -bang -nargs=* RGrepWiki
            \ call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 
            \1, fzf#vim#with_preview({ 'dir': '$ZEN_WIKI_DIR'}), <bang>0)

let g:which_key_map.r = { 
     \ 'name' : '+rgrep', 
     \ 'r' : [':Rg', 'rgrep'], 
     \ 'v' : [':RGrepWiki', 'rgrep wiki'],
    \}
" }}}3
" s is for search {{{3
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'fzf files'],
      \ 'g' : [':GFiles'       , 'fzf git files'],
      \ 'G' : [':GFiles?'      , 'fzf modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'fzf lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Rg'     ,     'project'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':BTags'        , 'fzf buffer tags'],
      \ 'T' : [':Tags'        , 'fzf tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }
" }}}3
" S is for sessions {{{3
nnoremap <leader>Ss :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>Sl :source .quicksave.vim<CR>:echo "Session loaded."<CR>

let g:which_key_map.S = {
      \ 'name' : '+session' ,
      \} 
let g:which_key_map.S.s = 'save'
let g:which_key_map.S.l = 'load'
" }}}3
" <tab> is for tabs {{{3
let g:which_key_map['<Tab>'] = {
      \ 'name' : '+tab' ,
      \ '1' : [':1gt', 'tab 1'],
      \ '2' : [':2gt', 'tab 2'],
      \ '3' : [':3gt', 'tab 3'],
      \ '4' : [':4gt', 'tab 4'],
      \ '5' : [':5gt', 'tab 5'],
      \ '6' : [':6gt', 'tab 6'],
      \ '7' : [':7gt', 'tab 7'],
      \ '8' : [':8gt', 'tab 8'],
      \ '9' : [':9gt', 'tab 9'],
      \ '0' : [':tablast', 'last'],
      \ 'n' : [':tabnew', 'new'],
      \ 'd' : [':tabclose', 'delete'],
      \}
" }}}3
" w is for wiki {{{3
let g:wiki_mappings_global = {
        \ '<plug>(wiki-index)' : '<leader>wv',
        \ '<plug>(wiki-link-next)' : '<leader>wj',  
        \ '<plug>(wiki-link-prev)' : '<leader>wk', 
        \}
let g:which_key_map.w = {
      \ 'name' : '+wikivim',
      \}
let g:which_key_map.w.v = 'wiki-index'
let g:which_key_map.w.j = 'wiki-link-next'
let g:which_key_map.w.k = 'wiki-link-prev'
" }}}3
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
" }}}2
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
" Reordering lines  {{{2
" :nnoremap <M-k> <Up>"add"ap<p>
" :nnoremap <M-j> "add"ap
:nnoremap <silent><M-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><M-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
" }}}2
" toggle folding {{{2
nnoremap <TAB> za
" }}}2
" replace all {{{2
nnoremap R :%s//gc<Left><Left><Left>
" }}}2
" windows {{{2
" Better window navigation
" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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
" time {{{2
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
" }}}2
" quit {{{2
inoremap <C-Q>     <esc>:q<cr>
" }}}2
" }}}1
" INSERT COMMANDS {{{1
" Dates {{{2
" Markdown Dates
autocmd FileType markdown nmap <localleader>id i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>
autocmd FileType markdown imap <localleader>id [<C-R>=strftime("%Y-%m-%d")<CR>]

" Markdown DateTime
autocmd FileType markdown nmap <localleader>idt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
autocmd FileType markdown imap <localleader>idt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Org Date
autocmd FileType org,dotoo nmap <localleader>id i:date:
autocmd FileType org,dotoo imap <localleader>id :date:

" Org DateTime
autocmd FileType org,dotoo nmap <localleader>idt i:time:
autocmd FileType org,dotoo imap <localleader>idt :time:
" }}}2
" Org {{{2
autocmd FileType org,dotoo nmap <localleader>dt i:date:
autocmd FileType org,dotoo imap <localleader>dt :date:
" }}}2
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

autocmd FileType markdown inoremap ,sh ```sh<CR><CR>```<CR><ESC>kki<Tab>
" }}}2
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
" }}}2
" my commands {{{2
" insert braces
autocmd FileType tex,latex,vimwiki inoremap ,i( \left(\right)<Esc>?(<CR>:noh<CR>a  

" insert brackets
autocmd FileType tex,latex,vimwiki inoremap ,i[ \left[\right]<Esc>?[<CR>:noh<CR>a

" insert curly brackets
autocmd FileType tex,latex,vimwiki inoremap ,i{ \{\}<Esc>hi

" inline math
autocmd FileType tex,latex inoremap ,im ~\(\)<ESC>hi

" outline math
autocmd FileType tex,latex,vimwiki inoremap ,om \[<CR><space><CR><BS>\]<Esc>kA

" begin equation
autocmd FileType tex,latex,vimwiki inoremap ,be \begin{equation}<CR><Space><Space>=<Space><CR>\end{equation}<Esc>khhi

" begin align
autocmd FileType tex,latex,vimwiki inoremap ,ba \begin{align}<CR><Space><Space>&=<Space><CR>\end{align}<Esc>khhhi

" emphasize
autocmd FileType tex,latex inoremap ,em ~\emph{}<Esc>i 

" reference
autocmd FileType tex,latex inoremap ,ir ~\ref{}<Esc>i 

" textcolor
autocmd FileType tex,latex inoremap ,tc ~\textcolor{}{<++>}<Esc>?{<CR>n:noh<CR>a

" insert comment
autocmd FileType tex,latex inoremap ,bc \begin{comment}<CR><CR>\end{comment}<Esc>ki
" }}}2
" }}}1
