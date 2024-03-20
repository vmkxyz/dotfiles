" my config for vim / neovim, it can be used with both, I stole most of the lines from Luke Smith so credit to him
" https://github.com/LukeSmithxyz/voidrice/tree/master
"                    __
"      _  __ __ _   / /__
"     | |/ //  ' \ /  '_/
" by  |___//_/_/_//_/\_\
" @vmkxyz on gitlab and github

let mapleader = ","

if ! filereadable(system('echo -n "$HOME/.vim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $HOME/.vim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.vim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
elseif ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

if has ('nvim')
	if !isdirectory(expand('$HOME/.config/nvim/plugged'))
		call mkdir(expand('$HOME/.config/nvim/plugged'), 'p')
	endif
	let g:plugin_path = '$HOME/.config/nvim/plugged'
else
	if !isdirectory(expand('$HOME/.vim/plugged'))
		call mkdir(expand('$HOME/.vim/plugged'), 'p')
	endif
	let g:plugin_path = '$HOME/.vim/plugged'
endif

call plug#begin(g:plugin_path)
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme catppuccin-mocha

set completeopt=menuone,noinsert,noselect

set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus,unnamed
set laststatus=1
set noshowcmd

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
"set expandtab

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" vim-airline
	if !exists('g:airline_symbols')
  	    let g:airline_symbols = {}
	endif
	let g:airline_symbols.colnr = ' C:'
	let g:airline_symbols.linenr = ' L:'
	let g:airline_symbols.maxlinenr = '☰ '

" neoformat
	nnoremap <leader>F :Neoformat prettier<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <leader>v :VimwikiIndex<CR>
if has ('nvim')
	if !isdirectory(expand('$HOME/.local/share/nvim/vimwiki'))
		call mkdir(expand('$HOME/.local/share/nvim/vimwiki'), 'p')
	endif
	let g:vimwiki_path = '$HOME/.local/share/nvim/vimwiki'
else
	if !isdirectory(expand('$HOME/.vim/vimwiki'))
		call mkdir(expand('$HOME/.vim/vimwiki'), 'p')
	endif
	let g:vimwiki_path = '$HOME/.vim/vimwiki'
endif
let g:vimwiki_list = [{'path': g:vimwiki_path, 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
  autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

map ,, :keepp /<++><CR>ca<
imap ,, <esc>:keepp /<++><CR>ca<

" Make `:W` work as `:w`, `:Wq` as `:wq` etc, usefull when you type a command  too quickly
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Q! ((getcmdtype() is# ':' && getcmdline() is# 'Q!')?('q!'):('Q!'))
