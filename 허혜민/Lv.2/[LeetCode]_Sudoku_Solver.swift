// https://leetcode.com/problems/sudoku-solver/

class Solution {
    var rowSet: [[Bool]] = [] 
    var colSet: [[Bool]] = []
    var matrixSet: [[Bool]] = []
    var points: [(x: Int, y: Int)] = []
    var result: [[Character]] = []

    func solveSudoku(_ board: inout [[Character]]) {
        rowSet = Array(repeating: Array(repeating: false, count: 10), count: 10)
        colSet = Array(repeating: Array(repeating: false, count: 10), count: 10)
        matrixSet = Array(repeating: Array(repeating: false, count: 10), count: 10)
        for i in 0..<9 {
            for j in 0..<9 {
                guard let num = board[i][j].wholeNumberValue else { 
                    points.append((i, j))
                    continue 
                }
                rowSet[i][num] = true 
                colSet[j][num] = true 
                matrixSet[(i / 3) * 3 + j / 3][num] = true 
            }
        }
        back(board: &board, count: 0)
        board = self.result
    }
    func back(board: inout [[Character]], count: Int) {
        if !self.result.isEmpty {
            return 
        }
        if count == points.count {
            self.result = board
            return 
        }
      
            let p = points[count]
            let x = p.x 
            let y = p.y
            for i in 1...9 {
                guard !rowSet[x][i],
                 !colSet[y][i],
                 !matrixSet[(x / 3) * 3 + y / 3][i] else {
                    continue 
                 }

                rowSet[x][i] = true 
                colSet[y][i] = true 
                matrixSet[(x / 3) * 3 + y / 3][i] = true 
                board[x][y] = Character(UnicodeScalar(i + 48)!)
                back(board: &board, count: count + 1)
                board[x][y] = "."
                rowSet[x][i] = false 
                colSet[y][i] = false 
                matrixSet[(x / 3) * 3 + y / 3][i] = false
            }
        
    }
}
