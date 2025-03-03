// https://www.acmicpc.net/problem/1699
import Foundation
let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 100000 + 1, count: 100000 + 1)
dp[0] = 0
dp[1] = 1
dp[2] = 2

if n > 2 {
    for i in 3...n {
        for diff in 1...Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], 1 + dp[i - diff * diff])
        }
    }
}
print(dp[n])

