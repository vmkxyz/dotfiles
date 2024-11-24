vim.cmd[[
	augroup TrimWhitespace
		autocmd!
		autocmd BufWritePre * let b:currPos = getpos(".")
		autocmd BufWritePre * if &filetype != 'markdown' | %s/\s\+$//e | endif
		autocmd BufWritePre * %s/\n\+\%$//e
		autocmd BufWritePre *.[ch] %s/\%$/\r/e
		autocmd BufWritePre *neomutt* %s/^--$/-- /e
		autocmd BufWritePre * call setpos('.', b:currPos)
	augroup END
]]

vim.cmd('command! Q q')
vim.cmd('command! W w')
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')
