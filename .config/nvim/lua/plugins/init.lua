return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {'windwp/nvim-ts-autotag'} 
  use {'windwp/nvim-autopairs'}
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'lewis6991/impatient.nvim'
  use 'onsails/lspkind.nvim'
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'numToStr/Comment.nvim'
  use ({"kylechui/nvim-surround", tag = "*"})
  use 'nvim-treesitter/nvim-treesitter-textobjects'
end)

