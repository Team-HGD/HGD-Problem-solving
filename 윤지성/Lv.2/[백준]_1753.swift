// https://www.acmicpc.net/problem/1753

import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let v = input[0]
let e = input[1]
let goal = Int(readLine()!)!
var graphs: [[(Int, Int)]] = Array(repeating: [], count: v + 1)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    let start = input[0]
    let end = input[1]
    let cost = input[2]
    graphs[start].append((end, cost))
}


    var heap = Heap()
    var times: [Int] = Array(repeating: Int.max, count: v + 1)
    heap.push((goal, 0))
    times[goal] = 0
    while !heap.isEmpty {
        let element = heap.pop()
        let idx = element.0
        let cost = element.1
        for (i, co) in graphs[idx] {
            if co + cost < times[i] {
                times[i] = co + cost
                heap.push((i, co + cost))
            }
        }
    }
for i in 1...v {
    print(times[i] == Int.max ? "INF" : times[i])
}



struct Heap {
    private var container: [(Int, Int)] = []
    var isEmpty: Bool {
        container.isEmpty
    }
    var count: Int {
        container.count
    }
    
    mutating func push(_ value: (Int, Int)) {
        container.append(value)
        heapifyUp(count - 1)
    }
    mutating func pop() -> (Int, Int) {
        container.swapAt(0, count - 1)
        let element = container.removeLast()
        heapifyDown(0)
        return element
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx].1 < container[(curIdx - 1) / 2].1 {
            let rootIdx = (curIdx - 1) / 2
            container.swapAt(curIdx, rootIdx)
            curIdx = rootIdx
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var midIdx = curIdx * 2 + 1
            if midIdx + 1 < count && container[midIdx + 1].1 < container[midIdx].1 {
                midIdx += 1
            }
            guard container[midIdx].1 < container[curIdx].1 else { break }
            container.swapAt(midIdx, curIdx)
            curIdx = midIdx
        }
    }
}
