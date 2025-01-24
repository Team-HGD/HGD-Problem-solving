// https://www.acmicpc.net/problem/2573

let directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]
let input = readLine()!.split(separator: " ").map {Int($0)!}
let (n, m) = (input[0], input[1])
var arr: [[Int]] = [] // 빙산 높이 정보 담는 2차원 배열
var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n) // 방문 여부 체크 (몇번째 년도에 방문했는지)

// 주어진 빙산의 높이 정보 arr에 저장
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map {Int($0)!}
    arr.append(row)
}

var count = 1 // 덩어리 개수
var answer = 0 // 몇번째 해인지 저장

func bfs(_ graph: inout [[Int]], _ x: Int, _ y: Int) {
    var queue = [(x, y)]
    while !queue.isEmpty {
        let (currentX, currentY) = queue.removeFirst()
        for (dx, dy) in directions {
            let qx = dx + currentX
            let qy = dy + currentY
            // 인접 노드 범위 체크 & 방문 여부 체크
            if qx >= 0 && qx < n && qy >= 0 && qy < m && visited[qx][qy] < answer {
                if graph[qx][qy] > 0 { // 해당 칸이 빙산인 경우
                    visited[qx][qy] = answer // 방문 표시
                    queue.append((qx, qy)) // 큐에 추가
                } else { // 해당 칸이 바다인 경우
                    graph[currentX][currentY] -= 1 // 빙산 높이 감소시킴
                }
            }
        }
    }
}

while count == 1 { // 빙산이 하나의 덩어리로 이어져 있는 동안 반복
    count = 0 // count 0으로 초기화. bfs 수행되면(= 녹일 빙산이 있다면) 1이 됨
    answer += 1
    for i in 0..<n {
        for j in 0..<m {
            // 이번 해에 방문하지 않는 빙산 찾기
            if arr[i][j] > 0 && visited[i][j] < answer {
                visited[i][j] = answer
                count += 1 // bfs가 2번 이상 호출되면 덩어리가 2개 이상이라는 뜻
                bfs(&arr, i, j)
            }
        }
    }
    if count == 0 { // 녹일 빙산이 없는 경우(= 다 0이라는 뜻)
        answer = 1
        break
    }
}

print(answer - 1)
