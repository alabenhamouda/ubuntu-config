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
alias comp="cd ~/Projects/C++/competitive_programming/"
alias compile="g++ -O2 -Wall main.cpp -o main"
alias main="touch_template"
function mkcp {
	if [ -z "${1+x}" ]
	then
		echo "Pass in the name of the problem"
	else
		comp
		mkdir $1
		cd $1
		touch_template
	fi
}
export -f mkcp
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
