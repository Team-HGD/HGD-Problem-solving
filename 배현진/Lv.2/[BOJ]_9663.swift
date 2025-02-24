// https://www.acmicpc.net/problem/9663

let n = Int(readLine()!)!
var board = Array(repeating: 0, count: n)
var visited = Array(repeating: false, count: n)
var answer = 0

func dfs(x: Int) {
    if x == n {
        answer += 1
        return
    }
    for i in 0..<n {
        if visited[i] { continue }
        board[x] = i
        if checkQueen(row: x) {
            visited[i] = true
            dfs(x: x + 1)
            visited[i] = false
        }
    }
}

func checkQueen(row: Int) -> Bool {
    for i in 0..<row {
        if board[i] == board[row] || abs(board[i] - board[row]) == abs(i - row) {
            return false
        }
    }
    return true
}

dfs(x: 0)

print(answer)
