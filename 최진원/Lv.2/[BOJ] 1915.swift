// https://www.acmicpc.net/problem/1915

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0..<n {
    graph.append(readLine()!.map { Int(String($0))! })
}
var dpTable = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var answer = 0

for column in 0..<m {
    if graph[0][column] == 1 {
        dpTable[0][column] = 1
        answer = 1
    }
}
for row in 0..<n {
    if graph[row][0] == 1 {
        dpTable[row][0] = 1
        answer = 1
    }
}

for row in 1..<n {
    for column in 1..<m {
        if graph[row][column] == 1 {
            dpTable[row][column] = min(
                dpTable[row - 1][column],
                dpTable[row][column - 1],
                dpTable[row - 1][column - 1]
            ) + 1
            answer = max(answer, dpTable[row][column])
        } else {
            dpTable[row][column] = 0
        }
    }
}

print(answer * answer)
