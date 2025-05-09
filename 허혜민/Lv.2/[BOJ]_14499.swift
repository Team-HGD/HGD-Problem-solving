//https://www.acmicpc.net/problem/14499

let nmxyk = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, m, x, y, k) = (nmxyk[0], nmxyk[1], nmxyk[2], nmxyk[3], nmxyk[4])
var board: [[Int]] = [] 
for _ in 0..<n {
  let row = readLine()!.split(separator: " ").map{ Int($0)! }
  board.append(row)
}

var (i, j) = (x, y)
let commands = readLine()!.split(separator: " ").map{ Int($0)! }
var dice: [Dice: Int] = [:]
for command in commands {
  let d = Direction(rawValue: command)!
  switch d {
    case .east where j + 1 < m: 
    (dice[.top], dice[.west],dice[.bottom], dice[.east]) = (dice[.east], dice[.top], dice[.west], dice[.bottom])
    case .west where j - 1 > -1: 
     (dice[.top], dice[.west],dice[.bottom], dice[.east]) = (dice[.west], dice[.bottom], dice[.east], dice[.top])
    case .north where i - 1 > -1:
     (dice[.top], dice[.front],dice[.bottom], dice[.back]) = (dice[.front], dice[.bottom], dice[.back], dice[.top])
    case .south where i + 1 < n: 
      (dice[.top], dice[.front],dice[.bottom], dice[.back]) = (dice[.back], dice[.top], dice[.front], dice[.bottom])
    default: continue 
  }
  let (nx, ny) = d.nextPoint(x: i, y: j)
  move(x: nx, y: ny)
  (i, j) = (nx, ny)
  print(dice[.top, default: 0])
}

func move(x: Int, y: Int) {
  if board[x][y] == 0 {
    board[x][y] = dice[.bottom, default: 0]
  } else {
    dice[.bottom] = board[x][y]
    board[x][y] = 0
  }
}

enum Direction: Int {
  case east = 1 
  case west = 2 
  case north = 3 
  case south = 4 
  
  func nextPoint(x: Int, y: Int) -> (x: Int, y: Int) {
    switch self {
      case .east:
       return (x, y+1)
      case .west:
       return (x, y-1)
      case .north: 
       return (x-1, y)
      case .south: 
        return (x+1, y)
    }
  }
}

enum Dice: Hashable {
  case top 
  case bottom 
  case west 
  case east 
  case front 
  case back 
}
