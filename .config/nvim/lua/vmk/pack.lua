vim.pack.add({
	-- lsp
	{
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
		version = 'master',
	},
	'https://github.com/williamboman/mason.nvim',
	'https://github.com/williamboman/mason-lspconfig.nvim',
	'https://github.com/neovim/nvim-lspconfig',

	-- snippets
	{
		src = 'https://github.com/Saghen/blink.cmp',
		version = vim.version.range('1.x')
	},
	--'https://github.com/mikavilpas/blink-ripgrep.nvim',
	'https://github.com/L3MON4D3/LuaSnip',
	'https://github.com/rafamadriz/friendly-snippets',


	-- navigation
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/lervag/wiki.vim',

	-- visual
	{
		src = 'https://github.com/catppuccin/nvim',
		name = 'catppuccin',
	},
	'https://github.com/brenoprata10/nvim-highlight-colors',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/lukas-reineke/indent-blankline.nvim',

	-- other
	{
		src = 'https://github.com/chomosuke/typst-preview.nvim',
		version = vim.version.range('1.x'),
	},
	'https://github.com/mbbill/undotree',
})
