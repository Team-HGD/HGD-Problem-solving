// https://www.acmicpc.net/problem/1904

#include <iostream>

int main() {
    int n;
    std::cin >> n;
    if (n <= 2) {
        std::cout << (n == 1 ? 1 : 2) << std::endl;
        return 0;
    }
    int * dp = new int[n + 1];
    dp[1] = 1;
    dp[2] = 2;
    for (int i = 3; i <= n; i++) {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 15746;
    }
    std::cout << dp[n] << std::endl;
    return 0;
}
