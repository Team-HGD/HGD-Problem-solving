// https://www.acmicpc.net/problem/11404
import Foundation

let n = Int(readLine()!)! // 정점
let m = Int(readLine()!)! // 간선

var costs: [[Int]] = Array(repeating: Array(repeating: 100_000 * n + 1, count: n + 1), count: n + 1)

for i in 1...n {
    costs[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let start = input[0]
    let end = input[1]
    let cost = input[2]
    costs[start][end] = min(costs[start][end], cost)
}

for k in 1...n {
    for a in 1...n {
        for b in 1...n {
            costs[a][b] = min(costs[a][k] + costs[k][b], costs[a][b])
        }
    }
}
costs[1...].forEach {
    let line: [String] = $0.map {
        if $0 == (100_000 * n + 1) { return "0"}
        else { return String($0) }
    }
    
    print(line[1...].joined(separator: " "))
}
