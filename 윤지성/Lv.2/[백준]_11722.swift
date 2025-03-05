// https://www.acmicpc.net/problem/11722
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}
var maxLength = 1
var dp: [Int] = Array(repeating: 0, count: 1000 + 1)

dp[1] = arr[0]
if arr.count > 1 {
    for idx in 1...(arr.count - 1) {
        let number = arr[idx]
        let length = maxLength
        for i in 1...length {
            let lastNumber = dp[i]
            if number < lastNumber {
                dp[i + 1] = max(dp[i + 1], number)
                maxLength = max(maxLength, i + 1)
            } else if lastNumber < number {
                dp[i] = number
                break
            } else { break }
        }
    }
}
print(maxLength )
