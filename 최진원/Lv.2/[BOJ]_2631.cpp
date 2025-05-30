// https://www.acmicpc.net/problem/2631

#include <iostream>
#include <algorithm>

int main() {
    int n;
    std::cin >> n;
    int * children = new int[n];
    int * lisCount = new int[n];
    for (int i = 0; i < n; i++) {
        std::cin >> children[i];
        lisCount[i] = 1;
    }
    int maxLIS = 1;
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (children[j] < children[i]) {
                lisCount[i] = std::max(lisCount[i], lisCount[j] + 1);
            }
        }
        maxLIS = std::max(maxLIS, lisCount[i]);
    }
    std::cout << (n - maxLIS) << std::endl;
    delete[] children;
    delete[] lisCount;
    return 0;
}
