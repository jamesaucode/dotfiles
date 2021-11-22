" auto-install vim-plug if it doesn't exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'mcchrish/nnn.vim'
Plug 'windwp/nvim-ts-autotag'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'windwp/nvim-autopairs'
Plug 'kshenoy/vim-signature' "Shows where the marks are
Plug 'hrsh7th/nvim-compe' " Autocomplete plugin for neovim
Plug 'glepnir/lspsaga.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'numToStr/Comment.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
" GBrowse to open github url
Plug 'tpope/vim-rhubarb'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
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
" TS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Generates Code doc
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" UI
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'chriskempson/base16-vim'
" Floating ex-commands input
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
call plug#end()

