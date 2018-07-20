#include <stdio.h>


int str_to_int(char* num) {
    int result = 0;
    for(char* p = num; (*p) != '\0'; p += 1) {
        result = result * 10 + (*p - '0');
    }
    return result;
}

char* multiply(char* num1, char* num2) {
    return str_to_int(num1) * str_to_int(num2);
}



int main(int argc, const char *argv[])
{
    char num1[] = "123";
    char num2[] = "2";
    printf("%d\n", multiply(num1, num2));
    return 0;
}
