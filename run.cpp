#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    int c = 0;
    int fromClipboard = 0, saveToInput = 0, diff = 0;
    if (system("[ -e main.cpp ]")) {
        printf("main.cpp does not exist!\n");
        exit(EXIT_FAILURE);
    }
    if (system("[ ! -x main -o main.cpp -nt main ]") == 0) {
        printf("compiling...\n");
        system("make -f ~/.config/makefile");
    }
    while ((c = getopt(argc, argv, "csd")) != -1) {
        switch (c) {
        case 'c':
            fromClipboard = 1;
            break;
        case 's':
            saveToInput = 1;
            break;
        case 'd':
            diff = 1;
            break;
        }
    }
    if (!diff) {
        if (fromClipboard && !saveToInput) {
            system("xclip -selection c -o | ./main");
        } else if (fromClipboard && saveToInput) {
            system(
                "xclip -selection c -o > input && echo \"\" >> input && ./main "
                "< input");
        } else if (!fromClipboard && !saveToInput) {
            system("./main < input");
        }
    } else if (!fromClipboard && !saveToInput) {
        printf("Difference between outputs:\n");
        system("xclip -sel c -o > output && ./main < input | diff "
               "--color=always -u - output");
    } else {
        printf("You cannot use the -d option with the options c or s\n");
    }
    return 0;
}
