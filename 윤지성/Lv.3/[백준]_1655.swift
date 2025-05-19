//https://www.acmicpc.net/problem/1655

import Foundation

var arr: [String] = []
var minHeap = MinHeap() // 큰 값들 저장
var maxHeap = MaxHeap() // 작은 값들 저장

let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    guard let root = maxHeap.root else {
        maxHeap.push(num)
        arr.append(String(maxHeap.root!))
        continue
    }
    if root < num {
        minHeap.push(num)
    } else {
        maxHeap.push(num)
    }
    if minHeap.count + 1 < maxHeap.count {
        let element = maxHeap.pop()
        minHeap.push(element)
    } else if maxHeap.count < minHeap.count {
        let element = minHeap.pop()
        maxHeap.push(element)
    }
    arr.append("\n")
    arr.append(String(maxHeap.root!))
}
print(arr.joined(separator: ""))

struct MaxHeap {
    private var container: [Int] = []
    var count: Int {
        container.count
    }
    var root: Int? {
        container.first
    }
    mutating func push(_ value: Int) {
        container.append(value)
        heapifyUp(count - 1)
    }
    mutating func pop() -> Int {
        container.swapAt(0, count - 1)
        let popElement = container.removeLast()
        heapifyDown(0)
        return popElement
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var childIdx = curIdx * 2 + 1
            if childIdx + 1 < count && container[childIdx + 1] > container[childIdx] {
                childIdx += 1
            }
            guard container[childIdx] > container[curIdx] else { return }
            container.swapAt(childIdx, curIdx)
            curIdx = childIdx
        }
    }
    mutating func heapifyUp(_ idx: Int ) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx] > container[(curIdx - 1) / 2] {
            container.swapAt(curIdx, (curIdx - 1) / 2 )
            curIdx = (curIdx - 1) / 2
        }
    }
}
struct MinHeap {
    private var container: [Int] = []
    var count: Int {
        container.count
    }
    var root: Int {
        container[0]
    }
    mutating func push(_ value: Int) {
        container.append(value)
        heapifyUp(count - 1)
    }
    mutating func pop()-> Int {
        container.swapAt(0, count - 1)
        let popElement = container.removeLast()
        heapifyDown(0)
        return popElement
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var childIdx = curIdx * 2 + 1
            if childIdx + 1 < count && container[childIdx + 1] < container[childIdx] {
                childIdx += 1
            }
            guard container[childIdx] < container[curIdx] else { return }
            container.swapAt(childIdx, curIdx)
            curIdx = childIdx
        }
    }
    mutating func heapifyUp(_ idx: Int ) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx] < container[(curIdx - 1) / 2] {
            container.swapAt(curIdx, (curIdx - 1) / 2 )
            curIdx = (curIdx - 1) / 2
        }
    }
}
