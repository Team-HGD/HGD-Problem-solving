#include <stdio.h>
#include <stack>
using namespace std;

void push(stack<int>& stack) {
    int value;
    scanf("%d", &value);
    stack.push(value);
}

int top(stack<int>& stack) {
    if (stack.empty()) {
        return -1;
    }
    int topValue = stack.top();
    return topValue;
}

int pop(stack<int>& stack) {
    if (stack.empty()) {
        return -1;
    }
    int poppedValue = stack.top();
    stack.pop();
    return poppedValue;
}

int main() {
    stack<int> stack;
    int n;
    scanf("%d", &n);
    for (int idx = 0; idx < n; idx++) {
        int command;
        scanf("%d", &command);
        switch(command) {
            case 1:
                push(stack);
                break;
            case 2:
                printf("%d\n", pop(stack));
                break;
            case 3:
                printf("%d\n", (int)stack.size());
                break;
            case 4:
                printf("%d\n", stack.empty());
                break;
            case 5:
                printf("%d\n", top(stack));
                break;
        }
    }
    return 0;
}
