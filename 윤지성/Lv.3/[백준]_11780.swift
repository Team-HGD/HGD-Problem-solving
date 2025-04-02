//https://www.acmicpc.net/problem/11780
import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let intMax = 100_000 * n + 1
var costs: [[Int]] = Array(repeating: Array(repeating: intMax, count: n), count: n )
var routes: [[[Int]]] = Array(repeating: Array(repeating: [], count: n), count: n )

for i in 0..<n {
    costs[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let start = input[0] - 1
    let end = input[1] - 1
    let cost = input[2]
    costs[start ][end] = min(cost, costs[start][end])
}

for k in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if costs[a][k] + costs[k][b] < costs[a][b] {
                costs[a][b] = costs[a][k] + costs[k][b]
                routes[a][b] = routes[a][k] + [k + 1] + routes[k][b]
            }
        }
    }
}

costs.forEach {
    let line: [String] = $0.map {
        if $0 == intMax { return "0"}
        else { return String($0) }
    }
    print(line.joined(separator: " "))
}

for i in 0..<n {
    for j in 0..<n {
        if costs[i][j] == intMax || costs[i][j] == 0 { print(0)}
        else {
            var path = [i + 1] + routes[i][j] + [j + 1]
                print(path.count, terminator: " ")
                print(path.map { String($0) }.joined(separator: " "))
        }
    }
}
