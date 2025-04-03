// https://www.acmicpc.net/problem/7570

import Foundation

let childCount = Int(readLine()!)!
let childSequence = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = [Int](repeating: 0, count: childCount + 1)
for childNum in childSequence {
    dp[childNum] = dp[childNum - 1] + 1
}

print(childCount - dp.max()!)
