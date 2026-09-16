vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == 'nvim-treesitter' and kind == 'update' then
		if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
		vim.cmd('TSUpdate')
	end
end })

require('nvim-treesitter.configs').setup {
	auto_install = true,

	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	textobjects = {
		enable = true,
	},
}
