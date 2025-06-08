// https://www.acmicpc.net/problem/11066

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    let sizes = readLine()!.split(separator: " ").map { Int($0)! }

    var prefix = [Int](repeating: 0, count: k + 1)
    for i in 0..<k {
        prefix[i + 1] = prefix[i] + sizes[i]
    }

    var dp = [[Int]](repeating: [Int](repeating: 0, count: k), count: k)

    for length in 2...k {
        for i in 0...(k - length) {
            let j = i + length - 1
            dp[i][j] = Int.max
            for m in i..<j {
                let cost = dp[i][m] + dp[m + 1][j] + prefix[j + 1] - prefix[i]
                dp[i][j] = min(dp[i][j], cost)
            }
        }
    }

    print(dp[0][k - 1])
}
