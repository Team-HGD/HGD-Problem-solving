// https://www.acmicpc.net/problem/9095
import Foundation

let t = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: 11)
var max: Int = 3
dp[1] = 1
dp[2] = 2
dp[3] = 4

(1...t).forEach { _ in
    let n = Int(readLine()!)!
    guard n > max else { print(dp[n]); return}
    if n > max {
        for i in max + 1 ... n {
            dp[i] = dp[i - 1] + dp[i-2] + dp[i - 3]
        }
        max = n
    }
    print(dp[n])
}
