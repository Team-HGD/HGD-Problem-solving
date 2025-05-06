// https://www.acmicpc.net/problem/11057

let mod = 10_007
let n = Int(readLine()!)!
var dp = (0...n).map { i in
    i == 1 ? [Int](repeating: 1, count: 10) : [Int](repeating: 0, count: 10)
}
if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            for k in 0...j {
                dp[i][j] = (dp[i][j] + dp[i - 1][k]) % mod
            }
        }
    }
}
print(dp[n].reduce(0) { ($0 + $1) % mod })
