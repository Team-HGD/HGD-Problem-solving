// https://school.programmers.co.kr/learn/courses/30/lessons/154540
import Foundation

var visited: [[String]] = []
var n: Int = 0 
var m: Int = 0
func solution(_ maps:[String]) -> [Int] {
    visited = maps.map{ $0.map{ String($0) } }
    n = maps.count
    m = maps[0].count
    var ans: [Int] = []
    
    for i in 0..<n {
        for j in 0..<m {
            if visited[i][j] == "X" {
                continue 
            }
            ans.append(traverse(x: i, y: j))
        }
    }
    return ans.isEmpty ? [-1] : ans.sorted()
}

func traverse(x: Int, y: Int) -> Int {
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var q: Queue<(Int, Int)> = .init()
    var result: Int = Int(visited[x][y])!
    
    q.append((x, y))
    visited[x][y] = "X"
    
    while !q.isEmpty {
        let (x, y) = q.popLeft()!
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard 0..<n ~= nx, 
            0..<m ~= ny, 
            visited[nx][ny] != "X" else { continue }
            
            result += Int(visited[nx][ny])!
            visited[nx][ny] = "X"
            q.append((nx, ny))
        }
    }
    return result
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
            left = right
            right = [] 
        }
        return left.popLast()
    }
}
