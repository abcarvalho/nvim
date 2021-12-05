local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    language_tree = true,
  },
  ensure_installed = {"julia", "lua", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                      -- Or run :TSUpdate org
  indent = {
    enable = true
  },
-- indent = {enable = true, disable = {"python", "html", "javascript"}},
}

