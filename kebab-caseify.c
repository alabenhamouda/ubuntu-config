#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

// compile this file and place it into the ~/bin directory names as kebab-caseify
// used in the mkcp utility to create the name of the folder

void strlwr(char* str){
	while(*str != '\0'){
		*str = tolower(*str);
		str++;
	}
}

int main(int argc, char* argv[]){
	if(argc > 1){
		char* probName = (char*) malloc((strlen(argv[1]) + 1) * sizeof(char));
		strlwr(argv[1]);
		strcpy(probName, argv[1]);
		for(int i = 2; i < argc; i++){
			probName = (char*) realloc(probName, (strlen(probName) + strlen(argv[i]) + 2) * sizeof(char));
			strlwr(argv[i]);
			strcat(probName, "-");
			strcat(probName, argv[i]);
		}
		printf("%s", probName);
	}
	else{
		printf("Pass in the name of the problem\n");
	}
	return 0;
}
