nnoremap  <Leader>n: bn<CR>
nnoremap  <Leader>p: bp<CR>
nnoremap  <Leader>d: bd<CR>
" Fuzzy find keybindings
nmap <nowait><Leader>b :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>R :Rg<CR>
nmap <nowait><Leader>o :Fern . -drawer<CR>

let g:nnn#set_default_mappings = 0
nnoremap <nowait><leader>N :NnnPicker<CR>
nnoremap <nowait><leader>n :NnnPicker %:p:h<CR>
nnoremap <nowait><leader>t :TroubleToggle<CR>

" Easier window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" LSP UI keybindings
nmap <F2> :Lspsaga rename<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gd :Telescope lsp_implementations<CR>
nnoremap <silent>gD :Telescope lsp_definitions<CR>
nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Telescope lsp_code_actions<CR>
nnoremap <silent><leader>dd :Telescope lsp_document_diagnostics<CR>
nnoremap <silent><leader>dD :Telescope lsp_workspace_diagnostics<CR>
nnoremap <silent><leader>dj :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><leader>dk :Lspsaga diagnostic_jump_prev<CR>

" Use floating ex-command
nnoremap : <cmd>lua require('fine-cmdline').open()<CR>

" Fugitive
nnoremap <silent><leader>gg :Git<CR>

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
