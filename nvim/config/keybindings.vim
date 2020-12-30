nmap <silent> gd <Plug>(coc-definition)
nnoremap  <Leader>n: bn<CR>
nnoremap  <Leader>p: bp<CR>
nnoremap  <Leader>d: bd<CR>
" VSCode like lsp rename
nmap <F2> <Plug>(coc-rename)
" Fuzzy find keybindings
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>R :Rg<CR>
nmap <Leader>o :Fern . -drawer<CR>
" Toggle Dirvish
map <C-n> :Dirvish<CR>
inoremap jk <Esc>
" Tab completion like VSCode
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.  Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nnoremap <silent> K : call <SID>show_documentation()<CR>
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

function s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

