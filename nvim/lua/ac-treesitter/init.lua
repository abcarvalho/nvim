require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "bibtex", "julia", "latex", "lua", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ignore_install = {},
	highlight = {
                        enable = true,
                        language_tree = true
                    },
                    indent = {
                        enable = true
                    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
}
