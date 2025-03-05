// https://www.acmicpc.net/problem/1932
import Foundation

let t = Int(readLine()!)!
var triangle: [[Int]] = []
var answer = 0
(1...t).forEach { _ in
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
    triangle.append(arr)
}
var idx = t - 2
while true {
    if triangle.count == 1 {
        print(triangle.removeLast().last!)
        break
    }
    let line = triangle.removeLast()
    for i in 0...(line.count - 2) {
        triangle[idx][i] += max(line[i], line[i + 1])
    }
    idx -= 1
}
