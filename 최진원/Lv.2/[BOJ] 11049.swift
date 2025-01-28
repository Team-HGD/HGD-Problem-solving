// https://www.acmicpc.net/problem/11049

typealias Matrix = (r: Int, c: Int)

let n = Int(readLine()!)!
var matrices = [Matrix]()
var dpTable = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for _ in 0..<n {
    let rc = readLine()!.split(separator: " ").compactMap { Int($0) }
    matrices.append((r: rc[0], c: rc[1]))
}

for start in 0..<n - 1 {
    dpTable[start][start + 1] = matrices[start].r * matrices[start].c * matrices[start + 1].c
}

for gap in 2..<n {
    for start in 0..<n - gap {
        let end = start + gap
        dpTable[start][end] = Int.max
        for mid in 0..<gap {
            let left = dpTable[start][start + mid]
            let right = dpTable[start + mid + 1][end]
            let cost = matrices[start].r * matrices[start + mid].c * matrices[end].c
            dpTable[start][end] = min(dpTable[start][end], left + right + cost)
        }
    }
}

print(dpTable[0][n - 1])
