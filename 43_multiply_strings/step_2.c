#include <stdio.h>
#include <string.h>

char *strrev(char *str)
{
      char *p1, *p2;

      if (! str || ! *str)
            return str;
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      return str;
}

void string_multiply_single_int(char *num1, int n, char* string_result, int len) {
    int remainder = 0;
    int carray = 0;
    int result = 0;
    int i = 0;
    for( char* p = num1; *p != '\0'; p++ ) {
        result = n * (*p - '0') + carray;
        remainder = result % 10;
        carray = result / 10;
        string_result[i++] = remainder + '0';
    }
    if (carray > 0) {
        string_result[i++] = carray;
    }
    string_result[i] = '\0';
}

char* multiply(char* num1, char* num2) {
    char result[220] = "";
    char result2[220] = "";
    int num2_size = strlen(num2);

    strrev(num1);
    strrev(num2);

    int frequency = 0;
    for(int index_of_reverse_num2 = 0; index_of_reverse_num2 < num2_size; index_of_reverse_num2 ++) {
        //从char得到整数值
        int multiplier = num2[index_of_reverse_num2] - '0';
        string_multiply_single_int(num1, multiplier, result2, 220);


        frequency += 1;
    }
}



int main(int argc, const char *argv[])
{
    char num1[110] = "123";
    char num2[110] = "456";
    multiply(num1, num2);
    return 0;
}
