// https://www.acmicpc.net/problem/4949

import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

a.sort()

// b 값은 고정이어야 함으로, 인덱스만 정렬
let bIndices = b.enumerated().sorted { $0.element > $1.element }.map { $0.offset }

var newA = Array(repeating: 0, count: n)
for i in 0..<n {
    newA[bIndices[i]] = a[i]
}

var result = 0
for i in 0..<n {
    result += newA[i] * b[i]
}

print(result)
