vim.g.tokyonight_transparent = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange"} --, error = "#ff0000" }

-- Load the colorscheme
-- vim.g.moonlight_italic_comments = true
-- vim.g.moonlight_disable_background = true
-- require('moonlight').set()
-- 
-- require('lualine').setup {
--   options = {
--     -- ... your lualine config
--     -- theme = 'tokyonight'
--     theme = 'moonlight'
--     -- ... your lualine config
--   }
-- }

vim.cmd[[colorscheme tokyonight]]
 
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}
