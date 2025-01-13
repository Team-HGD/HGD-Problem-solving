// https://www.acmicpc.net/problem/1697

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

var visited = [Bool](repeating: false, count: 100001)

func bfs(x: Int) {
    var queue = [(x, 0)]
    var index = 0
    visited[x] = true

    while index <= queue.count {
        let x = queue[index].0
        let d = queue[index].1

        if x == k {
            print(d)
            break
        }

        for i in 0..<3 {
            var nx = 0

            switch i {
            case 0:
                nx = x - 1
            case 1:
                nx = x + 1
            default:
                nx = x * 2
            }

            if nx >= 0, nx <= 100000, !visited[nx] {
                visited[nx] = true
                queue.append((nx, d + 1))
            }
        }
        index += 1
    }
}

bfs(x: n)
