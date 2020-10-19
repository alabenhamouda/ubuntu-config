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
"Plugin 'git://git.wincent.com/command-t.git'
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
Plugin 'justinmk/vim-sneak'
Plugin 'preservim/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'AndrewRadev/splitjoin.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

"general set config
set showcmd
set termguicolors
" set guifont=Monaco\ 20
" set guifont=Monaco\ Nerd\ Font\ 20
set guifont=Hack\ Nerd\ Font\ Mono\ 20
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set number
set clipboard=unnamedplus
set ttm=0

" ycm configuration
let g:ycm_confirm_extra_conf = 0
let g:ycm_warning_symbol = ''
let g:ycm_error_symbol = ''
"let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 1
" end of ycm configuration

" NERDTree config
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFocus<CR>

" airline config
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1

" COLORSCHEME
" autocmd vimenter * colorscheme gruvbox
let ayucolor="dark"
colorscheme ayu
"colorscheme gruvbox
"set background=dark

"TAGBAR MAPPINGS
nmap <Leader>gg :TagbarOpenAutoClose<CR>
nmap <Leader>gc :TagbarClose<CR>

"OPEN TERMINAL IN NEW TAB
nmap <Leader>t :tabnew <Bar> :ter ++curwin<CR>
