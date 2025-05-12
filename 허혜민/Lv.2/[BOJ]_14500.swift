// https://www.acmicpc.net/problem/14500

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var board: [[Int]] = []
for i in 0..<n {
  let row = readLine()!.split(separator: " ").map{ Int($0)! }
  board.append(row)
}

var ans = 0
for i in 0..<n {
  for j in 0..<m {
    var visited: Set<[Int]> = [[i, j]]
    ans = max(ans, bfs(X: i, Y: j))
    ans = max(ans, other(x: i, y: j))
  }
}
print(ans)

func bfs(X: Int, Y: Int) -> Int {
  typealias State = (x: Int, y: Int, c: Int, visited: [Point])
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  let q = Queue<State>()
  q.append((X, Y, board[X][Y], visited: [Point(x: X, y: Y)]))
  var result = 0
  
  while !q.isEmpty {
    let (x, y, c, v) = q.popLeft()!
    
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      guard 0..<n ~= nx, 0..<m ~= ny else { continue }
      
      let p = Point(x: nx, y: ny)
      guard !v.contains(p) else { continue }
      
      if v.count == 3 {
        result = max(result, c + board[nx][ny])
      } else {
        var visited = v 
        visited.append(p)
        q.append((nx, ny, c + board[nx][ny], visited))
      }
    }
  }
  return result
}

struct Point: Hashable {
  let x: Int 
  let y: Int 
}

func other(x: Int, y: Int) -> Int {
  let dxs = [[1, -1, 0], [1, -1, 0], [0, 0, -1], [0, 0, 1]]
  let dys = [[0, 0, 1], [0, 0, -1], [1, -1, 0], [1, -1, 0]]
  var result: Int = 0
  for (dx, dy) in zip(dxs, dys) {
    var scopeAns: Int = board[x][y]
    for (ddx, ddy) in zip(dx, dy) {
      let nx = x + ddx
      let ny = y + ddy 
      
      guard 0..<n ~= nx, 
      0..<m ~= ny else { break } 
      scopeAns += board[nx][ny]
    }
    result = max(result, scopeAns)
  }
  return result
}

final class Queue<T> {
  var left: [T] = []
  var right: [T] = []
  var isEmpty: Bool { left.isEmpty && right.isEmpty }

  func append(_ element: T) {
    right.append(element)
  }
  func popLeft() -> T? {
    if left.isEmpty {
      left = right.reversed()
      right = []
    }
    return left.popLast()
  }
}
