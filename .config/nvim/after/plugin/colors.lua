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
