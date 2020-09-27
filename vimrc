set nocompatible              " be iMproved, required;
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'jiangmiao/auto-pairs'
Plugin 'ayu-theme/ayu-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'preservim/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set showcmd
" nnoremap <C-l> A;<Esc>
" nnoremap <C-k> A;<Esc>o
" nnoremap <C-p> "+p

set termguicolors
" let ayucolor="dark"
" colorscheme ayu
" set guifont=Monaco\ 20
" set guifont=Monaco\ Nerd\ Font\ 20
set guifont=Hack\ Nerd\ Font\ Mono\ 20
set encoding=UTF-8

set tabstop=4
set shiftwidth=4

set number
syntax on
let g:ycm_confirm_extra_conf = 0
set clipboard=unnamedplus
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFocus<CR>
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
" autocmd vimenter * colorscheme gruvbox
colorscheme gruvbox
set background=dark
