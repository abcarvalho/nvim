-- vim: set fdm=marker :
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

    -- lsp
    use {'neovim/nvim-lspconfig',
         'williamboman/nvim-lsp-installer'}

    -- Snippets (change)
    -- Plug 'hrsh7th/cmp-cmdline'
    use {"hrsh7th/nvim-cmp", requires= {
                              {'onsails/lspkind-nvim'},
                              {'hrsh7th/cmp-vsnip'},
                              {'neovim/nvim-lspconfig'},
                              {'hrsh7th/cmp-nvim-lsp'},
    }}
    --completion
 	  use {'tzachar/cmp-tabnine', run='./install.sh',
         requires = 'hrsh7th/nvim-cmp'}
    use "hrsh7th/vim-vsnip"

-- essentials {{{2
    -- which key
    use 'folke/which-key.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use {'lewis6991/gitsigns.nvim',
         requires = {
          'nvim-lua/plenary.nvim'
        }
      }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Fuzzy Finder
    use {'nvim-telescope/telescope.nvim',
         requires = {{'nvim-lua/popup.nvim'},
                     {'nvim-lua/plenary.nvim'},
                     {'nvim-telescope/telescope-fzy-native.nvim',opt = true}}
        }
-- }}}2
-- code editing {{{2
    -- moving around
    use 'ggandor/lightspeed.nvim'

    -- Autocompletion
    use {'windwp/nvim-autopairs'}

    -- Commenting
    use "terrortylor/nvim-comment"

    -- Text Alignment
    use {'junegunn/vim-easy-align', opt=true}
-- }}}2
-- languages {{{2
    -- Language: Julia
    use 'JuliaEditorSupport/julia-vim'

    -- Language: Markdown
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    use {'dhruvasagar/vim-table-mode', opt=true,
          ft={'md', 'markdown', 'pandoc'}}

    -- Language: LaTeX
    use 'lervag/vimtex'
-- }}}2
-- UI {{{2
    -- BufferLine
    use "romgrk/barbar.nvim"

    -- LuaLine
    use 'hoob3rt/lualine.nvim'

    -- text alignment
    use {"lukas-reineke/indent-blankline.nvim"}

    -- Writing experience:
    use 'folke/zen-mode.nvim'
-- }}}2
-- appearance {{{2
    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- ColorScheme
    use 'folke/tokyonight.nvim'
-- }}}2

    -- Note Taking & Task Management:
    use {"dkarter/bullets.vim", opt=true,
         ft={'md', 'markdown', 'pandoc', 'txt'}}
    use 'lervag/wiki.vim'

    -- Jupyter & QtConsole
    use 'jupyter-vim/jupyter-vim'
    use 'untitled-ai/jupyter_ascending.vim'
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
end)
