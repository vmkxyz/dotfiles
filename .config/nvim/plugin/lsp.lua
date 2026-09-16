require('mason').setup()
require('mason-lspconfig').setup({})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { buffer = ev.buf })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf })
		vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = ev.buf })

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf })
		vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = ev.buf })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf })

	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
