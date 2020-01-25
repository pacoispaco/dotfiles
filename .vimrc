" vim configuration file for Paul Cohen

" Vundle stuff
" ------------

set nocompatible              " be iMproved, required
filetype off                  " required

" Before anything below will work you net to get Vundle with
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ajorgensen/vim-markdown-toc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" End of Vundle stuff

" Basic stuff
" -----------

set number
set ruler

set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

silent! colorscheme mustang

au BufRead,BufNewFile *.md setlocal textwidth=80

" Indents and tabs
" ----------------

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Set upp vim-airline
" -------------------

" For info on settings see:
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

" Set up terminal colors
set t_Co=256
" Make statusline appears all the time
set laststatus=2
" Enable powerline fonts
let g:airline_powerline_fonts=1
let g:airline_theme = 'powerlineish'
