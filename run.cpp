#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
	int c = 0;
	int fromClipboard = 0, saveToInput = 0;
	if(system("[ -e main.cpp ]")){
		printf("main.cpp does not exist!\n");
		exit(EXIT_FAILURE);
	}
	if(system("[ ! -x main -o main.cpp -nt main ]") == 0){
		printf("compiling...\n");
		system("g++ -o main main.cpp -Wall -O2 -g");
	}
	while((c = getopt(argc, argv, "cs")) != -1){
		switch(c){
			case 'c': fromClipboard = 1;
					  break;
			case 's': saveToInput = 1;
					  break;
		}
	}
	if(fromClipboard && !saveToInput){
		system("xclip -selection c -o | ./main");
	}
	else if (fromClipboard && saveToInput){
		system("xclip -selection c -o > input && echo \"\" >> input && ./main < input");
	}
	else if(!fromClipboard && !saveToInput){
		system("./main < input");
	}
	return 0;
}
