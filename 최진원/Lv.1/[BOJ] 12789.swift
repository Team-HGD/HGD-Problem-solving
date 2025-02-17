// https://www.acmicpc.net/problem/12789

import Foundation

let n = Int(readLine()!)!
var mainStack = Array(readLine()!.split(separator: " ").compactMap { Int($0) }.reversed())
var buffStack = [Int]()
var order = 1

while !(mainStack.isEmpty && buffStack.last != order) {
    while buffStack.last == order {
        order += 1
        buffStack.removeLast()
    }
    guard !mainStack.isEmpty else { continue }
    if mainStack.last == order {
        order += 1
        mainStack.removeLast()
    } else {
        buffStack.append(mainStack.removeLast())
    }
}

print(buffStack.isEmpty ? "Nice" : "Sad")
