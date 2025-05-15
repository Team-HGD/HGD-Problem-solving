// https://www.acmicpc.net/problem/2302
import Foundation

let n = Int(readLine()!)!
let fixedSeatCnt = Int(readLine()!)!
var fixedSeats: [Int] = []

for _ in 0..<fixedSeatCnt {
    fixedSeats.append(Int(readLine()!)!)
}

var dp: [Int] = Array(repeating: 0,  count: 41)
dp[1] = 1
dp[2] = 2
dp[3] = 3
for i in 4...40 {
    dp[i] = dp[i - 1] + dp[i - 2]
}
var answer = 1

var lastSeat = 1
for i in 0..<fixedSeatCnt {
    let remainNum = fixedSeats[i] - lastSeat
    lastSeat = fixedSeats[i] + 1
    guard remainNum > 0 else {
        continue
    }
    answer *= dp[remainNum]
}
let remainNum = n - lastSeat + 1
if remainNum > 0 {
    answer *= dp[remainNum]
}
print(answer)
