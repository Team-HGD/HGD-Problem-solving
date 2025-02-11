// https://school.programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

// 우선순위 1~9
func solution(_ priorities:[Int], _ location:Int) -> Int {
    let n = priorities.count 
    var priorDict: [Int: Int] = [:]
    let body: [(Int, Int)] = priorities.enumerated().map { 
        priorDict[$1, default: 0] += 1
        return ($0, $1) 
    }
    var q: Queue<(Int, Int)> = .init(body)
    var ans: Int = 1
    while !q.isEmpty {
        let (index, prior) = q.pop()!
        
        if let highPrior = (prior+1..<10).compactMap({
            priorDict[$0, default: 0] > 0 ? 1 : nil 
        }).first {
            q.append((index, prior))  
        } else if location == index {
            break 
        } else {
            priorDict[prior, default: 0] -= 1
            ans += 1
        }
    }
    return ans
}

struct Queue<T> {
    var left: [T] = []
    var right: [T] = [] 
    var isEmpty: Bool {
        self.left.isEmpty && self.right.isEmpty
    }
    
    init(_ body: [T]) {
        self.right = body 
        self.left = [] 
    }
    mutating func append(_ element: T) {
        right.append(element)
    }
    mutating func pop() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right = []
        }
        return left.popLast() 
    }
}
