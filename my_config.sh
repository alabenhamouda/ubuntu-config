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
alias bat="batcat"
alias main="touch_template"
alias weather="curl -s \"wttr.in/el mourouj\""
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
		mv "/home/alabh/Downloads/$TOMOVE" $1 && cd $1 && echo done.
	else
		echo "$1 is not a directory!"
	fi
}
function compile {
	make -f ~/.config/makefile $1 $2
}
function lslst {
	ls --color=always -t | head -n $1
}
bindkey '^ ' autosuggest-accept
export PATH=$PATH:/usr/local/go/bin:/usr/lib/jvm/jdk-15.0.1/bin:/opt/pc2-9.6.0/bin:/opt/Papyrus/:/home/alabh/.yarn/bin/
export JAVAHOME=/usr/lib/jvm/jdk-15.0.1
export PC2HOME=/opt/pc2-9.6.0/
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# weather | head -n -2

# change TERM env variable so that tmux can display zsh suggestion color
export TERM=xterm-256color
