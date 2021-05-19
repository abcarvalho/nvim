-- vim:fdm=marker
local kmap = vim.api.nvim_set_keymap

-- <leader> {{{1
-- b is for buffers {{{2
vim.cmd([[
  nnoremap <leader>bb :lua require('telescope.builtin').buffers()<CR>
]])
-- }}}2
-- f is for files {{{2
kmap('n', '<leader>fb', 
     ':Telescope file_browser<CR>', 
     {noremap = true})

kmap('n', '<leader>fd', 
     ':lua require("ac-telescope").search_dir("ZEN_DOTFILES_DIR")<CR>', 
     {noremap = true})

kmap('n', '<leader>fr', 
     ':lua require("ac-telescope").search_dir("ZEN_REPOS_DIR")<CR>', 
     {noremap = true})

kmap('n', '<leader>fv', 
     ':lua require("ac-telescope").search_dir("ZEN_WIKI_DIR")<CR>', 
     {noremap = true})

kmap('n', '<leader>fw', 
     ':lua require("ac-telescope").search_dir("ZEN_WORK_DIR")<CR>', 
     {noremap = true})
-- }}}2
-- s is for search {{{2
kmap('n', '<leader>s/', 
     ':Telescope search_history<CR>', 
     {noremap = true})

kmap('n', '<leader>sb', 
     ':Telescope current_buffer_fuzzy_find<CR>', 
     {noremap = true})

kmap('n', '<leader>s;', 
     ':Telescope commands<CR>', 
     {noremap = true})

kmap('n', '<leader>sf', 
     ':Telescope find_files<CR>', 
     {noremap = true})

kmap('n', '<leader>sh', 
     ':Telescope oldfiles<CR>', 
     {noremap = true})

kmap('n', '<leader>sH', 
     ':Telescope command_history<CR>', 
     {noremap = true})

kmap('n', '<leader>sM', 
     ':Telescope keymaps<CR>', 
     {noremap = true})

kmap('n', '<leader>sp', 
     ':Telescope live_grep<CR>', 
     {noremap = true})

kmap('n', '<leader>sS', 
     ':Telescope colorscheme<CR>', 
     {noremap = true})

kmap('n', '<leader>st', 
     ':Telescope current_buffer_tags<CR>', 
     {noremap = true})
-- }}}2
-- }}}1
