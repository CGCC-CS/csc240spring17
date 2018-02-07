#include<stdio.h>

int main () {
  char *p = "Hello"; 
  char *s = "this is a string";
  char t[] = "Also a string";

  printf("\n==== print string ====\n");
  printf("p [%p]: %p, %s\n", (void *) &p, (void *) p, p);
  printf("s [%p]: %p, %s\n", (void *) &s, (void *) s, s);
  printf("t [%p]: %p, %s\n", (void *) &t, (void *) t, t);

  printf("\n==== print character ====\n");
  printf("p [%p]: %c [%d]\n", (void *) &p, *p, *p);
  printf("s [%p]: %c [%d]\n", (void *) &s, *s, *s);
  printf("t [%p]: %c [%d]\n", (void *) &t, *t, *t);

  printf("\n==== print string+1 ====\n");
  printf("p : %p, %s\n", (void *) (p+1), p+1);
  printf("s : %p, %s\n", (void *) (s+1), s+1);
  printf("t : %p, %s\n", (void *) (t+1), t+1);

  printf("\n==== print (*character)+1 ====\n");
  printf("p : %c [%d]\n", (*p)+1, (*p)+1);
  printf("s : %c [%d]\n", (*s)+1, (*s)+1);
  printf("t : %c [%d]\n", (*t)+1, (*t)+1);

  printf("\n==== print *(character+1) ====\n");
  printf("p : %c [%d]\n", *(p+1), *(p+1));
  printf("s : %c [%d]\n", *(s+1), *(s+1));
  printf("t : %c [%d]\n", *(t+1), *(t+1));

  printf("\n==== pointer arithmetic vs array indexing ====\n");
  printf("s: [%p] %c\n", (void *) &s, *(s+12));
  printf("s: [%p] %c\n", (void *) &s, s[12]);

  printf ("\nPrint using pointer increment : s=p\n");
  s = p;
  while (*s != '\0') {
    printf("[%c]", *s);
    s++;
  }

  printf("\n");

  return 0;
}
