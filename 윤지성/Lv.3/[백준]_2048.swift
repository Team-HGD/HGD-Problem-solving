//https://www.acmicpc.net/problem/2048
import Foundation

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").compactMap{ Int(String($0))})
}
var directionSequences: [[Int]] = []
var directions: [Int] = [0, 1, 2, 3]

func permute(_ arr: [Int]) {
    if arr.count == 5 {
        directionSequences.append(arr)
        return
    }
    for direction in directions {
        permute(arr + [direction])
    }
}
permute([])

var answer: Int = 0
for directions in directionSequences {
    var newBoard = board
    for direction in directions { // 최대 5번 이동
        newBoard = move(newBoard, direction)
    }
    let maximum = newBoard.map{ $0.max()!}.max()!
    answer = max(answer, maximum)
}

print(answer)

func move(_ board: [[Int]], _ direction: Int) -> [[Int]] {
    switch direction {
    case 0:
        return up(board)
    case 1:
        return down(board)
    case 2:
        return left(board)
    case 3:
        return right(board)
    default:
        return board
    }
}
func up(_ board: [[Int]]) -> [[Int]] {
    var newBoard = board
    for col in 0..<n {
        var stack: [Int] = []
        var newLine: [Int] = []
        for row in 0..<n {
            guard board[row][col] != 0 else { continue }
            guard !stack.isEmpty else { stack.append(board[row][col]); continue}
            let lastElement = stack.removeLast()
            if lastElement == board[row][col] { // 값이 같은 경우
                newLine.append(lastElement * 2)
            } else { // 값이 다른 경우
                newLine.append(lastElement)
                stack.append(board[row][col])
            }
        }
        newLine = newLine + stack
        for i in 0..<newLine.count { // update
            newBoard[i][col] = newLine[i]
        }
        for i in newLine.count..<n {
            newBoard[i][col] = 0
        }
    }
    return newBoard
}
func down(_ board: [[Int]]) -> [[Int]] {
    var newBoard = board
    for col in 0..<n {
        var stack: [Int] = []
        var newLine: [Int] = []
        for row in stride(from: n - 1, through: 0, by: -1) {
            guard board[row][col] != 0 else { continue }
            guard !stack.isEmpty else { stack.append(board[row][col]); continue}
            let lastElement = stack.removeLast()
            if lastElement == board[row][col] { // 값이 같은 경우
                newLine.append(lastElement * 2)
            } else { // 값이 다른 경우
                newLine.append(lastElement)
                stack.append(board[row][col])
            }
        }
        newLine = newLine + stack
        for i in 0..<newLine.count { // update
            newBoard[(n - 1) - i][col] = newLine[i]
        }
        for i in newLine.count..<n {
            newBoard[(n - 1) - i][col] = 0
        }
    }
    return newBoard
}
func left(_ board: [[Int]]) -> [[Int]] {
    var newBoard = board
    for row in 0..<n {
        var stack: [Int] = []
        var newLine: [Int] = []
        for col in 0..<n {
            guard board[row][col] != 0 else { continue }
            guard !stack.isEmpty else { stack.append(board[row][col]); continue}
            let lastElement = stack.removeLast()
            if lastElement == board[row][col] { // 값이 같은 경우
                newLine.append(lastElement * 2)
            } else { // 값이 다른 경우
                newLine.append(lastElement)
                stack.append(board[row][col])
            }
        }
        newLine = newLine + stack
        for i in 0..<n { // update
            guard i < newLine.count else {
                newBoard[row][i] = 0
                continue
            }
            newBoard[row][i] = newLine[i]
        }
    }
    return newBoard
    
}
func right(_ board: [[Int]]) -> [[Int]] {
    var newBoard = board
    for row in 0..<n {
        var stack: [Int] = []
        var newLine: [Int] = []
        for col in stride(from: n - 1, through: 0, by: -1) {
            guard board[row][col] != 0 else { continue }
            guard !stack.isEmpty else { stack.append(board[row][col]); continue}
            let lastElement = stack.removeLast()
            if lastElement == board[row][col] { // 값이 같은 경우
                newLine.append(lastElement * 2)
            } else { // 값이 다른 경우
                newLine.append(lastElement)
                stack.append(board[row][col])
            }
        }
        newLine = newLine + stack
        for i in 0..<n { // update
            guard i < newLine.count else {
                 newBoard[row][(n - 1) - i] = 0
                continue
            }
            newBoard[row][(n - 1) - i] = newLine[i]
        }
    }
    return newBoard
}
