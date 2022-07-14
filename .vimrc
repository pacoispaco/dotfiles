" vim configuration file for Paul Cohen (https://github.com/pacoispaco/dotfiles)

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
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mzlogin/vim-markdown-toc'

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

" Basic config
" ------------

set number
set ruler

set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Colors and colorscheme
" ----------------------

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
" See: https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable
set termguicolors

silent colorscheme gruvbox
set background=dark         " gruvbox dark mode

" Indents, tabs and textwidth
" ---------------------------

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" on reaching 100 characters, insert line break
set textwidth=100

" For HTML files we make tab 2 spaces
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Set up vim-airline
" ------------------

" For info on settings see:
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

" Set up terminal colors
"set t_Co=256
" Make statusline appears all the time
set laststatus=2
" Enable powerline fonts
let g:airline_powerline_fonts=1
let g:airline_theme = 'powerlineish'

" Set up YouCompleteMe
" --------------------
"
" This configuration is as described here:
" https://clay-atlas.com/us/blog/2021/07/04/vim-en-you-complete-me-plugin-auto-code/
" For info on other settings for YCM and Python, see:
" https://github.com/ycm-core/YouCompleteMe#configuring-through-vim-options
"
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"let g:ycm_python_binary_path='/usr/bin/python3'

" This configuration is as described here:
" https://github.com/ycm-core/YouCompleteMe#configuring-through-vim-options
"
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'

" Configure YCM to close preview window on return.
let g:ycm_autoclose_preview_window_after_insertion = 1
