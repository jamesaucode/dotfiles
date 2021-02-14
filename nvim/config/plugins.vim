" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_smart_case = 1
" let g:completion_matching_ignore_case = 1
let g:completion_trigger_on_delete = 1
let g:completion_enable_auto_popup = 1
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }
" let g:go_auto_type_info = 1

" Colorscheme stuff
colorscheme apprentice
set termguicolors
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

" Make fzf window float with 90vw + 60vh
let g:fzf_layout = { 'window': { 'width' : 0.9, 'height': 0.6 } }
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
" Enable react style commenting
augroup react
	autocmd! FileType typescriptreact setlocal commentstring={/*\ %s\ */}
	autocmd! FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
augroup END
" Hacky way to close fzf window in nvim
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx,*.jsx'

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

let g:fern#renderer = "nerdfont"
