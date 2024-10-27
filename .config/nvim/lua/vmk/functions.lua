vim.cmd[[
	augroup TrimWhitespace
		autocmd!
		autocmd BufWritePre * if &filetype != 'markdown' | let b:currPos = getpos(".") | %s/\s\+$//e | %s/\n\+\%$//e | call setpos('.', b:currPos) | endif
		autocmd BufWritePre *.[ch] %s/\%$/\r/e
		autocmd BufWritePre *neomutt* %s/^--$/-- /e
	augroup END
]]

vim.cmd [[command! -nargs=0 -bar W :w]]
vim.cmd [[command! -nargs=0 -bar Wq :wq]]
vim.cmd [[command! -nargs=0 -bar Q :q]]
