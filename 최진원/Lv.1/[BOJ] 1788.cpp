// https://www.acmicpc.net/problem/1788

#include <iostream>
#include <cmath>

const int MOD = 1000000000;

int main() {
    int n;
    std::cin >> n;
    int absN = std::abs(n);
    long long * dp = new long long[absN + 2];
    dp[0] = 0;
    dp[1] = 1;
    for (int i = 2; i <= absN; ++i) {
        dp[i] = (dp[i - 1] + dp[i - 2]) % MOD;
    }
    long long result = dp[absN];
    if (n < 0 && absN % 2 == 0) {
        result = -result;
    }
    std::cout << (result > 0 ? 1 : (result < 0 ? -1 : 0)) << std::endl;
    std::cout << std::abs(result % MOD) << std::endl;

    return 0;
}
