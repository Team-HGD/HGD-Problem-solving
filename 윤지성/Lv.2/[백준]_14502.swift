// https://www.acmicpc.net/problem/14502
import Foundation

var options: [[(Int, Int)]] = []
var emptyPos: [(Int, Int)] = []
var virusPos: [(Int, Int)] = []
var board: [[Int]] = []
let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let rowCnt = input[0]
let colCnt = input[1]
var wallCnt = 0


for row in 0..<rowCnt { // 세팅
   let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
   for (col, val) in input.enumerated() {
       if val == 0 {
           emptyPos.append((row, col)) // 빈 칸 정보
       } else if val == 2 {
           virusPos.append((row, col))
       } else if val == 1 {wallCnt += 1}
   }
    board.append(input)
}
var answer: Int = 0
backTrack(0 , [])
for walls in options {
    var eachBoard = board
    for (row, col) in walls {
        eachBoard[row][col] = 1
    }
    answer = max(answer, safeArea(eachBoard))
}

print(answer - wallCnt - 3)

func backTrack(_ start: Int,  _ positions: [(Int, Int)]) { // 3벽을 세우는 가능한 모든 경우의 수 찾기
    if positions.count == 3 {
        options.append(positions)
        return
    }
    if start >= emptyPos.count { return }
    for idx in start..<emptyPos.count {
        var newPositions = positions
        newPositions.append(emptyPos[idx])
        backTrack(idx + 1, newPositions)
    }
}

var defaultVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: colCnt) , count: rowCnt)
for (row, col) in virusPos {
   defaultVisited[row][col] = true
}

func safeArea(_ board: [[Int]]) -> Int { //bfs
    let dy = [0, 0, -1, 1]
    let dx = [-1, 1, 0, 0]
    
    var stack: [(Int, Int)] = virusPos
    var visited: [[Bool]] =  Array(repeating: Array(repeating: false, count: colCnt) , count: rowCnt)
    for (row, col) in virusPos {
       visited[row][col] = true
    }
    var area: Int = 0
    while !stack.isEmpty {
        let (row, col) = stack.removeLast()
        area += 1
        for dir in 0..<dx.count {
            let newRow = row + dy[dir]
            let newCol = col + dx[dir]
            if (0..<rowCnt) ~= newRow && (0..<colCnt) ~= newCol
            && board[newRow][newCol] != 1 && !visited[newRow][newCol] {
                stack.append((newRow, newCol))
                visited[newRow][newCol] = true
            }
        }
    }
    return rowCnt * colCnt - area
}

