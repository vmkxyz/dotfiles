vim.cmd[[
	augroup TrimWhitespace
		autocmd!
		autocmd BufWritePre * if &filetype != 'markdown' | let b:currPos = getpos(".") | %s/\s\+$//e | %s/\n\+\%$//e | call setpos('.', b:currPos) | endif
		autocmd BufWritePre *.[ch] %s/\%$/\r/e
		autocmd BufWritePre *neomutt* %s/^--$/-- /e
	augroup END
]]

vim.cmd('command! Q q')
vim.cmd('command! W w')
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')
