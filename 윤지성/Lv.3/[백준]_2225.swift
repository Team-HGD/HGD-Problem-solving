//https://www.acmicpc.net/problem/2225
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let n = input[0] // 합인 정수
let k = input[1] // 정수 개수

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 200 + 1), count: 200 + 1)
for j in 0...n { // 모든 수를 1개의 정수로 만드는 경우의 수는 1이다.
    dp[1][j] = 1
}
if k > 1 {
    for cnt in 2...k {
        for sum in 0...n {
            for num in 0...sum {
                dp[cnt][sum] += dp[cnt - 1][sum - num]
                dp[cnt][sum] %= 1000000000
            }
        }
    }
}
print(dp[k][n])
