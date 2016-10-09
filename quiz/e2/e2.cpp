#include <cstdio>

struct Node {
  char _value;
  Node *_next;
};

Node * create(char *stuff, int n) {
  if (n == 0) {
    return NULL;
  }
  Node *pre = new Node();
  Node *head = pre;
  pre->_value = stuff[0];
  pre->_next = NULL;
  for (int i = 1; i < n; i++) {
    Node *cur = new Node();
    cur->_value = stuff[i];
    cur->_next = NULL;
    pre->_next = cur;
    pre = cur;
  }
  return head;
}

void display(Node *head) {
  Node *p = head;
  while (NULL != p) {
    printf("%c", p->_value);
    p = p->_next;
  }
  printf("\n");
}

Node * reverse(Node *head) {
  Node *p = NULL;
  Node *q = head;
  while (NULL != q) {
    Node *tmp = q->_next;
    q->_next = p;
    p = q;
    q = tmp;
  }
  return p;
}


int main(int argc, char *argv[]) {
  char stuff[8] = "ABCDEFG";

  Node *n1 = create(stuff, 0);
  display(n1);
  Node *n1_r = reverse(n1);
  display(n1_r);

  Node *n2 = create(stuff, 1);
  display(n2);
  Node *n2_r = reverse(n2);
  display(n2_r);

  Node *n3 = create(stuff, 5);
  display(n3);
  Node *n3_r = reverse(n3);
  display(n3_r);

  return 0;
}
