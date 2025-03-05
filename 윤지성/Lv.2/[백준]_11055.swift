// https://www.acmicpc.net/problem/11055
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}
var dp: [Int] = Array(repeating: 0, count: 1000 + 1)
var answer = arr[0]
dp[arr[0]] = arr[0]
if arr.count > 1 {
    for idx in 1...(arr.count - 1) {
        let number = arr[idx]
        for i in 0...(idx - 1) {
            let lastNumber = arr[i]
            if lastNumber < number {
                dp[number] = max(dp[number], dp[lastNumber] + number)
            } else if number < lastNumber {
                dp[number] = max(dp[number], number)
            }
            answer = max(dp[number], answer)
        }
    }
}
print(answer)
