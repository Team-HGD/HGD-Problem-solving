// https://www.acmicpc.net/problem/3273
import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()
let x = Int(readLine()!)!

var left: Int = 0
var right: Int = n - 1
var answer: Int = 0

while left < right {
    let leftNum = nums[left]
    let rightNum = nums[right]
    
    if leftNum + rightNum > x {
        right -= 1
    } else if leftNum + rightNum < x {
        left += 1
    } else {
        answer += 1
        left += 1
    }
}
print(answer)
