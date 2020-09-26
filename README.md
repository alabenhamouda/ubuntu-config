# Bashrc File
## Styling prompt
```bash
PS1="\[\e[1m\]"
PS1+="\[\e[31m\]\w "
PS1+="\[\e[34m\]-> "
PS1+="\[\e[0m\]"
```
## Competitive Programming Aliases for Compiling and Boilerplate
```bash
alias compile="g++ -O2 -Wall main.cpp -o main"
alias main="cat ~/.template > main.cpp && touch input"
```

# Competitive Programming Template
```c++
#include <bits/stdc++.h>
#define PI 3.14159265359
#define FOR(i, a, b) for(int i = a; i <= b; i++)
typedef long long ll;
typedef long double ld;

using namespace std;

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);

    return 0;
}
```
# Command fixing wifi issue
echo "options r8822be aspm=0" | sudo tee /etc/modprobe.d/r8822be.conf

## Also when blacklist the ideapad-laptop module first thing after ubuntu install
```bash
sudo modprobe -r ideapad-laptop
echo "blacklist ideapad-laptop" | sudo tee -a /etc/modprobe.d/blacklist.conf
```

# .vimrc File
```vim
set nocompatible       " be iMproved, required
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
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set showcmd
nnoremap <C-p> "+p

set termguicolors
let ayucolor="dark"
colorscheme ayu
set guifont=Monaco\ 20

set tabstop=4
set shiftwidth=4

set number
```
# Terminal styling
Use this [github repo](https://github.com/Mayccoll/Gogh) to add themes to gnome terminal <br />
Current profile: A. Atom and increase font size to 14
