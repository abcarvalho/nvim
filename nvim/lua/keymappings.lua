-- vim:fdm=marker
local kmap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- local g = vim.g
-- g.maplocalleader = ';'

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

kmap('n', '<leader>fB',
     ':lua require("ac-telescope").search_dir("BOX_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fd',
     ':lua require("ac-telescope").search_dir("AB_DOTFILES_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fg',
     ':lua require("ac-telescope").search_dir("AB_GRAPHENE_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fm',
     ':lua require("ac-telescope").search_dir("AB_ML_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fo',
     ':lua require("ac-telescope").search_dir("AB_ORG_DIR")<CR>',
     {noremap = true})


kmap('n', '<leader>fr',
     ':lua require("ac-telescope").search_dir("AB_REPOS_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fv',
     ':lua require("ac-telescope").search_dir("AB_WIKI_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>fw',
     ':lua require("ac-telescope").search_dir("AB_WORK_DIR")<CR>',
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
-- }}}3
-- r is for rgrep {{{3
kmap('n', '<leader>rg',
     ':Telescope live_grep<CR>',
     {noremap = true})

kmap('n', '<leader>rd',
     ':lua require("ac-telescope").rgrep_dir("AB_DOTFILES_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>rr',
     ':lua require("ac-telescope").rgrep_dir("AB_REPOS_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>rv',
     ':lua require("ac-telescope").rgrep_dir("AB_WIKI_DIR")<CR>',
     {noremap = true})

kmap('n', '<leader>rw',
     ':lua require("ac-telescope").rgrep_dir("AB_WORK_DIR")<CR>',
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
kmap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
kmap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
kmap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
kmap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]])

-- kmap("i", "<C-Space>", "compe#complete()", {noremap = true, silent = true})
-- kmap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true})
-- kmap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true})
-- kmap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true})
-- kmap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true})
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

-- kmap('n', ']b', ':BufferNext<CR>', opts)
-- kmap('n', '[b', ':BufferPrevious<CR>', opts)
-- kmap('n', '<leader>bc', ':BufferPrevious<CR>', opts)

-- Tabs
-- kmap('n', ']<tab>', ':tabn<cr>', opts)
-- kmap('n', ']<tab>', ':tabp<cr>', opts)
vim.cmd([[
nnoremap ]<tab> :tabn<cr>
nnoremap [<tab> :tabp<cr>
]])

-- Windows
-- kmap('n', ']w', '<c-w>w', opts)
-- kmap('n', ']w', '<c-w>W', opts)
vim.cmd([[
nnoremap ]w <c-w>w
nnoremap [w <c-w>W
]])
-- }}}2
-- indenting text {{{2
-- better indenting
kmap('v', '<', '<gv', opts)
kmap('v', '>', '>gv', opts)
-- }}}2
-- replace all {{{2
-- kmap('n', 'R', [[:%s//gc<Left><Left><Left>]], opts)
vim.cmd([[
nnoremap R :%s//gc<Left><Left><Left>
]])
-- }}}2
-- Reordering Lines {{{2
-- kmap('n', '<M-k>',
--      [[let save_a=@a<cr><Up>"add"ap<Up>:let @a=save_a<cr>]],
--      opts)
-- kmap('n', '<M-j>',
--      [[:let save_a=@a<cr>"add"ap:let @a=save_a<cr>]],
--      opts)
vim.cmd([[
:nnoremap <silent><M-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>
:nnoremap <silent><M-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>
]])
-- }}}2
-- toggle folding {{{2
kmap('n', '<tab>', 'za', opts)
-- }}}2
-- }}}1
