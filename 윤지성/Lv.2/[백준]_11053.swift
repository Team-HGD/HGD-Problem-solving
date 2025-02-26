// https://www.acmicpc.net/problem/11053
import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
var dp: [Int] = Array(repeating: 1000 + 1, count: 1000 + 1)
var len = 1
dp[1] = arr[0]
if n > 1 {
    for i in 1...(n - 1) {
        let num = arr[i]
        var maxLength = 0
        for length in 1...len {
            if dp[length] < num { // 현재 수보다 크다면 자릿수를 높여서 해당 n + 1번째 수와 비교하여 더 작은 수 저장
                dp[length + 1] = min(num , dp[length + 1])
                maxLength = length + 1
            }
            else if dp[length] > num { // 현재 수보다 작다면 n 번째 수에 그 수 저장
                dp[length]  = num
                break
            } else { // 같다면 빠져~
                break
            }
        }
        len = max(len, maxLength)
    }
}
print(len)
