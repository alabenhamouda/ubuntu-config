call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set number
set rnu
set ignorecase
set smartcase

"Theme configuration
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
if !has("gui_running")
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE
	" highlight clear LineNr
endif

let g:airline_powerline_fonts = 1

"easymotion configuration
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

"easymotion with coc problem
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

"use tab and shift tab to cycle through suggestions and <cr> to confirm
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"AUTOFORMAT UPON SAVING
let extension = expand('%:e')
if (extension == "cpp") || (extension == "java") || (extension == "c")
	au BufWrite * :Autoformat
endif
let g:formatdef_my_custom_cpp = '"clang-format -style=''{BasedOnStyle: LLVM, IndentWidth: 4}''"'
let g:formatters_cpp = ['my_custom_cpp']

ab readtsts int t; cin >> t;<CR>while(t--){<CR>
