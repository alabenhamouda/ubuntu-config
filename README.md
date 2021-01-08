# Zsh configuration
install zsh then install [oh my zsh](https://github.com/ohmyzsh/ohmyzsh).<br />
Current theme is "jonathan" and add
[autosuggestion and syntax highlighting](https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95)
and source ~/.my_config.sh file at the end of .zshrc file.<br />
place the makefile in ~/.config/, that makefile is used in the compile function.
## my_config.sh
```zsh
function touch_template {
	if [ -f ./main.cpp ]
		then
			echo "main.cpp already exists. Do you want to overwrite it?(y/n)"
			read ans
			if [ $ans = "y" ]
				then
					cat ~/.template > ./main.cpp
			else
				echo "Canceling..."
					fi
	else
		cat ~/.template > ./main.cpp
			fi
			if [ ! -f ./input ]
				then
					touch input
					fi
}
alias acc="cd ~/Projects/C++/accelerated_c++/"
alias comp="cd ~/Projects/C++/competitive_programming/"
# alias compile="g++ -g -O2 -Wall main.cpp -o main"
alias main="touch_template"
#alias run="xclip -selection c -o > ./input && ./main < input"
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
			PROB=$(kebab-caseify ${=CLIP})
			echo "Want to create this folder: $PROB?"
			read -sk 1 key
			if [[ $key == $'\x0a' ]]; then
				create_problem $PROB
			else
				echo "Canceling"
					fi
	else
		PROB=$(kebab-caseify $@)
			create_problem $PROB
			fi
}
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
function compile {
	make -I ~/.config/ $1
}
bindkey '^ ' autosuggest-accept
export PATH=$PATH:/usr/local/go/bin:/usr/lib/jvm/jdk-15.0.1/bin:/opt/node-v10.16.0-linux-x64/bin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
```
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
			PROB=$(kebab-caseify $CLIP)
			echo "Want to create this folder: $PROB?"
			read -s -n 1 key
			if [[ $key == "" ]]; then
				create_problem $PROB
			else
				echo "Canceling"
					fi
	else
		PROB=$(kebab-caseify $@)
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

# .inputrc File
Added inputrc file here to make tab key cycle through possible completions in terminal

# Terminal styling
Use this [github repo](https://github.com/Mayccoll/Gogh) to add themes to gnome terminal <br />
Install this [font](https://github.com/microsoft/cascadia-code) <br />
Current profile: Azu and increase font size to 16
