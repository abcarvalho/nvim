-- vim: set fdm=marker :
-- set paths {{{1
vim.cmd([[
  let $DOTFILESDIR=$AB_DLZ_DOTFILES
  let $LUADIR=$DOTFILESDIR ."/nvim/lua"
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
require('colorscheme')
require('keymappings')

-- plugins {{{1
require('ab-filetype')
require('ab-telescope')

vim.cmd([[source $LUADIR/ab-funs.vim]])
vim.cmd([[source $LUADIR/ab-ipy/init.vim]])
vim.cmd([[source $LUADIR/ab-netrw/init.vim]])
vim.cmd([[source $LUADIR/ab-pandoc/init.vim]])
vim.cmd([[source $LUADIR/ab-julia/init.vim]])
vim.cmd([[source $LUADIR/ab-vimtex/init.vim]])

require('ab-gitsigns')
require('ab-autopairs')
require('ab-bullets')
require('ab-comment')
require('ab-blankline')
require('ab-wiki')
require('ab-zen')
require('ab-lightspeed')

require('ab-which-key')

require('ab-lsp')
require('ab-treesitter')

-- autocompletion
require('ab-cmp')
-- }}}1
