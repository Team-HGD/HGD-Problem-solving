// https://www.acmicpc.net/problem/15903
import Foundation

var heap = Heap()
let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let n = input[0]
let m = input[1]
let cards = readLine()!.split(separator: " ").compactMap{ Int(String($0))}

cards.forEach { heap.push($0) }
for _ in 0..<m {
    let smallNum1 = heap.pop()
    let smallNum2 = heap.pop()
    heap.push(smallNum1 + smallNum2)
    heap.push(smallNum1 + smallNum2)
}

print(heap.sum)

struct Heap {
    private var container: [Int] = []
    var count: Int {
        container.count
    }
    var sum: Int {
        container.reduce(0, +)
    }
    mutating func push(_ value: Int) {
        container.append(value)
        heapifyUp(count - 1)
    }
    mutating func pop() -> Int {
        container.swapAt(0, count - 1)
        let root = container.removeLast()
        heapifyDown(0)
        return root
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while (curIdx - 1) / 2  >= 0 && container[(curIdx - 1) / 2] > container[curIdx] {
            container.swapAt((curIdx - 1) / 2, curIdx)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var childIdx = curIdx * 2 + 1
            if childIdx + 1 < count && container[childIdx] > container[childIdx + 1] {
                childIdx += 1
            }
            guard container[childIdx] < container[curIdx] else { return }
            container.swapAt(childIdx, curIdx)
            curIdx = childIdx
        }
    }
}
