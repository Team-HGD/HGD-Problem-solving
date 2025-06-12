// https://www.acmicpc.net/problem/1259

#include <iostream>
#include <string>

int main() {
    while (true) {
        bool isPalindrome = true;
        std::string input;
        std::cin >> input;
        int len = input.size();
        if (input == "0") break;
        for (int i = 0; i < len / 2; i++) {
            if (input[i] != input[len - 1 - i]) {
                isPalindrome = false;
                break;
            }
        }
        std::cout << (isPalindrome ? "yes" : "no") << std::endl;
    }
    return 0;
}
