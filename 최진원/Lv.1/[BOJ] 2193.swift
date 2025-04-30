typealias DPElment = (Int, Int)
let n = Int(readLine()!)!
var dp = [DPElment](repeating: (0, 0), count: n + 1)
dp[1] = (0, 1)
if n > 1 {
    for digit in 2...n {
        dp[digit].0 = dp[digit - 1].0 + dp[digit - 1].1
        dp[digit].1 = dp[digit - 1].0
    }
}
print(dp[n].0 + dp[n].1)
