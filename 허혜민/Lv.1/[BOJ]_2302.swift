// https://www.acmicpc.net/problem/2302

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let vips = (0..<m).map{ _ in Int(readLine()!)! }

var dp: [Int] = Array(repeating: 0, count: 41)
(dp[0], dp[1], dp[2]) = (1, 1, 2)
for i in 3..<41 {
    dp[i] = dp[i-1] + dp[i-2]
}

var prev = 0 
var counts: [Int] = vips.map{ 
  let result = $0 - prev - 1
  prev = $0 
  return result < 0 ? 0 : result 
}.map{ dp[$0] }
if !counts.isEmpty, prev != n {
  counts.append(dp[n-prev])
}
if counts.isEmpty {
  print(dp[n])
} else {
  print(counts.reduce(1, *))
}


// 양끝좌석은 내가 앉았느냐 앉지 않았느냐에 따라 갈림 
// vip석으로 sub-problem으로 나누기 
// 
// n = 1 f(n) = 1 
// n = 2 f(n) = 2 
// n = 3 f(n) = 3 f(2) + f(0)
// n = 4 f(n) = f(3)  + f(1) : f(n-1) + f(n-2)
// 1 2 3 4 
// 1 3 2 4 
// 2 1 3 4 
// 1 2 4 3 
// 2 1 4 3 

// 1 2 3 (0)
// 1 3 2 (0)
// 2 1 3 (0)
// 2 3 1 (x)
// 3 1 2 (x)
// 3 2 1 (X)
