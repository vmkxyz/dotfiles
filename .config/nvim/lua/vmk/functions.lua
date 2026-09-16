vim.cmd[[
	augroup TrimWhitespace
		autocmd!
		autocmd BufWritePre * let b:currPos = getpos('.')
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

-- remove plugins from disk that are no longer in vim.pack.add() specs
vim.api.nvim_create_user_command("PackClean", function()
	local inactive = vim.iter(vim.pack.get())
		:filter(function(x)
			return not x.active
		end)
		:map(function(x)
			return x.spec.name
		end)
		:totable()
	if #inactive == 0 then
		vim.notify("No inactive plugins to remove", vim.log.levels.INFO)
		return
	end
	vim.pack.del(inactive)
	vim.notify("Removed: " .. table.concat(inactive, ", "), vim.log.levels.INFO)
end, { desc = "Remove plugins not in vim.pack.add() specs" })

-- restore cursor to file position in previous editing session
--vim.api.nvim_create_autocmd("BufReadPost", {
--	callback = function(args)
--		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
--		local line_count = vim.api.nvim_buf_line_count(args.buf)
--		if mark[1] > 0 and mark[1] <= line_count then
--			vim.api.nvim_win_set_cursor(0, mark)
--			-- defer centering slightly so it's applied after render
--			vim.schedule(function()
--				vim.cmd("normal! zz")
--			end)
--		end
--	end,
--})

-- highlight trailing spaces
--vim.api.nvim_set_hl(0, 'TrailingWhitespace', { bg='#45475a' })
--vim.api.nvim_create_autocmd('BufEnter', { pattern = '*', command = [[ syntax clear TrailingWhitespace | syntax match TrailingWhitespace "\_s\+$" ]] })
