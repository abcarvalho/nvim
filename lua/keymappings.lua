-- vim:fdm=marker
local g, cmd = vim.g, vim.cmd
local kmap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- leader and local leader keys {{{1
-- make sure SPC is not mapped to anything
cmd([[
  nnoremap <SPACE> <Nop>
]])
g.mapleader = " "
g.maplocalleader = ";"
-- }}}1
-- Which Key {{{1
-- <leader> {{{2
-- f is for files {{{3
kmap('n', '<leader>fb',
     ':Telescope file_browser<CR>',
     {noremap = true})

kmap('n', '<leader>fc',
     ':lua require("ab-telescope").search_dir("CONFIGDIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fr',
     ':lua require("ab-telescope").search_dir("REPOSDIR")<CR>',
     {noremap = true})

-- kmap('i', '<leader>fs',
     -- '<C-O>:w<cr>', {noremap = true})
-- }}}3
-- m is for markdown {{{3
  autocmd FileType markdown,pandoc nmap <leader>m1 i#<Space><CR><CR><++><Esc>2k<S-a>
  autocmd FileType markdown,pandoc nmap <leader>m2 i##<Space><CR><CR><++><Esc>2k<S-a>
  autocmd FileType markdown,pandoc nmap <leader>m3 i###<Space><CR><CR><++><Esc>2k<S-a>
  autocmd FileType markdown,pandoc nmap <leader>m4 i####<Space><CR><CR><++><Esc>2k<S-a>
  autocmd FileType markdown,pandoc nmap <leader>m5 i#####<Space><CR><CR><++><Esc>2k<S-a>

  autocmd FileType markdown,pandoc nmap <leader>ms i```sh<CR><CR>```<CR><ESC>kki<Tab>
cmd([[

  " Markdown Dates
  autocmd FileType markdown,pandoc nmap <leader>mid i[<C-R>=strftime("%Y-%m-%d")<CR>]<Esc>

  " Markdown DateTime
  autocmd FileType markdown,pandoc nmap <leader>mit i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
]])

-- Adjust section depth of the visual selection
kmap('v', '<leader>mD', [[:s/^#/##/g <cr>]],
     {noremap = true})

kmap('v', '<leader>md', [[:s/^##/#/g <cr>]],
     {noremap = true})

-- }}}3
-- r is for rgrep {{{3
kmap('n', '<leader>rg',
     ':Telescope live_grep<CR>',
     {noremap = true})

kmap('n', '<leader>rc',
     ':lua require("ab-telescope").rgrep_dir("CONFIGDIR")<CR>',
     {noremap = true})

kmap('n', '<leader>rr',
     ':lua require("ab-telescope").rgrep_dir("REPOSDIR")<CR>',
     {noremap = true})
-- }}}3
-- y is for yanking {{{3 
-- format and yank paragraph
cmd([[
  command ExpandTextWidth let oldtw=&textwidth | set textwidth=10000
  command RestoreTextWidth let &textwidth=oldtw | set textwidth?

  function! YankFormattedPars(...)
    let pnum = get(a:, 1, 1)

    silent ExpandTextWidth
    silent execute "norm! v" . pnum . "apgqgvy"
|   silent RestoreTextWidth
    silent execute "norm! u"
  endfunction 
]])
-- format and yank whole file
kmap('n', '<leader>yf',
     [[:ExpandTextWidth <cr>  | ggVGgqgvy  |
       :RestoreTextWidth <cr> | u]],
     {noremap = true})
-- TRASH:
-- command -nargs=1 YankFormatPar call YankFormattedPars(<args>)
-- command -nargs=1 YankFormatPar :ExpandTextWidth | normal! v<args>apgqgvy | :RestoreTextWidth | u
-- kmap('n', '<leader>yp', [[:call YankFormattedPars(1) <cr>]],
--      {noremap = true})
-- -- format and yank visual selection
-- kmap('v', '<leader>yv',
--      [[:<C-U>ExpandTextWidth <cr> | gvgqy |
--        :<C-U>RestoreTextWidth <cr> | u]],
--      {noremap = true})
-- }}}3
-- }}}2
-- comma-l {{{2
-- latex autocmds {{{3
cmd([[
  " emphasize
  autocmd FileType tex,latex inoremap \le ~\emph{}<Esc>i 
  " citation
  autocmd FileType tex,latex inoremap \lc ~\cite{}<Esc>a
  " reference
  autocmd FileType tex,latex inoremap \lr ~\ref{}<Esc>a
]])
-- math {{{4
vim.cmd([[
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
]])
-- }}}4
-- sections {{{4
vim.cmd([[
autocmd FileType tex,latex inoremap \ls1 \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ls2 \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ls3 \subsubsection{}<CR><CR><++><Esc>?}<CR>i
]])
-- }}}4
-- documents {{{4
vim.cmd([[
autocmd FileType tex,latex inoremap \lda \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ldt \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap \ldm \maketitle<CR><CR>
]])
-- }}}4
-- textcolor {{{4
vim.cmd([[
" textcolor
autocmd FileType tex,latex inoremap \lic ~\textcolor{}{<++>}<Esc>?{<CR>n:noh<CR>a

" insert comment
autocmd FileType tex,latex inoremap \lim \begin{comment}<CR><CR>\end{comment}<Esc>ki

" symbol
autocmd FileType tex,latex inoremap \lis {\LaTeX}<Space>
]])
-- }}}4
-- text size {{{4
vim.cmd([[
" autocmd FileType tex,latex inoremap \ltb \bfseries
autocmd FileType tex,latex inoremap \ltt \tiny
autocmd FileType tex,latex inoremap \ltp \scriptsize
autocmd FileType tex,latex inoremap \ltf \footnotesize
autocmd FileType tex,latex inoremap \lts \small
autocmd FileType tex,latex inoremap \ltl \large
autocmd FileType tex,latex inoremap \lth \huge
]])
-- }}}4
-- }}}3
-- }}}2
-- }}}1
-- Other Mappings {{{1
-- navigation {{{2 
-- Move normally between wrapped lines
kmap('n', 'j', 'gj', opts)
kmap('n', 'k', 'gk', opts)
kmap('n', '0', 'g0', opts)
kmap('n', '$', 'g$', opts)
-- }}}2
-- better window movement {{{2
kmap('n', '<C-h>', '<C-w>h', {silent = true})
kmap('n', '<C-j>', '<C-w>j', {silent = true})
kmap('n', '<C-k>', '<C-w>k', {silent = true})
kmap('n', '<C-l>', '<C-w>l', {silent = true})
-- }}}2
-- Forwards and Backwards {{{2
-- Buffers
kmap('n', ']b', ':bnext<cr>', opts)
kmap('n', '[b', ':bprev<cr>', opts)

-- Tabs
kmap('n', ']<tab>', ':tabn<cr>', opts)
kmap('n', '[<tab>', ':tabp<cr>', opts)

-- Windows
kmap('n', ']w', '<c-w>w', opts)
kmap('n', '[w', '<c-w>W', opts)
-- }}}2
-- indenting text {{{2
-- better indenting
kmap('v', '<', '<gv', opts)
kmap('v', '>', '>gv', opts)
-- }}}2
-- replace all {{{2
kmap('n', 'R', [[:%s//gc<Left><Left><Left>]], {noremap=true})
-- }}}2
-- Reordering Lines {{{2
kmap('n', '<C-k>',
     [[:let save_a=@a<cr><Up>"add"ap<Up>:let @a=save_a<cr>]],
     opts)
kmap('n', '<C-j>',
     [[:let save_a=@a<cr>"add"ap:let @a=save_a<cr>]],
     opts)
-- }}}2
-- moving text (visual mode) {{{2 
kmap('v',  'J', ":m '>+1<CR>gv=gv", {noremap = true})
kmap('v',  'K', ":m '<-2<CR>gv=gv", {noremap = true})
-- }}}2
-- toggle folding {{{2
kmap('n', '<tab>', 'za', opts)
-- }}}2
-- yanking {{{2
-- yank the rest of the line (ignore white space at the end)
kmap('n', 'Y', 'yg_', {noremap = true})
-- }}}2
-- cursor {{{2
-- keeping it centered
kmap('n', 'n', 'nzzzv', {noremap = true})
kmap('n', 'N', 'Nzzzv', {noremap = true})
kmap('n', 'J', 'mzJ`z', {noremap = true})
-- }}}2
-- undoing {{{2
-- break points for undoing
kmap('i',  ',', ',<c-g>u', {noremap = true})
kmap('i',  '.', '.<c-g>u', {noremap = true})
kmap('i',  '!', '!<c-g>u', {noremap = true})
kmap('i',  '?', '?<c-g>u', {noremap = true})
kmap('i',  '[', '[<c-g>u', {noremap = true})
kmap('i',  '(', '(<c-g>u', {noremap = true})
-- }}}2
-- clear highlighting on escape in normal mode {{{2
kmap('n', '<esc>', ':noh<return><esc>', {noremap = true})
-- }}}2
-- }}}1
