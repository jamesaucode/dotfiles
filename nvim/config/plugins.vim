" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
lua << EOF
require'lspconfig'.tsserver.setup{}
local saga = require 'lspsaga'
saga.init_lsp_saga()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1
let g:completion_enable_auto_popup = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

let g:completion_timer_cycle = 200 "default value is 80

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Colorscheme stuff
colorscheme base16-outrun-dark
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
