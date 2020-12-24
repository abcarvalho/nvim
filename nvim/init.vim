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
" }}}1
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
" }}}2
" Save {{{2
" Quick save file 
" nnoremap zz :update<CR>
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
" }}}2
" Quit {{{2
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
" nnoremap <Leader>q :q<cr>
" nnoremap <Leader>Q :qa!<cr>
" }}}2
" Buffers {{{2
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" List Buffers
nmap <leader>bb :Buffers<CR>
" }}}2
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
" }}}2
" TABS v.s. WORKSPACES  {{{2
" }}}2
" Shortcut for Toggling Folding {{{2
nnoremap <SPACE> za
" nnoremap <TAB> za
" }}}2
" INDENTATION {{{2
" Better tabbing 
vnoremap < <gv
vnoremap > >gv
" }}}2
" Reordering lines  {{{2
" :nnoremap <M-k> <Up>"add"ap<p>
" :nnoremap <M-j> "add"ap
:nnoremap <silent><C-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><C-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
" }}}2
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
" }}}2
" List default and user-defined commands  {{{2
nmap <Leader>C :Commands<CR>
" }}}2
" Alias replace all to R {{{2
nnoremap R :%s//gc<Left><Left><Left>
" }}}2
" Sessions {{{2
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>
" }}}2
" Soft Wrap Mode {{{2
" ******* Remapping keys for Soft Wrap Mode *******
" Move normally between wrapped lines
:map j gj
:map k gk
:map 0 g0
:map $ g$
" }}}2
" ESCAPE Key  {{{2
" Use control-c instead of escape
" nnoremap <C-c> <Esc>

" " I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>
" }}}2
" Folders {{{2
" Remote Folders
map <F3> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-data/<CR>
map <F4> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/bond-model/<CR>
map <F5> :e scp://artur@acropolis.uchicago.edu:22//home/artur/BondPricing/Python/<CR>

" Switch Directory to Work Directory (SHELL)
nnoremap <leader>gw :cd $AMDG_WORK_DIR<CR>
" }}}2
" Netrw {{{2
nnoremap <leader><leader><CR> :Vex<CR>
" }}}2
" INSERT COMMANDS {{{2
" Dates {{{3
" Dates
nmap <localleader>id i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>
imap <localleader>id [<C-R>=strftime("%Y-%m-%d")<CR>]

" Datetime
nmap <leader>idt i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <leader>idt <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" }}}3
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
" }}}3
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
" }}}3
" my commands {{{3
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
" }}}3
" }}}2
" }}}1
" PLUGINS {{{1
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
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
   
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
    Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
    Plug 'tools-life/taskwiki'
   
   	" Files Folders: 
   	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   	Plug 'junegunn/fzf.vim'
   	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   
   	" Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Snippets:     
    Plug 'sirver/ultisnips' " snippets engine
    Plug 'honza/vim-snippets' " snippet files
   
    " Writing Experience: LaTeX
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    Plug 'junegunn/goyo.vim'

    " Markdown Preview:
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
   
   	" Appearance: Themes
    Plug 'mhartington/oceanic-next'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
    Plug 'lifepillar/vim-solarized8'
   	Plug 'dracula/vim',{ 'as': 'dracula' }
    Plug 'bluz71/vim-nightfly-guicolors'
  
    " Appearance: Airline
    Plug 'itchyny/lightline.vim'

    " Plug 'ctrlpvim/ctrlp.vim'

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
" fzf {{{3
nnoremap <leader>fp :call fzf#run({'options': '--reverse --prompt "AMDG PRIVATUS: "', 'down': 20, 'dir': '$AMDG_PRIVATUS_DIR', 'sink': 'e' })<CR>
nnoremap <leader>fw :call fzf#run({'options': '--reverse --prompt "AMDG WORK: "', 'down': 20, 'dir': '$AMDG_WORK_DIR', 'sink': 'e' })<CR>

" Include option to search for hidden files in the dotfiles directory:
nnoremap <leader>fc :call fzf#run({'source': 'find .', 'options': '--reverse --prompt "AMDG DOTFILES: "', 'down': 20, 'dir': '$AMDG_DOTFILES_DIR', 'sink': 'e' })<CR>
"}}}3
" File Explorer {{{3
" Netrw {{{4
" Open up netrw File Explorer
nnoremap <silent> <leader>fe :Lexplore<CR>

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
" }}}4
" }}}3
" Note Taking {{{3
" Bullets {{{4
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \]

" Disable the plugin for empty buffers
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}4
" WikiVim {{{4
let g:wiki_root=$AMDG_WIKI_DIR
let g:wiki_filetypes = ['md']
let g:wiki_mappings_use_default=0
let g:wiki_mappings_global = {
        \ '<plug>(wiki-index)' : '<leader>wv',
        \}
" }}}4
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
" Coc Autocompletion and Explorer{{{3
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
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
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" MY CHANGE: <leader><tab>
" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <leader><TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList: {{{4
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}4
" Coc-Explorer {{{4
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 30,
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 30,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
" nmap <space>ed :CocCommand explorer --preset .julia<CR>
nmap <space>ef :CocCommand explorer --preset floatingLeftSide<CR>

" List all presets
nmap <space>el :CocList explPresets
" }}}4
" My CONFIG {{{4
" enable/disable coc integration with airline:
let g:airline#extensions#coc#enabled = 1
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
" Easy-Align {{{4
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}4
" LaTeX - Vimtex {{{4
"LaTeX Setup
let g:vimtex_enabled=1
let g:tex_flavor='latex'
let g:vimtex_complete_recursive_bib=1
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
" set conceallevel=2     " defined in  init.vim already.
let g:tex_conceal='abdmg'
" }}}4
" }}}3
" Appearance: Themes & Airline/Lightline {{{3
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi NonText ctermbg=none guibg=none
if (has("termguicolors"))
    set termguicolors
endif

" Themes
" colorscheme dracula
" colorscheme OceanicNext
" colorscheme challenger_deep

" Dogrun
" colorscheme dogrun
" let g:lightline = {'colorscheme': 'dogrun'}

colorscheme nightfly
let g:lightline = {'colorscheme': 'nightfly' }

" Gruvbox
" autocmd vimenter * colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" let g:lightline = { 'colorscheme': 'gruvbox'}

" One 
" let g:one_allow_italics = 1 " I love italic for comments
" colorscheme one
" }}}3
" Writing {{{3
" noremap <leader>g :Goyo<CR>
" }}}3
" }}}2
" }}}1
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

" Fuzzy Search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" }}}2
" }}}1
" COMMENTING {{{1
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}1
" MY COMMANDS {{{1
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" Switch NVim and iTerm2 Themes {{{2
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
nnoremap <leader>st :SwapThemes<CR>
" }}}2
" }}}1
" Block-wise movements and block text-objects {{{1
" runtime macros/matchit.vim
" }}}1

" Transparency
" source $AMDG_CONFIG_DIR/nvim/plugins/themes.vim

" UltiSnippets {{{1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" set runtimepath+=$AMDG_DOTFILES_DIR/nvim/UltiSnips
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "tex.snippets"]
" }}}
" Plugins {{{2
    " Plug 'https://github.com/alok/notational-fzf-vim'
   	" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 
    " Plug 'junegunn/limelight.vim'
    " Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
    " Plug 'ctrlpvim/ctrlp.vim'

    "Appearance: Themes
    " Plug 'wadackel/vim-dogrun'
    " Plug 'drewtempelmeyer/palenight.vim'
    " Plug 'rakr/vim-one'  
    " Plug 'gruvbox-community/gruvbox'
" }}}2
" NERDTree {{{3
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
" }}}3
