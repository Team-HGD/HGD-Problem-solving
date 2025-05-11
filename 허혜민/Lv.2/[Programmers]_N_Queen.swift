// https://school.programmers.co.kr/learn/courses/30/lessons/12952

import Foundation

var n: Int = 0
var ans: Int = 0
var board: [[Int]] = []
func solution(_ N: Int) -> Int {
    n = N 
    board = Array(
        repeating: Array(
            repeating: 0,
            count: n
        ),
        count: n
    )
    back(prevRow: -1)
    return ans 
}

func back(prevRow: Int) {
    if prevRow == n-1 {
        ans += 1
        return 
    }
    
    for i in 0..<n { // column 
        guard board[prevRow+1][i] == 0 else {
            continue 
        }
        board[prevRow+1][i] = -1 
        let copyBoard = board 
        markBoard(board: &board, x: prevRow + 1, y: i)
        back(prevRow: prevRow + 1)
        board[prevRow+1][i] = -1 
        board = copyBoard
    }
}

func markBoard(board: inout [[Int]], x: Int, y: Int) {
    let dxs = [0, 0, 1, -1, 1, 1, -1, -1] 
    let dys = [1, -1, 0, 0, 1, -1, 1, -1] 
    for (dx, dy) in zip(dxs, dys) {
        var x = x 
        var y = y
        while true {
            let nx = x + dx
            let ny = y + dy 
            
            guard 0...n-1 ~= nx, 
            0...n-1 ~= ny else { break }
            if board[nx][ny] == -1 { break } // 기물이 존재
            board[nx][ny] = 1
            (x, y) = (nx, ny)
        }
    }
}

struct Point {
    let x: Int 
    let y: Int
}
