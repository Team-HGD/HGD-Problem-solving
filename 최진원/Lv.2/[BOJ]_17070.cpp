// https://www.acmicpc.net/problem/17070

#include <iostream>

int main() {
    int n;
    std::cin >> n;
    int ** house = new int * [n];
    int *** dp = new int ** [n];
    for (int i = 0; i < n; i++) {
        house[i] = new int[n];
        dp[i] = new int * [n];
        for (int j = 0; j < n; j++) {
            dp[i][j] = new int[3]; // 0: 가로, 1: 세로, 2: 대각
        }
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            std::cin >> house[i][j];
            for (int k = 0; k < 3; k++) {
                dp[i][j][k] = 0;
            }
        }
    }
    dp[0][1][0] = 1;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if (house[i][j]) continue;
            // 가로
            if (j > 0) {
                dp[i][j][0] += dp[i][j - 1][0];
                if (i > 0 && j > 1) dp[i][j][0] += dp[i][j - 1][2];
            }
            // 세로
            if (i > 0) {
                dp[i][j][1] += dp[i - 1][j][1];
                if (i > 1 && j > 0) dp[i][j][1] += dp[i - 1][j][2];
            }
            // 대각
            if (i > 0 && j > 0) {
                if (house[i - 1][j - 1] || house[i - 1][j] || house[i][j - 1]) continue;
                if (j > 1) dp[i][j][2] += dp[i - 1][j - 1][0];
                if (i > 1) dp[i][j][2] += dp[i - 1][j - 1][1];
                if (i > 1 && j > 1) dp[i][j][2] += dp[i - 1][j - 1][2];
            }
        }
    }
    std::cout << dp[n - 1][n - 1][0] + dp[n - 1][n - 1][1] + dp[n - 1][n - 1][2] << std::endl;
    return 0;
}
