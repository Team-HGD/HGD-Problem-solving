// https://www.acmicpc.net/problem/12658

import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

var dp = [Int](repeating: 0, count: k + 1)

for _ in 0..<n {
    let item = readLine()!.split(separator: " ").map { Int($0)! }
    let weight = item[0]
    let value = item[1]
    
    if weight > k { continue }
    
    for i in stride(from: k, through: weight, by: -1) {
        dp[i] = max(dp[i], dp[i - weight] + value)
    }
}

print(dp[k])
