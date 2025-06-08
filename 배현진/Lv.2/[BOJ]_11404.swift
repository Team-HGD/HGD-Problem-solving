// https://www.acmicpc.net/problem/11404

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var dist = Array(
    repeating: Array(repeating: 1000000000, count: n),
    count: n
)

for i in 0..<n {
    dist[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0] - 1
    let to = input[1] - 1
    let cost = input[2]
    
    dist[from][to] = min(dist[from][to], cost)
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if dist[i][j] > dist[i][k] + dist[k][j] {
                dist[i][j] = dist[i][k] + dist[k][j]
            }
        }
    }
}

for i in 0..<n {
    var result = ""
    for j in 0..<n {
        if dist[i][j] == 1000000000 {
            result += "0 "
        } else {
            result += "\(dist[i][j]) "
        }
    }
    print(result.trimmingCharacters(in: .whitespaces))
}
