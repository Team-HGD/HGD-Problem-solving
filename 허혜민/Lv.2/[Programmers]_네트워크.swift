// https://school.programmers.co.kr/learn/courses/30/lessons/43162?language=swift

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var ans: Int = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    
    for start in 0..<n {
        if visited[start] {
            continue 
        }
        traverse(start: start, visited: &visited, adj: computers, n: n)
        ans += 1
    }
    
    return ans 
}

func traverse(start: Int, visited: inout [Bool], adj: [[Int]], n: Int) {
    var queue: Queue<Int> = .init() 
    queue.push(start)
    
    while !queue.isEmpty {
        let v = queue.popLeft()!
        
        for next in 0..<n {
            if v == next {
                continue 
            }
            if adj[v][next] != 1 {
                continue 
            }
            if visited[next] {
                continue 
            }
            
            queue.push(next)
            visited[next] = true 
        }
    }
}

struct Queue<T> {
    var body: [T] = []
    var isEmpty: Bool {
        body.isEmpty
    }
    var count: Int {
        body.count
    }
    
    mutating func push(_ element: T) {
        body.append(element)
    }
    mutating func popLeft() -> T? {
        body.isEmpty ? nil : body.removeFirst()
    }
}
