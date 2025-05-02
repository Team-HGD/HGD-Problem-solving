// https://www.acmicpc.net/problem/11055
#include <iostream>

int main() {
    int n;
    std::cin >> n;
    int * a = new int[n];
    int * dp = new int[n];
    for (int i = 0; i < n; i++) {
        std::cin >> a[i];
        dp[i] = a[i];
    }
    int answer = a[0];
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (a[j] < a[i] && dp[i] < dp[j] + a[i]) {
                dp[i] = dp[j] + a[i];
                answer = dp[i] > answer ? dp[i] : answer;
            }       
        }
    }
    std::cout << answer << std::endl;
    delete[] a;
    delete[] dp;
    return 0;
}
