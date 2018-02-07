#include <stdio.h>

int main() {
  char str1[] = "Hello";   /* string (null-terminated character array) */
  char str2[] = {'W', 'o', 'r', 'l', 'd'}; /* character array (not a string!) */
  char str3[] = {'e', 'n', 'd', '\0'}; /* null-terminated char array (a string!) */
  int ii;

  printf("\nOriginal:\n");
  /* Don't do this - 
     str2[x]  ==>  *(str2+x) */
  for(ii=0;ii<15;ii++) {
    printf("str2[%d]=%c (%d)\n", ii, str2[ii], str2[ii]);
  } 

  printf("str1: %s \t %d\n", str1, sizeof(str1));
  printf("str2: %s \t %d\n", str2, sizeof(str2));
  printf("str3: %s \t %d\n", str3, sizeof(str3));
  return 0;
}
