#include <cstdio>
#include "e3.h"

int expt(int a, int n) {
  return expt0(a, n, 1);
}

int expt0(int a, int n, int s) {
  while (n != 0) {
    if (n % 2 == 0) {
      a *= a;
      n /= 2;
    } else {
      s *= a;
      n -= 1;
    }
  }
  return s;
}

int main(int argc, char *argv[]) {
  printf("%d\n", expt(2, 10));
  printf("%d\n", expt(2, 11));
  printf("%d\n", expt(7, 3));
  printf("%d\n", expt(7, 0));
  printf("%d\n", expt(3, 6));
  return 0;
}

