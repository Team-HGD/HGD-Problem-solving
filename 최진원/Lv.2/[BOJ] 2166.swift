// https://www.acmicpc.net/problem/2166

import Foundation

let n = Int(readLine()!)!
var answer = Double()
var points = [(Int, Int)]()

for _ in 0..<n {
    let pointArray = readLine()!.split(separator: " ").compactMap { Int($0) }
    points.append((pointArray[0], pointArray[1]))
}
points.append(points.first!)

var term1 = 0
var term2 = 0

for i in 0..<n {
    term1 += points[i].0 * points[i + 1].1
    term2 += points[i + 1].0 * points[i].1
}
answer = abs(Double(term1 - term2) / 2.0)
print(String(format: "%.1f", answer))
