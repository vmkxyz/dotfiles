vim.keymap.set("n", "<leader>fv", vim.cmd.Oil)
vim.keymap.set("n", "<leader>o", "<cmd>setlocal spell! spelllang=en,cs,de<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>TabnineToggle<CR>")
vim.keymap.set("n", "<leader>td", "<cmd>normal! i" .. os.date("%Y/%m/%d %X") .. "<CR>")
