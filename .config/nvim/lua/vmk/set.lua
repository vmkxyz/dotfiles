-- basics
vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus,unnamed'			-- system clipboard
--vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- basics 2 (idk what to call these)
vim.opt.title = true
vim.opt.bg = 'dark'
vim.opt.laststatus = 1			-- dfault vim status line
vim.opt.shortmess:append('I')
vim.opt.termguicolors = true
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.scrolloff = 8
--vim.opt.colorcolumn = '80'
--vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#11111b' })

--numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- searching
vim.opt.incsearch = true		-- search chars as entered
vim.opt.hlsearch = false		-- (don't) highlight matches
vim.opt.ignorecase = true
vim.opt.smartcase = true		-- case sensitive if an uppercase is enetered

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

--splits
vim.opt.splitbelow = true
vim.opt.splitright = true
