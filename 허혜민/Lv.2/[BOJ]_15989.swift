// https://www.acmicpc.net/problem/15989

var dp: [Int] = Array(repeating: 0, count: 10_001)
dp[1] = 1 
dp[2] = 2 
dp[3] = 3 
dp[4] = 4 
dp[5] = 5

for i in 6..<10_001 {
  dp[i] = dp[i-3] + dp[i-2] - dp[i-5] + 1
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  print(dp[n])
}
