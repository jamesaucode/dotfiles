set hidden
set tags=tags
set completeopt=menuone,noselect
" Default tab size to 4
set tabstop=2
set softtabstop=2 noexpandtab
" Make + yank to clipboard on linux
set clipboard=unnamedplus
set shiftwidth=2
set shortmess+=c " Hide ins-completion
set scrolloff=5 " always show at least 5 lines below
set number
set relativenumber
set updatetime=100
set colorcolumn=120 " Set a ruler at the 80th character column
set textwidth=120
set noshowmode
set foldmethod=indent " Fold based on syntax
set foldnestmax=10
" Incremental visual feedback when doing substitute command
set inccommand=split
" Don't fold when we first enter a buffer
set nofoldenable
set foldlevel=2
" Use space for leader
let mapleader = " "
let maplocalleader = " "
" Allow backspacing over autoindentation, line break and start
set backspace=indent,eol,start

set laststatus=2
set showcmd " show command in bottom bar
set wildmenu
" As much as possible of the last line in a window will be displayed
set display+=lastline
set backupcopy=yes
" Show spaces, tabs and new lines as characters
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" When file changes outside of vim, automatically read it again
set autoread
" Set the following variables in .vimrc or /etc/vimrc to make vim put swap,
" backup and undo files in a special location instead of the working directory
" of the file being edited
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

syntax enable

if has("termguicolors") " set true colors
    set termguicolors
endif

" Minimalistic sesion management
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
