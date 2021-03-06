-- vim: set fdm=marker :
-- set paths {{{1
vim.cmd([[
  let $CONFIGDIR=$AB_DLZ_CONFIG
  let $LUADIR=$AB_DLZ_CONFIG ."/nvim/lua"
]])

if require('utils').is_home_computer() then
  vim.cmd([[
    let $SESSIONSDIR=$AB_DIP_ZEN ."/tmp"
    let $REPOSDIR=$AB_DIZ_REPOS
  ]])
end
-- }}}1

require('plugins')
require('settings')

-- plugins {{{1
require('ab-filetype')

-- essentials {{{2
require('ab-telescope')

-- autocompletion
require('ab-cmp')

require('ab-lsp')
require('ab-treesitter')
require('ab-gitsigns')
-- }}}2
-- code editing {{{2
require('ab-hop')
require('ab-autopairs')
require('ab-comment')
-- }}}2
-- languages {{{2
require('ab-julia')
vim.cmd([[source $LUADIR/ab-pandoc/init.vim]])
require('ab-vimtex')
-- }}}2
-- UI {{{2
require('ab-blankline')
require('ab-zen')
-- }}}2
-- note taking {{{2
require('ab-bullets')
require('ab-wiki')
-- }}}2

-- Jupyter & QtConsole
require('ab-ipy')
require('ab-magma-nvim')

-- appearance {{{2
require('colorscheme')
-- }}}2

require('keymappings')
require('ab-which-key')

if require('utils').is_home_computer() then
  require('ab-private')
end
-- }}}1

-- missing:
-- essentials: vim-fugitive
-- UI: barbar, lualine
-- appearance: nvim-web-icons
