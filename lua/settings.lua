-- vim:fdm=marker
local o, g, cmd = vim.o, vim.g, vim.cmd

-- vimscript commands {{{1
cmd([[
  set debug=msg
  filetype plugin indent on
  syntax enable

  " set iskeyword+=-          " treat dash separated words as a word text object
  set formatoptions-=cro      " Stop newline continuation of comments
  set shortmess+=c            " Don't pass messages to |ins-completion-menu|.
  set nohlsearch              " disable highlight after search
]])
-- }}}1
-- o.syntax = true        -- syntax highlighting

-- Global Options {{{1
-- Some basics {{{2
o.spell = true
o.autochdir = true        -- Automatically change the current directory
o.fileencoding = "utf-8"  -- The encoding written to file
o.mouse = "a"             -- Enable your mouse

-- Clipboard
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- }}}2
-- autocompletion {{{2
o.wildmode = "longest:full,full"         -- Command-line completion mode

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'
-- }}}2
-- appearance {{{2
o.showmode = false      -- We don't need to see things like -- INSERT -- anymore
o.pumheight = 10        -- Makes popup menu smaller
o.cmdheight = 2         -- More space for displaying messages
-- }}}2
-- colors {{{2
-- o.t_Co = "256"          -- Support 256 colors
o.termguicolors = true  -- set term gui colors most terminals support this
-- }}}2
-- files {{{2
o.backup = false          -- This is recommended by coc
o.writebackup = false     -- This is recommended by coc
-- }}}2
-- folds {{{2
o.foldlevelstart=1
-- }}}2
-- text editing {{{2
o.backspace = "2"   -- make backspace work like in most other programs
                    -- equivalent to set backspace=indent,eol,start
-- }}}2
-- text width {{{2
o.wrap = false          -- Display long lines as just one line
o.textwidth = 80        -- set textwidth
-- }}}2
-- timings {{{2
o.updatetime = 100        -- Faster completion
o.timeoutlen = 300        -- By default timeoutlen is 1000 ms
-- }}}2
-- window splitting and buffers {{{2
o.hidden = true         -- Required to keep multiple buffers open multiple buffers
o.splitbelow = true     -- Horizontal splits will automatically be below
o.splitright = true     -- Vertical splits will automatically be to the right
-- }}}2
-- tabs {{{2
o.showtabline = 2       -- Always show tabs
-- }}}2
-- }}}1
-- Buffer Options {{{1
-- Indentation
o.expandtab = true        -- Converts tabs to spaces
o.smartindent = true
o.shiftwidth = 2          -- Change the number of space characters inserted for
                          -- indentation
o.softtabstop = 2
o.tabstop = 2             -- Insert 2 spaces for a tab
o.breakindent = true
-- }}}1
-- Window Options {{{1
o.number = true           -- set numbered lines
o.foldmethod = "syntax"
o.foldenable = false
o.relativenumber = true   -- set relative number
o.cursorline = true       -- Enable highlighting of the current line
o.conceallevel = 2        -- Concealed text is completely hidden unless
-- }}}1
-- OS options {{{1
-- The operating system is assigned to a global variable that
-- that can be used elsewhere for conditional system based logic
if require('utils').is_darwin() then
  g.open_command = "open"
  g.system_name = "macOS"
  g.is_mac = true

  -- install pynvim: conda install pynvim
  -- check health:  :checkhealth
  g.python3_host_prog = '/usr/local/Caskroom/miniconda/base/bin/python'
elseif require('utils').is_linux() then
    g.open_command = "xdg-open"
    g.system_name = "Linux"
    g.is_linux = true
end
-- }}}1
-- netrw {{{1
-- Open up netrw File Explorer
-- Remove directory banner. Access it by pressing: I
g.netrw_banner = 0

-- Window Size
g.netrw_winsize = 20

-- Hit enter in the file browser to open the selected
-- file with :vsplit to the right of browser
g.netrw_browse_split = 2
g.netrow_altv = 1

-- Default to tree mode
g.netrw_liststyle = 3
-- }}}1
-- Autocommands {{{1
-- auto source when writing to init.vim
-- alternatively, run :source $MYVIMRC
cmd([[
  au! BufWritePost $MYVIMRC source %  
]])

-- Disables automatic commenting on newline:
cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- Ensure Transparency
cmd([[
  au ColorScheme * hi Normal ctermbg=none guibg=none
  au ColorScheme * hi NonText ctermbg=none guibg=none
]])

-- Highligth text on yank
cmd([[
  augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END
]])

-- netrw: open file, but keep focus in Explorer
cmd([[autocmd filetype netrw nmap <c-a> <cr>:wincmd W<cr>]])
-- }}}1
