vim.g.wiki_root = os.getenv('AB_DLZ_WIKI')
vim.g.wiki_filetypes = {'md'}
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_link_extension = '.md'

vim.g.wiki_mappings_use_default = 0
vim.g.wiki_global_load = 0
vim.g.wiki_link_toggle_on_follow = 0
-- vim.g.wiki_mappings_use_defaults='global'
-- let g:wiki_mappings_global = {
--         \ '<plug>(wiki-link-follow)' : '<TAB>',
--         \}
vim.cmd [[let g:wiki_mappings_local = {'<plug>(wiki-link-follow)' : '<M-cr>', '<plug>(wiki-link-return)' : '<M-bs>',}]]
