local execute = vim.api.nvim_command
local fn = vim.fn

-- Automatically Install Packager
-- notice that packer will be installed as a start plugin
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
-- Install Plugins
return require('packer').startup(
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Git (change)
    use 'tpope/vim-fugitive'

    -- Language: Markdown (change)
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'

    -- Snippets (change)
    use 'honza/vim-snippets'

    -- which key
    use 'folke/which-key.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Code Editing
    use 'ggandor/lightspeed.nvim'

    -- Git
    use {'lewis6991/gitsigns.nvim',
         requires = {
          'nvim-lua/plenary.nvim'
        }
      }

    -- Julia
    use 'JuliaEditorSupport/julia-vim'

    -- Markdown
    use {'dhruvasagar/vim-table-mode', opt=true,
          ft={'md', 'markdown', 'pandoc'}}

    -- LaTeX:
    use 'lervag/vimtex'

    -- Note Taking & Task Management:
    use {"dkarter/bullets.vim", opt=true,
         ft={'md', 'markdown', 'pandoc', 'txt'}}
    use 'lervag/wiki.vim'

    -- Fuzzy Finder
    use {'nvim-telescope/telescope.nvim',
         requires = {{'nvim-lua/popup.nvim'},
                     {'nvim-lua/plenary.nvim'},
                     {'nvim-telescope/telescope-fzy-native.nvim',opt = true}}
        }

    -- Folding
    use {"arecarn/vim-fold-cycle", opt=true,
         ft={'md', 'markdown', 'pandoc', 'txt', 'vim', 'lua'}}

    -- Autocompletion
    use 'windwp/nvim-autopairs'

    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- ColorScheme
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/moonlight.nvim'

    -- BufferLine
    use "romgrk/barbar.nvim"

    -- LuaLine
    use 'hoob3rt/lualine.nvim'

    -- Writing experience:
    use 'folke/zen-mode.nvim'

    -- Commenting
    use "terrortylor/nvim-comment"

    -- Text Alignment
    use {'junegunn/vim-easy-align', opt=true}

    require_plugin('arecarn/vim-fold-cycle')
  end)

