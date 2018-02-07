#include<stdio.h>

#define NUM 10  /* Macro / symbolic constant */

/* enumeration constant */
typedef enum {TEN=10, TWENTY=20} numbers_t;

int main () {
  int my_int = 30; 
  const int my_const = NUM * 2;  /* constant variable */
  int * j = &my_const;    
  /*int * sneaky_ptr = (int *) my_int;  Be careful!! */
  int * sneaky_ptr = &my_int;
  numbers_t k = TWENTY;
  const int * p = &my_const;

  printf("Before\n");
  printf("my_const=%d [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("my_int=%d [%p]\n", my_int, (void *) &my_int);
  printf("sneaky_ptr=%p val=%d [%p]\n", (void *) sneaky_ptr, *sneaky_ptr, (void *) &sneaky_ptr);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("k=%d [%p]\n", k, (void *) &k);
  printf("NUM=%d\n", NUM);
  printf("TEN=%d\n", TEN);

  /* Not allowed 
  NUM++;              symbolic constants are not an l-value 
  TEN++;              enum constants are not an l-value
  my_const ++;        constant variables are read-only
  (*p)++;             using const pointer to modify a value
  *(&my_const) = 10;  dereferencing address of my_const
  */


  /* allowed - changing what a constant pointer points to */
  p = &my_int;

  printf("\nAfter (*j)++:\n");
  (*j)++;
  printf("my_const=%d [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("my_int=%d [%p]\n", my_int, (void *) &my_int);
  printf("sneaky_ptr=%p val=%d [%p]\n", (void *) sneaky_ptr, *sneaky_ptr, (void *) &sneaky_ptr);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("k=%d [%p]\n", k, (void *) &k);
  printf("NUM=%d\n", NUM);
  printf("TEN=%d\n", TEN);

  printf("\nAfter sneaky_ptr++; (*sneaky_ptr)++:\n");
  sneaky_ptr++;
  (*sneaky_ptr)++;
  printf("my_const=%d [%p]\n", my_const, (void *) &my_const);
  printf("j=%p val=%d [%p]\n", (void *) j, *j, (void *) &j);
  printf("my_int=%d [%p]\n", my_int, (void *) &my_int);
  printf("sneaky_ptr=%p val=%d [%p]\n", (void *) sneaky_ptr, *sneaky_ptr, (void *) &sneaky_ptr);
  printf("p=%p val=%d [%p]\n", (void *) p, *p, (void *) &p);
  printf("k=%d [%p]\n", k, (void *) &k);
  printf("NUM=%d\n", NUM);
  printf("TEN=%d\n", TEN);

  return 0;
}
