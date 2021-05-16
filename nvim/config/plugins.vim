lua << EOF
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

-- built-in theme
local lsp_status = require('lsp-status')
lsp_status.register_progress()
local lspconfig = require'lspconfig'

lspconfig.tsserver.setup({
	on_attach = lsp_status.on_attach,
	capabilities = lsp_status.capabilities,
})

require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
}

require('gitsigns').setup()
require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}
EOF

function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

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

let g:lightline = {
			\ 'colorscheme': 'deepspace',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\ },
			\ }

" Colorscheme stuff
set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
" Unset background color for transparency
highlight Normal guibg=none
highlight NonText guibg=none

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

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
