// https://www.acmicpc.net/problem/1238
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let n = input[0] // 마을 수
let m = input[1] // 도로 수
let x = input[2] // 도착지

var roads: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
var goingTimes: [Int] = Array(repeating: 0, count: n + 1)
var comingTimes: [Int] = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    let start = input[0]
    let end = input[1]
    let time = input[2]
    roads[start].append((end, time))
}

for i in 1...n { // 가는 최단 시간 계산
    var times: [Int] = Array(repeating: Int.max, count: n + 1)
    var heap = Heap()
    heap.push((i, 0))
    times[i] = 0
    while !heap.isEmpty {
        let element = heap.pop()
        let village = element.0
        let time = element.1
        
        for (vill, ti) in roads[village] {
            if  ti + time < times[vill] {
                times[vill] = ti + time
                heap.push((vill, ti + time))
            }
        }
    }
    goingTimes[i] = times[x]
}
var heap = Heap()
heap.push((x, 0))
while !heap.isEmpty { // 오는 시간 최단 시간 계산
    let element = heap.pop()
    let village = element.0
    let time = element.1
    for (vill, ti) in roads[village] {
        if  ti + time < comingTimes[vill] {
            comingTimes[vill] = ti + time
            heap.push((vill, ti + time))
        }
    }
}

let answer: [Int] = (0...n).map{
    if $0 == 0 { return 0 }
    return goingTimes[$0] + comingTimes[$0]
}

print(answer.max()!)
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
    mutating func pop() -> (Int, Int){
        container.swapAt(0, count - 1)
        let element = container.removeLast()
        heapifyDown(0)
        return element
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx].1 < container[(curIdx - 1) / 2].1 {
            container.swapAt(curIdx, (curIdx - 1) / 2 )
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var midIdx = curIdx * 2 + 1
            if midIdx + 1 < count && container[midIdx] > container[midIdx + 1] {
                midIdx += 1
            }
            guard container[midIdx] < container[curIdx] else { break }
            container.swapAt(midIdx, curIdx)
            curIdx = midIdx
        }
    }
}
