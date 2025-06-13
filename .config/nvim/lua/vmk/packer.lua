return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'

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
		--tabnine
		--use { 'codota/tabnine-nvim', run = './dl_binaries.sh' }
		--undotree
		use  'mbbill/undotree'

	--navigation
		--telescope
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
		--oil.nvim
		use 'stevearc/oil.nvim'
		--vimwiki
		--use 'vimwiki/vimwiki'
		--use 'fcpg/vim-waikiki'
		use 'lervag/wiki.vim'

	--visual
		--colorscheme
		use { 'catppuccin/nvim', as = 'catppuccin' }
		--css colors
		use 'brenoprata10/nvim-highlight-colors'
		--icons
		use 'nvim-tree/nvim-web-devicons'
		--indent blankline
		use 'lukas-reineke/indent-blankline.nvim'
end)
