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

    use("nathom/filetype.nvim")

    -- Snippets (change)
    -- Plug 'hrsh7th/cmp-cmdline'
    use {"hrsh7th/nvim-cmp", requires= {
                              {'onsails/lspkind-nvim'},
                              {'hrsh7th/cmp-vsnip'},
                              {'neovim/nvim-lspconfig'},
                              {'hrsh7th/cmp-nvim-lsp'},
                              -- {'hrsh7th/cmp-buffer'},
                              -- {'hrsh7th/cmp-path'}}
    }} --completion
 	  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use "hrsh7th/vim-vsnip"
    -- use 'rafamadriz/friendly-snippets'

    -- which key
    use 'folke/which-key.nvim'

    -- lsp
    -- use 'kabouzeid/nvim-lspinstall'
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
      }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Code Editing
    use 'ggandor/lightspeed.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use {'lewis6991/gitsigns.nvim',
         requires = {
          'nvim-lua/plenary.nvim'
        }
      }

    -- Language: Julia
    use 'JuliaEditorSupport/julia-vim'

    -- Language: Markdown
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use {'dhruvasagar/vim-table-mode', opt=true,
          ft={'md', 'markdown', 'pandoc'}}

    -- Language: LaTeX
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

    -- Autocompletion
    use {'windwp/nvim-autopairs'}

    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- ColorScheme
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/moonlight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'marko-cerovac/material.nvim'

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
    use {"lukas-reineke/indent-blankline.nvim"}

    -- Jupyter & QtConsole
    use 'jupyter-vim/jupyter-vim'
    use 'untitled-ai/jupyter_ascending.vim'
end)