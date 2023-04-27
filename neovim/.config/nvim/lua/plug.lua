-- Rudamentary logging, just use `vlog.nvim` and save yourself the trouble,
-- but its here if you want it
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- lsp realted plugins
    use 'neovim/nvim-lspconfig'		             -- nvim lsp implementaion plugin
    use 'nvim-lua/lsp-status.nvim'
    use 'williamboman/nvim-lsp-installer'      -- utility for installing lsp servers
    use 'hrsh7th/nvim-compe'		               -- autocompletion support
    use 'onsails/lspkind-nvim'		             -- lsp gui suggestions
    use 'nvim-treesitter/nvim-treesitter'      -- color improve
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'majutsushi/tagbar'

    -- utility plugins
    use 'lewis6991/gitsigns.nvim'
    use 'famiu/bufdelete.nvim'     -- buffer delete
    use {'junegunn/fzf',  run = ":fzf#install()" }
    use 'junegunn/fzf.vim'
    use 'ojroques/vim-oscyank'                -- copy to system clipboard
    use "lunarvim/darkplus.nvim"
    use 'tomasr/molokai'
    use 'ellisonleao/gruvbox.nvim'
    use 'sainnhe/everforest'
    use 'NLKNguyen/papercolor-theme'
    use 'nvim-lualine/lualine.nvim'                   -- Status line
    use 'akinsho/bufferline.nvim'                     -- Buffers
    use 'machakann/vim-highlightedyank'               -- Highlight yanked text
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "windwp/nvim-autopairs"
    use "terrortylor/nvim-comment"
    use 'natecraddock/workspaces.nvim'
    use 'lukoshkin/trailing-whitespace'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

