-- vim:fdm=marker
-- local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local g = vim.g

-- Global Options {{{1
-- Some basics {{{2
o.autochdir = true        -- Automatically change the current directory
o.fileencoding = "utf-8"  -- The encoding written to file
o.mouse = "a"             -- Enable your mouse

-- o.backspace = 2           -- make backspace work like most other programs

-- Clipboard
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- }}}2
-- Files {{{2
o.backup = false          -- This is recommended by coc
o.writebackup = false     -- This is recommended by coc
-- }}}2
-- Timings {{{2
o.updatetime = 100        -- Faster completion
o.timeoutlen = 300        -- By default timeoutlen is 1000 ms
-- }}}2
-- Appearance {{{2
-- Colors
-- o.t_Co = "256"          -- Support 256 colors
o.termguicolors = true  -- set term gui colors most terminals support this

o.showtabline = 2       -- Always show tabs

-- Fold
o.foldlevelstart=1

o.showmode = false      -- We don't need to see things like -- INSERT -- anymore
o.pumheight = 10        -- Makes popup menu smaller
o.cmdheight = 2         -- More space for displaying messages
-- }}}2
-- Text Width {{{2
o.wrap = false          -- Display long lines as just one line
o.textwidth = 80        -- set textwidth
-- }}}2
-- Window splitting and buffers {{{2
o.hidden = true           -- Required to keep multiple buffers open multiple buffers

o.splitbelow = true     -- Horizontal splits will automatically be below
o.splitright = true     -- Vertical splits will automatically be to the right
-- }}}2
-- }}}1
-- Buffer Options {{{1
-- bo.syntax = true         -- syntax higlighting

-- Indentation
opt.expandtab = true      -- Converts tabs to spaces
opt.smartindent = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
vim.wo.breakindent = true

-- vim.cmd('set ts=2') -- Insert 2 spaces for a tab
-- vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
-- bo.tabstop = 4           -- Insert 2 spaces for a tab
-- bo.softtabstop = 4
-- bo.shiftwidth = 4        -- Change the number of space characters inserted for indentation
-- }}}1
-- Window Options {{{1
wo.number = true           -- set numbered lines
wo.foldmethod = "syntax"
wo.relativenumber = true   -- set relative number
wo.cursorline = true       -- Enable highlighting of the current line
wo.conceallevel = 2        -- Concealed text is completely hidden unless
-- }}}1
-- OS options {{{1
-- The operating system is assigned to a global variable that
-- that can be used elsewhere for conditional system based logic
local uname = vim.loop.os_uname().sysname
if uname == "Darwin" then
    g.open_command = "open"
    g.system_name = "macOS"
    g.is_mac = true

    -- install pynvim: conda install pynvim
    -- check health:  :checkhealth
    g.python3_host_prog = '/usr/local/Caskroom/miniconda/base/bin/python'
elseif uname == "Linux" then
    g.open_command = "xdg-open"
    g.system_name = "Linux"
    g.is_linux = true
end
-- }}}1
-- Autocommands {{{1

-- }}}1

-- vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd [[set shortmess+=c]] -- Don't pass messages to |ins-completion-menu|.
-- vim.cmd('set inccommand=split') -- Make substitution work in realtime
-- o.title = true
-- TERMINAL = vim.fn.expand('$TERMINAL')
-- vim.cmd('let &titleold="'..TERMINAL..'"')
-- o.titlestring="%<%F%=%l/%L - nvim"
-- vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
-- vim.cmd('set colorcolumn=99999') -- fix indentline for now
-- wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift
-- the text each time
-- -- o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- -- o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- -- o.guifont = "SauceCodePro Nerd Font:h17"
-- o.guifont = "FiraCode Nerd Font:h17"
-- o.guifont = "JetBrains\\ Mono\\ Regular\\ Nerd\\ Font\\ Complete"
