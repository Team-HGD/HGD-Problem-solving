// https://www.acmicpc.net/problem/2075
import Foundation

struct Heap {
    private var container: [Int] = []
    var count: Int {
        container.count
    }
    var minimum: Int {
        container[0]
    }
    init() {}
    mutating func push(_ value: Int) {
        container.append(value)
        heapifyUp(count - 1)
    }
    mutating func pop() -> Int {
        container.swapAt(0, count - 1)
        let topValue = container.removeLast()
        heapifyDown(0)
        return topValue
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx] < container[(curIdx - 1) / 2] {
            container.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            let leftIdx = curIdx * 2 + 1
            let rightIdx = leftIdx + 1
            var minIdx = leftIdx
            if rightIdx < count && container[rightIdx] < container[leftIdx] {
                minIdx = rightIdx
            }
            guard container[minIdx] < container[curIdx] else { break }
            container.swapAt(minIdx, curIdx)
            curIdx = minIdx
        }
    }
}

let file = FileIO()
let n = file.readInt()
var heap = Heap()

(1...n).forEach { _ in
    var nums: [Int] = []
    for _ in 0..<n {
        nums.append(file.readInt())
    }
    for num in nums {
        if heap.count >= n {
            if heap.minimum  < num {
                let _ = heap.pop()
                heap.push(num)
            }
        } else {
            heap.push(num)
        }
    }
}
print(heap.pop())


final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
