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
" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <Leader>ot <Esc>:call TermToggle(10)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

augroup c_cpp_files
	autocmd!
	autocmd! FileType c,cpp :setlocal tabstop=8 softtabstop=8 shiftwidth=8
augroup END
