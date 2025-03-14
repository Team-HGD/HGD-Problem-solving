// https://www.acmicpc.net/problem/15989
import Foundation

let t = Int(readLine()!)!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 10000 + 1)

dp[1] = [1, 0, 0]
dp[2] = [1, 1, 0]
dp[3] = [2, 0, 1]
var maximum = 4

(1...t).forEach { _ in
    let n = Int(readLine()!)!
    if maximum <= n {
        for i in maximum...n {
            dp[i][0] = dp[i - 1].reduce(0, +)
            dp[i][1] = dp[i - 2][1] + dp[i - 2][2]
            dp[i][2] = dp[i - 3][2]
        }
        maximum = n
    }
    print(dp[n].reduce(0, +))
}
