#include <stdio.h>

char* toLowerCase(char* str) {
    for (char *pointer = str; *pointer != '\0'; pointer++) {
        if( 'A' <= *pointer && *pointer <= 'Z') {
            *pointer = 'a' + (*pointer - 'A');
        }
    }
    return str;
}

int main(int argc, const char *argv[])
{
  char *str = "heLLo";
  printf("%s\n", toLowerCase(str));
  return 0;
}
