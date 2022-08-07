lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {}, -- List of parsers to ignore installing
	context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  autotag = {
    enable = true,
  }
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()
local lspconfig = require'lspconfig'
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
require("mason").setup()
require("mason-lspconfig").setup()
require('formatter').setup{
	filetype = {
		typescriptreact = {
			require('formatter.filetypes.typescriptreact').prettierd,
		},
		javascriptreact = {
			require('formatter.filetypes.typescriptreact').prettierd,
		},
		typescript = {
			require('formatter.filetypes.typescriptreact').prettierd,
		},
		javascript = {
			require('formatter.filetypes.typescriptreact').prettierd,
		},
	}
}
require('nvim-autopairs').setup{}
require('gitsigns').setup()
require("trouble").setup {}
require('telescope').load_extension('fzf')
require('Comment').setup{
	pre_hook = function(ctx)
    local U = require 'Comment.utils'

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}
require("toggleterm").setup{
	open_mapping = [[<leader>t]],
	shade_terminals = true,
	insert_mappings = false,
	terminal_mappings = false,
	direction = 'float',
	close_on_exit = true,
}
EOF

function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

" Auto do formatting on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

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
			\ 'colorscheme': 'PaperColor_light',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead',
			\ },
			\ }

" Colorscheme stuff
set termguicolors
colorscheme base16-atelier-forest-light
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

" use the same n³ session within a vim session
let g:nnn#session = 'local'
