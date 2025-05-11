// https://school.programmers.co.kr/learn/courses/30/lessons/389479

import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    let q: Queue = .init()
    var ans: Int = 0
    for player in players {
        q.decrement()
        while let first = q.first, first == 0 {
            q.popLeft()
        }
        
        while player >= m + q.count * m {
            ans += 1
            q.append(k)
        }
    }
    return ans
}

final class Queue {
    var left: [Int] = [] 
    var right: [Int] = [] 
    var count: Int {
        left.count + right.count
    }
    var first: Int? {
        left.isEmpty ? right.first : left.last
    }
    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    func popLeft() -> Int? {
        if left.isEmpty {
            left = right.reversed()
            right = [] 
        }
        return left.popLast() 
    }
    func decrement() {
        for i in 0..<left.count {
            left[i] -= 1 
        }
        for i in 0..<right.count {
            right[i] -= 1
        }
    }
    func append(_ element: Int) {
        right.append(element)
    }
}
