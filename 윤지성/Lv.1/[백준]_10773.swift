// https://www.acmicpc.net/problem/10773
import Foundation

let t = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<t {
    let n = Int(readLine()!)!
    if n != 0 {
        stack.append(n)
    } else {
        let _ = stack.popLast()
    }
}

print(stack.reduce(0, +))
