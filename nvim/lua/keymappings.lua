-- vim:fdm=marker
local kmap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- leader and local leader keys {{{1
-- make sure SPC is not mapped to anything
vim.cmd([[
nnoremap <SPACE> <Nop>
]])
vim.g.mapleader = " "
vim.g.maplocalleader = ";"
-- }}}1
-- Which Key {{{1
-- <leader> {{{2
-- f is for files {{{3
kmap('n', '<leader>fb',
     ':Telescope file_browser<CR>',
     {noremap = true})

kmap('n', '<leader>fd',
     ':lua require("ac-telescope").search_dir("AB_DLZ_DOTFILES")<CR>',
     {noremap = true})

     {noremap = true})

kmap('n', '<leader>fr',
     ':lua require("ac-telescope").search_dir("AB_DIZ_REPOS")<CR>',
     {noremap = true})

     {noremap = true})

-- kmap('i', '<leader>fs',
     -- '<C-O>:w<cr>', {noremap = true})
-- }}}3
-- m is for markdown {{{3
vim.cmd([[
autocmd FileType markdown,pandoc nmap <leader>m1 i#<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m2 i##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m3 i###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m4 i####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown,pandoc nmap <leader>m5 i#####<Space><CR><CR><++><Esc>2k<S-a>

autocmd FileType markdown,pandoc nmap <leader>ms i```sh<CR><CR>```<CR><ESC>kki<Tab>

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

kmap('n', '<leader>rd',
     ':lua require("ac-telescope").rgrep_dir("AB_DLZ_DOTFILES")<CR>',
     {noremap = true})

kmap('n', '<leader>rr',
     ':lua require("ac-telescope").rgrep_dir("AB_DIZ_REPOS")<CR>',
     {noremap = true})

kmap('n', '<leader>rv',
     ':lua require("ac-telescope").rgrep_dir("AB_DLZ_WIKI")<CR>',
     {noremap = true})

kmap('n', '<leader>rw',
     ':lua require("ac-telescope").rgrep_dir("AB_DLZ_WORK")<CR>',
     {noremap = true})
-- }}}3
-- S is for sessions {{{3
vim.cmd([[
nnoremap <leader>Ss :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>Sl :source .quicksave.vim<CR>:echo "Session loaded."<CR>
]])
-- }}}3
-- }}}2
-- comma-l {{{2
-- latex autocmds {{{3
vim.cmd([[
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
-- Autocompletion {{{1
-- kmap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- kmap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- kmap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- kmap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- }}}1
-- Other Mappings {{{1
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
kmap('n', '<M-k>',
     [[:let save_a=@a<cr><Up>"add"ap<Up>:let @a=save_a<cr>]],
     opts)
kmap('n', '<M-j>',
     [[:let save_a=@a<cr>"add"ap:let @a=save_a<cr>]],
     opts)
-- }}}2
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
