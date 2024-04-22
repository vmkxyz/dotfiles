require("catppuccin").setup {
	color_overrides = {
		mocha = {
			base = "#09090f",
			mantle = "#000000",
			crust = "#000000",
		},
	},
}

vim.cmd.colorscheme "catppuccin-mocha"

--nvim-highlight colors
require('nvim-highlight-colors').setup {
	enable_named_colors = true,
}
