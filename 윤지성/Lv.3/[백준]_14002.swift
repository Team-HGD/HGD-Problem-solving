//https://www.acmicpc.net/problem/14002
import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
var dp: [Int] = Array(repeating: 1000 + 1, count: 1000 + 1)
var dpArr: [[Int]] = Array(repeating: [], count: 1000 + 1)
var maxLen = 1
dp[1] = arr[0]
dpArr[1].append(dp[1])
if n > 1 {
    for idx in 1...(n - 1) {
        let newNumber = arr[idx]
        var maxLength = 0
        for len in 1...maxLen {
             if newNumber > dp[len] { // 큰 경우 수열에 추가해야함
                if len + 1 > maxLen {  // 지금까지 구한 수열 중 제일 긴 수열인 경우
                    dp[len + 1] = newNumber
                    dpArr[len + 1] = dpArr[len]
                    dpArr[len + 1].append(newNumber)
                } else {  // 이미 해당 길이의 수열이 있는 경우
                    if dp[len + 1] > newNumber { // newNumber가 더 작은 경우
                        dp[len + 1] = newNumber
                        dpArr[len + 1] = dpArr[len]
                        dpArr[len + 1].append(newNumber)
                    }
                }
                maxLength = len + 1
            } else if newNumber < dp[len] { // 더 작은 수를 만난 경우
                dp[len] = newNumber
                let _ = dpArr[len].popLast()
                dpArr[len].append(newNumber)
                break
            } else { // 같은 수를 만난 경우
                break
            }
        }
        maxLen = max(maxLength, maxLen)
    }
}
print(maxLen)
print(dpArr[maxLen].map{String($0)}.joined(separator: " "))

