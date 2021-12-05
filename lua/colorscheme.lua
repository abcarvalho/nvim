local g = vim.g

g.tokyonight_style="storm"
g.tokyonight_transparent = true
g.tokyonight_sidebars = {'packer'}
g.tokyonight_dark_float = false

vim.cmd[[colorscheme tokyonight]]


require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

