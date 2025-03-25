// https://www.acmicpc.net/problem/14921
import Foundation

let n = Int(readLine()!)!
let potions: [Int] = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }

var lt = 0
var rt = n - 1
var minDifference = 100000001 * 2
var potionSum = 0
while lt < rt {
    let leftPotion = potions[lt]
    let rightPotion = potions[rt]
    let sum = leftPotion + rightPotion
    let difference = sum > 0 ? sum : -1 * (sum)
    if difference < minDifference {
        minDifference = difference
        potionSum = sum
    }
    if sum < 0 {
        lt += 1
    } else if sum > 0 {
        rt -= 1
    } else { break }
}
print(potionSum)
