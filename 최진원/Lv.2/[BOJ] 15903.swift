// https://www.acmicpc.net/problem/15903

struct Heap {
    var container = [Int]()
    var count: Int { container.count }

    init(array: [Int]) {
        container = array
        heapify()
    }

    mutating func push(_ value: Int) {
        container.append(value)
        heapifyUp(container.count - 1)
    }
    mutating func pop() -> Int {
        container.swapAt(0, count - 1)
        let topValue = container.removeLast()
        heapifyDown(0)
        return topValue
    }
    mutating func heapify() {
        for idx in stride(from: count / 2 - 1, through: 0, by: -1) {
            heapifyDown(idx)
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            let leftChildIdx = curIdx * 2 + 1
            let rightChildIdx = leftChildIdx + 1
            var minChildIdx = leftChildIdx
            if rightChildIdx < count && container[rightChildIdx] < container[minChildIdx] {
                minChildIdx = rightChildIdx
            }
            guard container[curIdx] > container[minChildIdx] else { break }
            container.swapAt(curIdx, minChildIdx)
            curIdx = minChildIdx
        }
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx] < container[(curIdx - 1) / 2] {
            container.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
}

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
let a = readLine()!.split(separator: " ").compactMap { Int($0) }
var heap = Heap(array: a)
for _ in 0..<m {
    let card1 = heap.pop()
    let card2 = heap.pop()
    heap.push(card1 + card2)
    heap.push(card1 + card2)
}

print(heap.container.reduce(0) { $0 + $1 })
