-- vim:fdm=marker
local o, bo, wo = vim.o, vim.bo, vim.wo
local g = vim.g

-- vimscript commands {{{1
vim.cmd([[
  set debug=msg
  filetype plugin indent on
  syntax enable
  set spell

  set iskeyword+=-            " treat dash separated words as a word text object
  set formatoptions-=cro      " Stop newline continuation of comments
  set shortmess+=c            " Don't pass messages to |ins-completion-menu|.
  set nohlsearch              " disable highlight after search

  " Enable autocompletion:
  set wildmode=longest,list,full
  set completeopt=menu,menuone,noselect

  au! BufWritePost $MYVIMRC source %   " auto source when writing to init.vim
                                       " alternatively, run :source $MYVIMRC
]])
-- }}}1
-- Global Options {{{1
-- Some basics {{{2
o.autochdir = true        -- Automatically change the current directory
o.fileencoding = "utf-8"  -- The encoding written to file
o.mouse = "a"             -- Enable your mouse

-- Clipboard
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
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
-- bo.syntax = true         -- syntax higlighting

-- Indentation
opt.expandtab = true      -- Converts tabs to spaces
opt.smartindent = true
opt.shiftwidth = 2        -- Change the number of space characters inserted for
                          -- indentation
opt.softtabstop = 2
opt.tabstop = 2           -- Insert 2 spaces for a tab
wo.breakindent = true
-- }}}1
-- Window Options {{{1
wo.number = true           -- set numbered lines
wo.foldmethod = "syntax"
wo.foldenable = false
wo.relativenumber = true   -- set relative number
wo.cursorline = true       -- Enable highlighting of the current line
wo.conceallevel = 2        -- Concealed text is completely hidden unless
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
-- Autocommands {{{1
-- Disables automatic commenting on newline:
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- Ensure Transparency 
vim.cmd([[
  au ColorScheme * hi Normal ctermbg=none guibg=none
  au ColorScheme * hi NonText ctermbg=none guibg=none
]])

-- Highligth text on yank
vim.cmd([[
  augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END
]])
-- }}}1
