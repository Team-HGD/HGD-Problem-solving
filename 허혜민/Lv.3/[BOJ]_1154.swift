// https://www.acmicpc.net/problem/1154

let n = Int(readLine()!)!
let all: Set<Int> = .init(1...n)
var adj: [Int: Set<Int>] = [:]
var notAdj: [Int: Set<Int>] = [:]
for i in 1...n {
  notAdj[i, default: []].insert(i)
}
while true {
  let ab = readLine()!.split(separator: " ").map{ Int($0)! }
  let (a, b) = (ab[0], ab[1])
  if a == -1, b == -1 {
    break 
  }
  notAdj[a, default: []].insert(b)
  notAdj[b, default: []].insert(a)
}
notAdj.map{ 
  adj[$0] = all.symmetricDifference($1)
}
let result = bfs(start: 1)
if result.isEmpty {
  print(-1)
} else {
  print(1)
  let first = (1...n)
  .filter({ result[$0] == 1 })
  .sorted(by: <)
  .map{ String($0) }
  
  let second = (1...n)
  .filter({ result[$0] == -1 })
  .sorted(by: <)
  .map{ String($0) }
  
  if first.isEmpty {
    print(second.joined(separator: " "), -1)
    print(-1)
  } else if second.isEmpty {
    print(first.joined(separator: " "), -1)
    print(-1)
  } else if first[0] < second[0] {
    print(first.joined(separator: " "), -1)
    print(second.joined(separator: " "), -1)
  } else {
    print(second.joined(separator: " "), -1)
    print(first.joined(separator: " "), -1)
  }
}


func bfs(start: Int) -> [Int] {
  var q: Queue<Int> = .init()
  var team: [Int] = Array(repeating: 0, count: n+1)
  q.append(start)
  team[start] = 1
  
  while !q.isEmpty {
    let v = q.popLeft()!
    
    for next in adj[v, default: []] {
      if team[next] == team[v] {
        return [] 
      }
      
      if team[next] == 0 {
        team[next] = -team[v]
        q.append(next)
      }
    }
    
    if q.isEmpty,
    let nextStart = (1...n).filter({ team[$0] == 0 }).first {
      q.append(nextStart)
      team[nextStart] = 1 
    }
  }
  return team 
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
