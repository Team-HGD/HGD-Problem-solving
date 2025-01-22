// https://school.programmers.co.kr/learn/courses/30/lessons/12913

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var board: [[Int]] = land
    for row in 0..<land.count-1 {
        for col in 0..<4 {
            for j in 0..<4 {
                if col == j { continue }
                board[row+1][j] = max(
                    board[row+1][j],
                    land[row+1][j] + board[row][col]
                )
            }
        }
    }
    return board.last!.sorted().last!
}
