let n = Int(readLine()!)!
let p = [0] + readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = [Int](repeating: 0, count: n + 1)
for i in 1...n {
    for j in 0...i {
        dp[i] = max(dp[i], dp[i - j] + p[j])
    }
}
print(dp[n])
