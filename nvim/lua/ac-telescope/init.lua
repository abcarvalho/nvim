local config = {}
local actions = require('telescope.actions')


config.search_dir = function(x)
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
function config.telescope()
  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      prompt_position = 'top',
      selection_caret = " ",
      sorting_strategy = 'ascending',
      results_width = 0.75,
      file_previewer = actions.vim_buffer_cat.new,
      grep_previewer = actions.vim_buffer_vimgrep.new,
      qflist_previewer = actions.vim_buffer_qflist.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
  }
  require('telescope').load_extension('fzy_native')
  require'telescope'.load_extension('dotfiles')
end

-- require M({ attach_mappings = function(_, map)
--   map('n', '<leader>fd', search_dir('ZEN_DOTFILES_DIR'))
--   return true
-- end})
-- 
return config

