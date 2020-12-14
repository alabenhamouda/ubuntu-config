# Bashrc File
## Styling prompt
```bash
PS1="\[\e[1m\]"
PS1+="\[\e[31m\]\w "
PS1+="\[\e[34m\]-> "
PS1+="\[\e[0m\]"
```
## Competitive Programming utilities
```bash
# aliases
alias comp="cd ~/Projects/C++/competitive_programming/"
alias compile="g++ -g -O2 -Wall main.cpp -o main"
alias main="touch_template"
# There is also a script to test the code 
function touch_template {
	if [ -f ./main.cpp ]
	then
		echo "main.cpp already exists. Do you want to overwrite it?(y/n)"
		read ans
		if [ "$ans" == "y" ]
		then
			cat ~/.template > ./main.cpp
		fi
	else
		cat ~/.template > ./main.cpp
	fi
	if [ ! -f ./input ]
	then
		touch input
	fi
}
function create_problem {
	comp
	if [ -d ./$1 ]
	then
		echo "Directory $1 already exists!"
	else
		mkdir $1
		cd $1
		touch_template
	fi
}
function mkcp {
	if [ $# -eq 0 ]
	then
		CLIP=$(xclip -se c -o)
		PROB=$(~/Projects/C/mkcp/main $CLIP)
		echo "Want to create this folder: $PROB?"
		read -s -n 1 key
		if [[ $key == "" ]]; then
			create_problem $PROB
		else
			echo "Canceling"
		fi
	else
		PROB=$(~/Projects/C/mkcp/main $@)
		create_problem $PROB
	fi
}
export -f mkcp
```
## Move last downloaded file to directory
```bash
function movl {
	TOMOVE="$(ls -t ~/Downloads | head -n 1)"
	if [ -d $1 ]
	then
		mv "/home/alabh/Downloads/$TOMOVE" $1
		cd $1
		echo done.
	else
		echo "$1 is not a directory!"
	fi
}
export -f movl
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
```bash
echo "options r8822be aspm=0" | sudo tee /etc/modprobe.d/r8822be.conf
```

## Also blacklist the ideapad-laptop module after new ubuntu install
```bash
sudo modprobe -r ideapad-laptop
echo "blacklist ideapad-laptop" | sudo tee -a /etc/modprobe.d/blacklist.conf
```

# .vimrc File
Content of .vimrc file is now available in the vimrc file in this repo

# Terminal styling
Use this [github repo](https://github.com/Mayccoll/Gogh) to add themes to gnome terminal <br />
Current profile: A. Atom and increase font size to 14
