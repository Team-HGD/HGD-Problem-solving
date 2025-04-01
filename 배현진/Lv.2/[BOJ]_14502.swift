// https://www.acmicpc.net/problem/14502

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = [[Int]]()

let dx = [-1, 1, 0, 0]
let dy = [0, 0, 1, -1]
var result = 0
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func dfs(_ depth: Int) {
    if depth == 3 {
        bfs()
        return
    }
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == 0 {
                arr[i][j] = 1
                dfs(depth + 1)
                arr[i][j] = 0
            }
        }
    }
    
}

func bfs() {
    var visited = Array(repeating: Array(repeating: false, count: 9), count: 9)
    var temp = arr
    var queue = [Int]()
    for i in 0..<n {
        for j in 0..<m {
            if temp[i][j] == 2 {
                queue.append(i * 10 + j)
            }
        }
    }
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        let x = pop / 10
        let y = pop % 10
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && ny >= 0 && nx < n && ny < m{
                if temp[nx][ny] == 0 && !visited[nx][ny]{
                    visited[nx][ny] = true
                    temp[nx][ny] = 2
                    queue.append(nx * 10 + ny)
                }
                
            }
        }
    }
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if temp[i][j] == 0 {
                count += 1
            }
        }
    }
    result = max(result, count)
}

dfs(0)

print(result)
