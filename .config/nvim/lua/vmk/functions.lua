vim.cmd[[
    augroup TrimWhitespace
        autocmd!
        autocmd BufWritePre * let b:currPos = getpos(".")
        autocmd BufWritePre * %s/\s\+$//e
        autocmd BufWritePre * %s/\n\+\%$//e
        autocmd BufWritePre *.[ch] %s/\%$/\r/e
        autocmd BufWritePre *neomutt* %s/^--$/-- /e
        autocmd BufWritePre * call setpos('.', b:currPos)
    augroup END
]]

vim.cmd [[command! -nargs=0 -bar W :w]]
vim.cmd [[command! -nargs=0 -bar Wq :wq]]
vim.cmd [[command! -nargs=0 -bar Q :q]]
