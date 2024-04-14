--this probably shouldn't be here
vim.g.mapleader = " "
--numbering
vim.opt.nu = true
vim.opt.relativenumber = true
--searching with /
vim.opt.hlsearch = false
vim.opt.incsearch = true
--use system clipboard
vim.opt.clipboard = "unnamedplus,unnamed"
--this
vim.opt.completeopt = "menuone,noinsert,noselect"
--some basics
vim.opt.title = true
vim.opt.bg = "dark"
vim.opt.laststatus = 1
vim.opt.shortmess:append("I")
--indentation & tabs
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
--splits
vim.opt.splitbelow = true
vim.opt.splitright = true
