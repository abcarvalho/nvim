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

" leader and local leader keys {{{2
" make sure SPC is not mapped to anything
nnoremap <SPACE> <Nop>
let g:mapleader = " "                  " set leader key
let maplocalleader = ';'
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
    " Which Key
    Plug 'liuchengxu/vim-which-key'

    " Commands:
    " Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'

    " Git:
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'

    " Language: Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'dhruvasagar/vim-table-mode'

    " Languages: Julia
    Plug 'JuliaEditorSupport/julia-vim'
   
   	" Code Editing:
    Plug 'unblevable/quick-scope'
    Plug 'justinmk/vim-sneak'
    Plug 'junegunn/vim-easy-align'
   
    " Note Taking Task Management:
    Plug 'lervag/wiki.vim'
  
    " Files and Folders:
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
  
    " Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Snippets:     
    Plug 'honza/vim-snippets' " snippet files
 
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
" }}}1
lua require('plugins')
" lua require('ac-wiki')

" Configure Plugins {{{1
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
" My CONFIG {{{3
" autocmd FileType markdown,org,dotoo let b:coc_suggest_disable = 1

" enable/disable coc integration with airline:
" let g:airline#extensions#coc#enabled = 1
" }}}3
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
" Appearance: Themes & Airline/Lightline {{{2
" Ensure transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none

if (has("termguicolors"))
    set termguicolors
endif
" }}}2
" }}}1
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
let g:space_key_map['z'] = [ 'Goyo'      , 'zen' ]
" }}}3
" a is for acropolis {{{3
let g:space_key_map.a = {
      \ 'name' : '+acropolis-server' ,
      \ 'd' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/', 'bond-data'], 
      \ 'm' : [':e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/', 'bond-model'], 
      \}
" }}}3
" b is for buffers {{{3
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>

let g:space_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : [':bd'     , 'delete'],
      \ 'n' : [':bnext', 'next-buffer'],
      \ 'p' : [':bprevious', 'previous-buffer'],
      \}

let g:space_key_map.b.b = 'list-buffers'

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
" }}}3
" d is for directory {{{3
let g:space_key_map.d = {
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

nnoremap <leader>fd :lua require('ac-telescope').search_dir('ZEN_DOTFILES_DIR')<CR>
nnoremap <leader>fo :lua require('ac-telescope').search_dir('ZEN_ORG_DIR')<CR>
nnoremap <leader>fr :lua require('ac-telescope').search_dir('ZEN_REPOS_DIR')<CR>
nnoremap <leader>fv :lua require('ac-telescope').search_dir('ZEN_WIKI_DIR')<CR>
nnoremap <leader>fw :lua require('ac-telescope').search_dir('ZEN_WORK_DIR')<CR>

let g:space_key_map.f = { 
     \ 'name' : '+file', 
     \ 'n' : [':Lexplore', 'netrw'],
     \ 't' : [':edit ${ZEN_REPOS_DIR}/dissertation/paper/abcarvalho_paper.tex', 'thesis'],
     \}

let g:space_key_map.f.s = 'save-file'
let g:space_key_map.f.d = 'ZEN DOTFILES'
let g:space_key_map.f.o = 'ZEN ORG'
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
autocmd FileType markdown,pandoc nmap <leader>md i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>

" Markdown DateTime
autocmd FileType markdown,pandoc nmap <leader>mt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

let g:space_key_map.m = {
      \ 'name' : '+md-table-mode',
      \ 'e' : ['TableEvalFormulaLine', 'eval formula line'],
    \}

let g:space_key_map.m.s = 'shell block'
let g:space_key_map.m.d = 'date'
let g:space_key_map.m.t = 'datetime'
let g:space_key_map.m.1 = 'header 1'
let g:space_key_map.m.2 = 'header 2'
let g:space_key_map.m.3 = 'header 3'
let g:space_key_map.m.4 = 'header 4'
let g:space_key_map.m.5 = 'header 5'


" }}}3
" o is for org {{{3
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
nnoremap <leader>sb :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

let g:space_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text-Ag'],
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

let g:space_key_map.s.b = 'current-buffer' 
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
        \ 'name' : '+tex,latex,org,md'}

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
onoremap <TAB> <C-C>za
" }}}2
" replace all {{{2
nnoremap R :%s//gc<Left><Left><Left>
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
lua require('ac-comment')
lua require('ac-telescope')

set wrap linebreak nolist               " Soft wrap

