#include <cstdio>
#include "e1.h"

void allocate(char *p, int m, int n) {
  allocate0(p, m, n, 0, new char[n], new bool[m]);
}

void allocate0(char *p, int m, int n, int level, char *ans, bool *used) {
  if (level == n) {
    printf("%s\n", ans);
    return;
  }
  for (int i = 0; i < m; i++) {
    if (used[i]) {
      continue;
    }
    used[i] = true;
    ans[level] = p[i];
    allocate0(p, m, n, level + 1, ans, used);
    used[i] = false;
  }
}

int main(int argc, char *argv[]) {
  char every_one[5] = "ABCD";
  allocate(every_one, 4, 3);
  return 0;
}
