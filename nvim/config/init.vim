" auto-install vim-plug if it doesn't exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature' "Shows where the marks are
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "Fuzzy search!
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP client for neovim
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install',
			\ 'branch': 'release/1.x',
			\ 'for': [
			\ 'javascript',
			\ 'typescript',
			\ 'css',
			\ 'less',
			\ 'scss',
			\ 'json',
			\ 'graphql',
			\ 'markdown',
			\ 'vue',
			\ 'lua',
			\ 'php',
			\ 'python',
			\ 'ruby',
			\ 'html',
			\ 'swift' ] }
Plug 'tpope/vim-commentary' "gcc for commenting code
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-sandwich' "better way to add characters around words
Plug 'justinmk/vim-dirvish' "minimal file explorer
"C / C++ syntax highlight
Plug 'arakashic/chromatica.nvim'
Plug 'justinmk/vim-syntax-extra' "more sensible c highlight
" Javascript / Typescript related
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
" UI
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
" Latex
"Plug 'lervag/vimtex'
" Markdown
" Plug 'plasticboy/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Distraction free writing
Plug 'junegunn/goyo.vim'
call plug#end()
