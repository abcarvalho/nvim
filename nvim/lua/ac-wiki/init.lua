vim.g.wiki_root = os.getenv('$ZEN_WIKI_DIR')
vim.g.wiki_filetypes = 'md'
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_link_extension = '.md'

vim.g.wiki_mappings_use_default= 0
vim.g.wiki_global_load= 0
vim.g.wiki_link_toggle_on_follow= 0
-- let g:wiki_mappings_global = {
--         \ '<plug>(wiki-link-follow)' : '<TAB>',
--         \}
