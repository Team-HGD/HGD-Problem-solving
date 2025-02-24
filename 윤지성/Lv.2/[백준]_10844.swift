// https://www.acmicpc.net/problem/10844
import Foundation

let n = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count : 100 + 1)

dp[1] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
if n > 1 {
    for row in 2...n {
        for col in 0...9 {
            if col == 0 {
                dp[row][col] = (dp[row - 1][col + 1]) % 1000000000
            } else if col == 9 {
                dp[row][col] = (dp[row - 1][col - 1]) % 1000000000
            } else {
                dp[row][col] = (dp[row - 1][col + 1] + dp[row - 1][col - 1]) % 1000000000
            }
        }
    }
}
print((dp[n].reduce(0, +) - dp[n][0]) % 1000000000)
