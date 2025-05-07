// https://www.acmicpc.net/problem/15683
let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m) = (nm[0], nm[1])

var board: [[Int]] = [] 
var cctvs: [(x: Int, y: Int, n: Int)] = []
for i in 0..<n {
  let row = readLine()!.split(separator: " ").map{ Int($0)! }
  for j in 0..<row.count {
    if (1...5).contains(row[j]) {
      cctvs.append((i, j, row[j]))
    }
  }
  board.append(row)
}

var ans: Int = 0 
traverse(count: 0, prev: -1)
print(n * m - ans - board.flatMap{ $0 }.filter({ 1...6 ~= $0 }).count)

func traverse(count: Int, prev: Int) {
  if prev == cctvs.count - 1 {
    ans = max(ans, count)
    return 
  }
  
  for index in prev+1..<cctvs.count {
    let cctv = cctvs[index]
    let direction = directions(cctv: cctv.n)
    direction.forEach {
      let (result, visited) = markBoard(cctv: cctv.n, startPoint: (cctv.x, cctv.y), directions: $0)
      traverse(count: result+count, prev: index)
      unmarkBoard(visited: visited)
    }
  }
}

func markBoard(
  cctv: Int, 
  startPoint: (x: Int, y: Int),
  directions: [Direction]
  ) -> (Int, [(Int, Int)]) {
  var result: Int = 0 
  var visited: [(Int, Int)] = []
  var x: Int = startPoint.x  
  var y: Int = startPoint.y
  for d in directions {
    x = startPoint.x  
    y = startPoint.y
    while true {
    let next = d.nextPoint(x: x, y: y)
    (x, y) = (next.x, next.y)
    guard x > -1, x < board.count, 
    y > -1, y < board[0].count
    else { break }
    
    if board[x][y] == 6 { break }
    if board[x][y] == -1 { continue }
    if 1...5 ~= board[x][y] { continue }
    board[x][y] = -1 
    result += 1 
    visited.append((x, y))
    }
  }
  return (result, visited)
}

func unmarkBoard(visited: [(x: Int, y: Int)]) {
  for point in visited {
    board[point.x][point.y] = 0
  }
}

func directions(cctv: Int) -> [[Direction]] {
  switch cctv {
    case 1: return [[.left], [.right], [.top], [.bottom]]
    case 2: return [[.left, .right], [.top, .bottom]]
    case 3: return [[.top, .right], [.right, .bottom], [.bottom, .left], [.left, .top]]
    case 4: return [[.top, .left, .right], [.top, .right, .bottom], [.left, .right, .bottom], [.top, .bottom, .left]]
    case 5: return [[.top, .bottom, .left, .right]]
    default: return []
  }
}

enum Direction: Int {
  case top 
  case bottom 
  case left 
  case right 
  
  func nextPoint(x: Int, y: Int) -> (x: Int, y: Int) {
    switch self {
      case .top: return (x-1, y)
      case .bottom: return (x+1, y)
      case .left: return (x, y-1)
      case .right: return (x, y+1)
    }
  }
}
