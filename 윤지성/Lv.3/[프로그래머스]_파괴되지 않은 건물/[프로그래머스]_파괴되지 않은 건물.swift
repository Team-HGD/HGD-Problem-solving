// https://school.programmers.co.kr/learn/courses/30/lessons/92344
import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let rowCount = board.count
    let colCount = board[0].count
    var prefixBoards: [[Int]] = Array(repeating: Array(repeating: 0, count: colCount + 1), count: rowCount + 1)
    
    // 1. Prefix Sum 배열 갱신
    for s in skill {
        let type = s[0]
        let startRow = s[1]
        let startCol = s[2]
        let endRow = s[3]
        let endCol = s[4]
        var degree = s[5]
        
        if type == 1 { degree *= -1 }
        
        // 누적합 배열 값 업데이트 시 += 연산 사용
        prefixBoards[startRow][startCol] += degree
        if endRow + 1 < rowCount + 1 { prefixBoards[endRow + 1][startCol] -= degree }
        if endCol + 1 < colCount + 1 { prefixBoards[startRow][endCol + 1] -= degree }
        if endRow + 1 < rowCount + 1, endCol + 1 < colCount + 1 {
            prefixBoards[endRow + 1][endCol + 1] += degree
        }
    }
    
    // 2. 가로 방향 누적 합
    for row in 0 ..< rowCount + 1 {
        var sum = 0
        for col in 0 ..< colCount + 1 {
            sum += prefixBoards[row][col]
            prefixBoards[row][col] = sum
        }
    }
    
    // 3. 세로 방향 누적 합
    for col in 0 ..< colCount + 1 {
        var sum = 0
        for row in 0 ..< rowCount + 1 {
            sum += prefixBoards[row][col]
            prefixBoards[row][col] = sum
        }
    }
    
    // 4. 살아남은 건물 개수 계산
    var answer = 0
    for row in 0 ..< rowCount {
        for col in 0 ..< colCount {
            if board[row][col] + prefixBoards[row][col] > 0 {
                answer += 1
            }
        }
    }
    
    return answer
}
