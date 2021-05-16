local execute = vim.api.nvim_command
local fn = vim.fn

-- Automatically Install Packager
-- notice that packer will be installed as a start plugin
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
-- Install Plugins
return require('packer').startup(
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Languages:
    use {'dhruvasagar/vim-dotoo', opt=true}        -- Org
    use 'lervag/vimtex'                            -- LaTeX

    -- Note Taking & Task Management:
    -- use 'lervag/wiki.vim'

    -- Fuzzy Finder
    use {'nvim-telescope/telescope.nvim',
         requires = {{'nvim-lua/popup.nvim'},
                     {'nvim-lua/plenary.nvim'}}
        }
 
    -- Folding
    use {"arecarn/vim-fold-cycle", opt=true}

    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt=true}

    -- ColorScheme
    use {'folke/tokyonight.nvim', opt=true}
    use {'ajmwagar/vim-deus', opt=true}
    use 'shaunsingh/moonlight.nvim'

    -- BufferLine
    use {"romgrk/barbar.nvim", opt = true}

    -- LuaLine
    use 'hoob3rt/lualine.nvim'

    -- Writing experience: LaTeX
    use {'junegunn/goyo.vim', opt=true}

    -- Commenting
    use {"terrortylor/nvim-comment", opt = true}

    require_plugin("vim-dotoo")
    require_plugin("vim-fold-cycle")
    require_plugin("nvim-web-devicons")
    require_plugin("barbar.nvim")
    require_plugin("nvim-comment")
    require_plugin("telescope")
  end)
