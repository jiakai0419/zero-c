struct Node {
  char _value;
  Node *next;
};

Node * create(char *stuff, int n);

void display(Node *head);

Node * reverse(Node *head);
