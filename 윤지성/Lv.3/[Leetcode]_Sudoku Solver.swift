//https://leetcode.com/problems/sudoku-solver/description/

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        var rowList: [[Bool]] = Array(repeating: Array(repeating: false, count: 10), count: 9)
        var colList: [[Bool]] = Array(repeating: Array(repeating: false, count: 10), count: 9)
        var gridList: [[Bool]] = Array(repeating: Array(repeating: false, count: 10), count: 9)

        var emptyCnt: Int = 0
        for row in 0...8 {
            for col in 0...8 {
                guard board[row][col] != ".",
                let num = Int(String(board[row][col])) else {
                    emptyCnt += 1
                    continue
                }
                rowList[row][num] = true
                colList[col][num] = true
                let gridIdx = (row / 3) * 3 + col / 3
                gridList[gridIdx][num] = true
             }
        }

        var answer: [[Character]] = []
        func fillIn(_ board: [[Character]], _ emptyCnt: Int)  {
            if emptyCnt == 0 {
                answer = board
                return
            }
            
            for row in 0...8 {
                for col in 0...8 {
                    guard board[row][col] == "." else { continue }
                    for n in 1...9 {
                        let gridIdx = (row / 3) * 3 + col / 3
                        
                        if !rowList[row][n]
                        && !colList[col][n]
                        && !gridList[gridIdx][n]  {
                             rowList[row][n] = true
                             colList[col][n] = true
                             gridList[gridIdx][n] = true
                             
                             var newBoard = board
                             newBoard[row][col] = Character(String(n))
                             fillIn(newBoard, emptyCnt - 1)

                             rowList[row][n] = false
                             colList[col][n] = false
                             gridList[gridIdx][n] = false
                        }
                    }
                    return
                }
            }
            print(board)
        }

        fillIn(board, emptyCnt)
        board = answer
    }
}
