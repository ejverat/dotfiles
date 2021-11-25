-- Plugins installed with packer
_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {'dracula/vim', as = 'dracula'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/plenary.nvim'}}
	}
end)
