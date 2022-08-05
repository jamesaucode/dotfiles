" Always enter terminal mode when we call term
" And hide line numbers while we are in term mode
if has('nvim')
    autocmd TermOpen term://* 
					\ :set nonumber |
					\ :set norelativenumber |
					\ startinsert 
endif
if has('nvim')
	autocmd TermClose term://* 
				\ :set number |
				\ :set relativenumber
endif

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

augroup c_cpp_files
	autocmd!
	autocmd! FileType c :setlocal tabstop=8 softtabstop=8 shiftwidth=8
	autocmd! FileType cpp :setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup javascript_files
	autocmd!
	autocmd! FileType javascript :setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd! FileType javascriptreact :setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd! FileType typescript :setlocal tabstop=2 softtabstop=2 shiftwidth=2
	autocmd! FileType typescriptreact :setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
