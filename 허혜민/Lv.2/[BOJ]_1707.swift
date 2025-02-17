// https://www.acmicpc.net/problem/1707

let k = Int(readLine()!)!
for _ in 0..<k {
  solution()
}

var adj: [Int: [Int]] = [:]
func solution() {
  let ve = readLine()!.split(separator: " ").map{ Int($0)! }
  let (v, e) = (ve[0], ve[1])
  adj = [:]
  for _ in 0..<e {
      let ab = readLine()!.split(separator: " ").map{ Int($0)! }
      let (a, b) = (ab[0], ab[1])
      adj[a-1, default: []].append(b-1)
      adj[b-1, default: []].append(a-1)
  }
  let isBipart = bfs(start: 0, last: v)
  print(isBipart ? "YES" : "NO")
}

func bfs(start: Int, last: Int) -> Bool {
  var q: Queue<(Int, Int)> = .init() 
  q.append((start, 1))
  var board: [Int] = Array(repeating: 0, count: last)
  board[start] = 1
  var count: Int = 1
  
  while !q.isEmpty {
    let (v, color) = q.popLeft()!
    
    for next in adj[v, default: []] {
      if next == v {
        return false 
      }
      
      if board[next] == color {
        return false 
      }
      
      if board[next] == 0 {
        board[next] = color * (-1)
        q.append((next, color * (-1)))
        count += 1
        continue 
      } 
    }
    if q.isEmpty,
    count != last,
    let nextStart = (0..<last).filter({ board[$0] == 0 }).first {
          q.append((nextStart, 1))
          board[nextStart] = 1
          count += 1
    }
  }
  return true  
}

struct Queue<T> {
  var left: [T] = [] 
  var right: [T] = []
  var isEmpty: Bool {
    left.isEmpty && right.isEmpty 
  }
  
  mutating func append(_ element: T) {
    right.append(element)
  }
  mutating func popLeft() -> T? {
    if left.isEmpty {
      left = right.reversed() 
      right = [] 
    }
    return left.popLast()
  }
}
