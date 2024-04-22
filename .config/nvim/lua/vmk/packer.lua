return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

	--libraries
		use 'nvim-lua/plenary.nvim'

	--programming
		--treesitter
		use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
		--lsp
		use {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		}
		--snippets
		use {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets'
		}
		--indent blankline
		use 'lukas-reineke/indent-blankline.nvim'
		--tabnine
		use { 'codota/tabnine-nvim', run = './dl_binaries.sh' }

	--navigation
		--telescope
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.6',
		}
		--oil.nvim
		use 'stevearc/oil.nvim'

	--visual
		--colorscheme
		use { 'catppuccin/nvim', as = 'catppuccin' }
		--css colors
		use 'brenoprata10/nvim-highlight-colors'
		--icons
		use 'nvim-tree/nvim-web-devicons'
end)
