Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'


" neoformat
	nnoremap <leader>F :Neoformat prettier<CR>

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>



" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
