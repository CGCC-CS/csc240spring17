#include<stdio.h>

int main() {
  int arr[] = {1, 2, 3, 4, 5};
  int * ptr;
  int ii;

  ptr = arr;  /* equivalent to ptr = &arr[0]; */

  printf("Array indexing: \n");
  for (ii=0;ii<5;ii++) {
    printf("%d ", arr[ii]);
  }
  printf ("\n");

  printf("\nPointer arithmetic: \n");
  for (ii=0;ii<5;ii++) {
    printf("%d ", *(ptr+ii));
  }
  printf ("\n");

  printf("\nArray indexing using a pointer: \n");
  for (ii=0;ii<5;ii++) {
    printf("%d ", ptr[ii]);
  }
  printf ("\n");

  printf("\nPointer arithmetic using array name: \n");
  for (ii=0;ii<5;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf ("\n");

  printf("\nAre arrays and pointers the same?\n");
  printf("  size of arr=%d\n", sizeof(arr));
  printf("  size of ptr=%d\n", sizeof(ptr));

  /* you can assign a value to pointer, but not an array name */
  ptr = &ii;
  /* arr = &ii; */

  printf("\nIncrementing a pointer: \n");
  ptr = arr;
  for (ii=0;ii<5;ii++) {
    printf("%d ", *ptr);
    ptr ++;
  }
  printf ("\n");

  return 0;
}

