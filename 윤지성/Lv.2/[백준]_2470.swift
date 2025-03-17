// https://www.acmicpc.net/problem/2470
import Foundation

let n = Int(readLine()!)!
let potions: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}.sorted()
var answer: [Int] = []
if potions[0] > 0 {
    answer = [potions[0], potions[1]]
} else if potions.last! < 0 {
    answer = [potions[n - 2], potions[n - 1]]
} else {
    var l = 0
    var r = n - 1
    var minimum = -1000000000 * 2
    while l < r {
        let left = potions[l]
        let right = potions[r]
        if isBigDifference(minimum, left + right) {
            minimum = left + right
            answer = [left, right]
        }
        if left + right < 0 {
            l += 1
        } else if 0 < left + right {
            r -= 1
        } else {
            answer = [left, right]
            break
        }
    }
}
func isBigDifference(_ num1: Int, _ num2: Int) -> Bool {
    var n1 = num1 < 0 ? num1 * -1 : num1
    var n2 = num2 < 0 ? num2 * -1 : num2
    return n1 > n2
}
print(answer.map{String($0)}.joined(separator: " "))
