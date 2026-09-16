require('blink.cmp').setup({
	snippets = { preset = 'luasnip' },
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'default',
		['<C-j>'] = { 'select_next', 'fallback' },
		['<C-k>'] = { 'select_prev', 'fallback' },
		['<C-l>'] = { 'accept', 'fallback' },
	},
	appearance = { nerd_font_variant = 'mono' },
	completion = { documentation = { auto_show = true } },
	signature = { enabled = true },
	-- lua, prefer_rust, prefer_rust_with_warning
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = { implementation = 'prefer_rust_with_warning' },
})
