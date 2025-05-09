// https://www.acmicpc.net/problem/1788

let n = Int(readLine()!)!
let maxABS = 1_000_000
let division = 1_000_000_000
var dp: [Int] = Array(repeating: 0, count: maxABS + 1)
var negativeDP: [Int] = Array(repeating: 0, count: maxABS + 1)
dp[1] = 1 
// 양수 
for i in 2...maxABS {
  dp[i] = (dp[i-1] + dp[i-2]) % division
}

var i = -2
negativeDP[1] = 1 // f(1) - f(0) = f(-1)
// f(-2) = f(0) - f(-1) = -1 
// f(-3) = f(-1) - f(-2) = 1 - (-1) = 2
while abs(i) <= maxABS {
  // f(n) = f(n+2) - f(n+1) n < 1 
  let n = abs(i)
  let left = abs(i+2)
  let right = abs(i+1)
   negativeDP[n] = (negativeDP[left] - negativeDP[right]) % division
  i -= 1 
}

if n == 0 {
  print(0)
  print(0)
} else if n < 0 {
  let fn = negativeDP[abs(n)]
  print(fn == 0 ? 0 : ((fn < 0) ? -1 : 1))
  print(abs(fn))
} else {
  print(1)
  print(dp[n])
}
