//https://leetcode.com/problems/valid-sudoku/


class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in 0..<9 {
            var numbers = Array(repeating: 0, count : 10)
            for col in 0..<9 {
                guard let num = Int(String(board[row][col])) else { continue}
                if numbers[num] > 0 { return false }
                numbers[num] += 1
            }
        }
        for col in 0..<9 {
            var numbers = Array(repeating: 0, count : 10)
            for row in 0..<9 {
                guard let num = Int(String(board[row][col])) else { continue}
                if numbers[num] > 0 { return false }
                numbers[num] += 1
            }
        }
        for i in stride(from: 0, through: 6, by: 3) {
            for j in stride(from: 0, through: 6, by: 3) {
                var numbers = Array(repeating: 0, count : 10)
                for row in i...(i + 2) {
                    for col in j...(j + 2) {
                       guard let num = Int(String(board[row][col])) else { continue}
                        if numbers[num] > 0 { return false }
                        numbers[num] += 1
                    }
                }
            }
        }
        return true
    }
}
