return require('packer').startup(function(use)
  -- packer self management
  use 'wbthomason/packer.nvim'

  -- lsp realted plugins
  use 'neovim/nvim-lspconfig'		             -- nvim lsp implementaion plugin
  use 'williamboman/nvim-lsp-installer'      -- utility for installing lsp servers
  use 'hrsh7th/nvim-compe'		               -- autocompletion support
  use 'onsails/lspkind-nvim'		             -- lsp gui suggestions
  use 'nvim-treesitter/nvim-treesitter'      -- color improve
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
    -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- utility plugins
  use 'lewis6991/gitsigns.nvim'
  use 'famiu/bufdelete.nvim'     -- buffer delete
  use {'junegunn/fzf',  run = ":fzf#install()" }
  use 'junegunn/fzf.vim'
  use 'ojroques/vim-oscyank'                -- copy to system clipboard
  use "lunarvim/darkplus.nvim"
  use 'tomasr/molokai'
  use 'ellisonleao/gruvbox.nvim'

  use 'kyazdani42/nvim-web-devicons'                -- Devicons
  use 'nvim-lualine/lualine.nvim'                   -- Status line
  use 'akinsho/bufferline.nvim'                     -- Buffers
  use 'machakann/vim-highlightedyank'               -- Highlight yanked text
  use 'kyazdani42/nvim-tree.lua'                    -- File explorer
  use({ "nvim-telescope/telescope.nvim", commit = "d88094fbfd84b297178252230f6faf0e7d2f7650" })
  use "nvim-lua/plenary.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "windwp/nvim-autopairs"
  use "terrortylor/nvim-comment"
end)
