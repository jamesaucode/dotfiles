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

lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
	indent = {
    enable = true
  },
}
EOF
" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
"
" Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'c' : [
			\	{'complete_items': ['ts']}
			\	],
			\'python' : [
			\	{'complete_items': ['ts']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
			\'go' : [
			\	{'complete_items': ['lsp', 'ts']}
			\	],
			\'typescript' : [
			\	{'complete_items': ['lsp', 'ts']}
			\	],
			\'tsx' : [
			\	{'complete_items': ['lsp', 'ts']}
			\	],
			\'javascript' : [
			\	{'complete_items': ['lsp', 'ts']}
			\	],
			\}

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
