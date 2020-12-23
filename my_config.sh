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
alias acc="cd ~/Projects/C++/accelerated_c++/"
alias comp="cd ~/Projects/C++/competitive_programming/"
alias compile="g++ -g -O2 -Wall main.cpp -o main"
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
bindkey '^ ' autosuggest-accept
export PATH=$PATH:/usr/local/go/bin:/usr/lib/jvm/jdk-15.0.1/bin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
