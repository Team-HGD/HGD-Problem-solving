// https://leetcode.com/problems/coin-change/

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp: [Int] = Array(repeating: -1, count: amount + 1)
        let coins = coins.sorted()
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin > i { break }
                if dp[i - coin] != -1 {
                    dp[i] =  dp[i] == -1 ? dp[i - coin] + 1  : min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount]
    }
}
