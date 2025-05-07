//https://www.acmicpc.net/problem/15685

import Foundation

let n = Int(readLine()!)!
var boards: [[Bool]] = Array(repeating: Array(repeating: false, count: 101), count: 101)

for _ in 0..<n {
    var stack: [(Int, Int)] = []
    let curve = readLine()!.split(separator: " ").compactMap{ Int(String($0))!}
    let start: (Int, Int) = (curve[0], curve[1])
    let direction = curve[2]
    stack.append(start)
    
    switch direction {
        case 0:
        stack.append((start.0 + 1, start.1))
        case 1:
            stack.append((start.0 , start.1 - 1))
        case 2:
            stack.append((start.0 - 1, start.1))
        case 3:
            stack.append((start.0, start.1 + 1))
        default:
            break
    }
    for _ in 0..<curve[3] {
        let newStack = getCurve(stack)
        stack = newStack
    }
    for i in stack {
        guard (0...100) ~= i.0 && (0...100) ~= i.1 else { continue }
        boards[i.0][i.1] = true
    }
}
var answer: Int = 0
for y in 0...99 {
    for x in 0...99 {
        if boards[y][x] && boards[y][x + 1] && boards[y + 1][x] && boards[y + 1][x + 1] {
            answer += 1
        }
    }
}
print(answer)
    
func getCurve(_ curve: [(Int, Int)]) -> [(Int, Int)] {
    var curve = curve
    guard var priorPoint = curve.last else { return []}
    var length = curve.count
    
    for idx in stride(from: length - 2, through: 0, by: -1) {
        let currentPoint = curve[idx]
        let (xDiff, yDiff) = (priorPoint.0 - currentPoint.0, priorPoint.1 - currentPoint.1)
        
        guard let endPoint = curve.last else { return [] }
        let (newX, newY) = (endPoint.0 + yDiff , endPoint.1 + xDiff * -1)
        curve.append((newX, newY))
        priorPoint = currentPoint
    }
    
    return curve
}
