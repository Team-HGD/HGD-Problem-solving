// https://www.acmicpc.net/problem/1012

import Foundation

let T = Int(readLine()!)!

for _ in 1...T {
    let inputMNK = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let M = inputMNK[0]
    let N = inputMNK[1]
    let K = inputMNK[2]

    var field = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

    for _ in 1...K {
        let inputXY = readLine()!.components(separatedBy: " ").map { Int($0)! }
        let X = inputXY[0]
        let Y = inputXY[1]
        field[Y][X] = 1
    }

    func dfs(_ x: Int, _ y: Int) {
        if x < 0 || x >= M || y < 0 || y >= N {
            return
        }

        if field[y][x] == 1 {
            field[y][x] = 0
            dfs(x+1, y)
            dfs(x-1, y)
            dfs(x, y+1)
            dfs(x, y-1)
        }
    }

    var count = 0

    for i in 0..<N {
        for j in 0..<M {
            if field[i][j] == 1 {
                dfs(j, i)
                count += 1
            }
        }
    }

    print(count)
}
