" auto-install vim-plug if it doesn't exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'alvan/vim-closetag'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature' "Shows where the marks are
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim' "Fuzzy search
Plug 'mattn/emmet-vim'
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
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-sandwich' "better way to add characters around words
Plug 'christoomey/vim-tmux-navigator'
"File Browser
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
" Javascript / Typescript related
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
" UI
Plug 'itchyny/lightline.vim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
call plug#end()

