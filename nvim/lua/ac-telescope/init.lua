local M = {}

M.search_dir = function(x)
  require('telescope.builtin').find_files({
		-- shorten_path = true,
    prompt_title = x,
		cwd = os.getenv(x),
	})
end
-- M.search_dotfiles = function()
-- 	require('telescope.builtin').find_files({
-- 		-- shorten_path = true,
--     prompt_title = 'ZEN_DOTFILES_DIR',
-- 		cwd = os.getenv('ZEN_DOTFILES_DIR'),
-- 	})
-- end
-- 

M.search_dotfiles = function()
  return M.search_dir('ZEN_DOTFILES_DIR')
end

return M
