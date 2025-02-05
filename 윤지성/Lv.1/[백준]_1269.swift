// https://www.acmicpc.net/problem/1269
import Foundation
let inputArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
let sum = inputArr[0] + inputArr[1]
let setA = readLine()!.split(separator: " ").map{ Int(String($0))! }
let setB = readLine()!.split(separator: " ").map{ Int(String($0))! }

let reptitionCnt = sum - Set(setA + setB).count

print(sum - 2 * reptitionCnt)
