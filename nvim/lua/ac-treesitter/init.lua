require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "bibtex", "julia", "latex", "lua", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ignore_install = {},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
}
