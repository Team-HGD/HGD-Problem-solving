//https://www.acmicpc.net/problem/15988

#include <iostream>
#include <algorithm>

int main() {
    int T, MOD = 1000000009;
    std::cin >> T;
    int dp[1000001] = {0,};
    dp[0] = 1;
    for (int i = 1; i <= 1000000; i++) {
        for (int j = 1; j <= std::min(i, 3); j++) {
            dp[i] = (dp[i] + dp[i - j]) % MOD;
        }
    }
    while (T--) {
        int n;
        std::cin >> n;
        std::cout << dp[n] << std::endl;
    }
    return 0;
}
