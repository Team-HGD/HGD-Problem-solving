// https://www.acmicpc.net/problem/23971
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let h = input[0]
let w = input[1]
let n = input[2] + 1
let m = input[3] + 1

var maxInHeight = h / n
if h % n > 0 { maxInHeight += 1}
var maxInWidth = w / m
if w % m > 0 { maxInWidth += 1}

print(maxInHeight * maxInWidth)
