// https://school.programmers.co.kr/learn/courses/30/lessons/43162

import Foundation

var visited: [Bool] = []

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result = 0

    visited = Array(repeating: false, count: n)

    for i in 0..<n {
        if !visited[i] {
            dfs(i, n, computers)
            result += 1
        }
    }

    return result
}

func dfs(_ x: Int, _ n: Int, _ computers: [[Int]]) {
    visited[x] = true

    for j in 0..<n {
        if !visited[j] && computers[x][j] == 1 {
            dfs(j, n, computers)
        }
    }
}
