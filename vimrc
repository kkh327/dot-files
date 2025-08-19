set nocompatible
set clipboard=unnamed
set noerrorbells
set belloff=all
set mouse=a
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set backspace=indent,eol,start
set undofile
set incsearch
set relativenumber
set ignorecase 

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'othree/html5.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
hi LineNr ctermfg=2
nnoremap <C-t> :NERDTreeToggle<CR>
set nocompatible
set noerrorbells
set belloff=all
set mouse=a
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set backspace=indent,eol,start
set undofile
set incsearch
set relativenumber

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'othree/html5.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
hi LineNr ctermfg=2
nnoremap <C-t> :NERDTreeToggle<CR>

