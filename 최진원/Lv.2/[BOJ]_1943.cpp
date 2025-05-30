// https://www.acmicpc.net/problem/1943

#include <iostream>

int main() {
    int testCase = 0;
    while (testCase < 3) {
        int n;
        int sum = 0;
        std::cin >> n;
        std::pair<int, int> * coins = new std::pair<int, int>[n];
        for (int idx = 0; idx < n; idx++) {
            int coin, quantity;
            std::cin >> coin >> quantity;
            coins[idx] = std::make_pair(coin, quantity);
            sum += (coin * quantity);
        }
        if (sum % 2 == 1) {
            std::cout << 0 << std::endl;
            delete[] coins;
            testCase++;
            continue;
        }
        int target = sum / 2;
        bool * dp = new bool[target + 1];
        std::fill(dp, dp + target + 1, false);
        dp[0] = true;

        for (int i = 0; i < n; i++) {
            int coin = coins[i].first;
            int quantity = coins[i].second;
            bool * tempDP = new bool[target + 1];
            std::copy(dp, dp + target + 1, tempDP);
            for(int j = 0; j <= target; j++) {
                if (dp[j]) {
                    for (int k = 1; k <= quantity; k++) {
                        int newValue = j + (coin * k);
                        if (newValue > target) break;
                        tempDP[newValue] = true;
                    }
                }
            }
            std::swap(dp, tempDP);
            delete[] tempDP;
        }
        dp[target] ? std::cout << 1 : std::cout << 0;
        std::cout << std::endl;
        delete[] coins;
        testCase++;
    }
    return 0;
}
