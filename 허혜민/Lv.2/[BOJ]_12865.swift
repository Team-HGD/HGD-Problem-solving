// https://www.acmicpc.net/problem/12865

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, K) = (nk[0], nk[1])
var weight: [Int] = [] 
var value: [Int] = []

for _ in 0..<N {
    let wv  = readLine()!.split(separator: " ").map{ Int($0)! }
    let (w, v) = (wv[0], wv[1])
    weight.append(w)
    value.append(v)
}

var dp: [[Int]] = Array(
  repeating: Array(repeating: 0, count: K+1),
  count: N+1
  )
  
for i in 1..<N+1 {
  for j in 1..<K+1 {
    if j - weight[i-1] > -1 {
      dp[i][j] = max(dp[i-1][j], dp[i-1][j-weight[i-1]] + value[i-1])
    } else {
      dp[i][j] = dp[i-1][j]
    }
  }
}

print(dp[N][K])
