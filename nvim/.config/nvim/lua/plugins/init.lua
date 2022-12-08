-- Plugins installed with packer
_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'hrsh7th/cmp-buffer' -- Autocompletion plugin
	use 'hrsh7th/cmp-path' -- Autocompletion plugin
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/nvim-treesitter-refactor'
	use 'nvim-treesitter/playground'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/plenary.nvim'}}
	}
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'
	-- colorschemes
	use {'dracula/vim', as = 'dracula'}
	use 'rafamadriz/neon'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'marko-cerovac/material.nvim'
	use 'folke/tokyonight.nvim'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jbyuki/venn.nvim"
end)
