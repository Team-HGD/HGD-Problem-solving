// https://www.acmicpc.net/problem/2156
import Foundation

let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: 3)
(1...n).forEach {
    let amount = Int(readLine()!)!
    if $0 == 1 { dp[1] = amount }
    else if $0 == 2 {
        dp[2] = dp[1] + amount
        dp[0] = dp[1]
        dp[1] = amount
    } else {
        let temp0 = dp[0]
        let temp1 = dp[1]
        let temp2 = dp[2]
        
        dp[0] = max(max(temp0, temp1), temp2)
        dp[1] = temp0 + amount
        dp[2] = temp1 + amount
    }
}
print(dp.max()!)
