// https://www.acmicpc.net/problem/11758

import Foundation

let p1 = readLine()!.split(separator: " ").map { Int($0)! }
let p2 = readLine()!.split(separator: " ").map { Int($0)! }
let p3 = readLine()!.split(separator: " ").map { Int($0)! }

let x1 = p1[0], y1 = p1[1]
let x2 = p2[0], y2 = p2[1]
let x3 = p3[0], y3 = p3[1]

let ccw = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

if ccw > 0 {
    print(1)
} else if ccw < 0 {
    print(-1)
} else {
    print(0)
}
