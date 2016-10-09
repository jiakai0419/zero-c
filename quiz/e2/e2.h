struct Node {
  char _value;
  Node *_next;
};

Node * create(char *stuff, int n);

void display(Node *head);

Node * reverse(Node *head);
