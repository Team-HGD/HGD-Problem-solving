// https://www.acmicpc.net/problem/1912
import Foundation
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var answer = arr[0]
var subSum = answer
if n > 1 {
    for i in 1...(n - 1) {
        if arr[i] + subSum < arr[i] {
           subSum = arr[i]
        } else {
            subSum += arr[i]
        }
        answer = max(subSum, answer)
    }
}
print(answer)
