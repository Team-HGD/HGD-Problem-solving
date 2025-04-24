// https://www.acmicpc.net/problem/3190

import Foundation

let n = Int(readLine()!)!
var boards: [[String]] = Array(repeating: Array(repeating: "n", count: n), count: n)

let appleCnt: Int = Int(readLine()!)!
for _ in 0..<appleCnt { // 사과 세팅
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    boards[input[0] - 1][input[1] - 1] = "a"
}

let directionChangeCnt = Int(readLine()!)!
var shifts: [(Int, String)] = []
for _ in 0..<directionChangeCnt { // 방향 설정
    let input = readLine()!.split(separator: " ").map{String($0)}
    shifts.append((Int(input[0])!, input[1]))
}

var direction = Direction.right
var shift: (Int, String) = shifts[0]
var shiftIdx = 0
var snake = Queue()
snake.push((1, 1))
var second: Int = 0

while true {
    second += 1
    let next = direction.move(snake.head)
    if !(next.0 > 0 && next.0 < (n + 1) && next.1 > 0 && next.1 < (n + 1)) { // 범위를 벗어난 경우
        break
    }
    if boards[next.0 - 1][next.1 - 1] == "s" { break } // 몸이 있는 경우
    if boards[next.0 - 1][next.1 - 1] != "a" { // 사과가 없다면 꼬리도 이동
        let _ = snake.pop()
    }
    snake.push(next)

    if second == shift.0 && shiftIdx < directionChangeCnt {
        direction.changeDirection(shift.1)
        if shiftIdx < directionChangeCnt - 1 {
            shiftIdx += 1
        }
        shift = shifts[shiftIdx]
    }
}
print(second)

enum Direction {
    case left
    case right
    case up
    case down
    
    mutating func changeDirection(_ shift: String) {
        switch self {
        case .left:
            self = shift == "D" ? .up : .down
        case .right:
            self = shift == "D" ? .down : .up
        case .up:
            self = shift == "D" ? .right : .left
        case .down:
            self = shift == "D" ? .left : .right
        }
    }
    func move(_ pos: (Int, Int)) -> (Int, Int) {
        let row = pos.0
        let col = pos.1
        
        switch self {
        case .left:
            return (row, col - 1)
        case .right:
            return (row , col + 1)
        case .up:
            return (row - 1, col)
        case .down:
            return (row + 1, col)
        }
    }
}

struct Queue {
    private var first: Int = 0
    var container: [(Int, Int)] = []
    var head: (Int, Int) {
        return container.last!
    }
    mutating func push(_ value: (Int, Int)) {
        container.append(value)
        boards[value.0 - 1][ value.1 - 1] = "s"
    }
    mutating func pop() -> (Int, Int) {
        let element = container[first]
        first += 1
        boards[element.0 - 1][element.1 - 1] = "n"
        return element
    }
}

