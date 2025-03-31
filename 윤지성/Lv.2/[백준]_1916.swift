// https://www.acmicpc.net/problem/1916
import Foundation

let numOfCity = Int(readLine()!)!
let numOfBus = Int(readLine()!)!

var cities: [[(Int, Int)]] = Array(repeating: [], count: numOfCity + 1)
var distances: [Int] = Array(repeating: Int.max, count: numOfCity + 1)
var heap = Heap()

for _ in 0..<numOfBus {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    let start = input[0]
    let end = input[1]
    let cost = input[2]
    cities[start].append((end, cost))
}

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let departCity = input[0]
let arrivalCity = input[1]

heap.push((departCity, 0))
distances[departCity] = 0

while !heap.isEmpty {
    let (city, distance) = heap.pop()
    if distances[city] < distance {  continue }
    for (idx, dist) in cities[city] {
       if distance + dist < distances[idx] {
           distances[idx] = distance + dist
           heap.push((idx, distance + dist))
       }
    }
}
print(distances[arrivalCity])

struct Heap  {
    private var container: [(Int, Int)] = []
    var count: Int {
        container.count
    }
    var isEmpty: Bool {
        container.isEmpty
    }
    mutating func push(_ element: (Int, Int)) {
        container.append(element)
        heapifyUp(count - 1)
    }
    
    mutating func pop() -> (Int, Int) {
        container.swapAt(0, (count - 1))
        let element = container.removeLast()
        heapifyDown(0)
        return element
    }
    mutating func heapifyUp(_ idx: Int) {
        var curIdx = idx
        while curIdx > 0 && container[curIdx].1 < container[ (curIdx - 1) / 2].1 {
            container.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    mutating func heapifyDown(_ idx: Int) {
        var curIdx = idx
        while curIdx * 2 + 1 < count {
            var mid = curIdx * 2 + 1
            if mid + 1 < count && container[mid + 1].1 < container[mid].1 {
                mid = mid + 1
            }
            guard container[mid].1 < container[curIdx].1 else { break }
            container.swapAt(mid, curIdx)
            curIdx = mid
        }
    }
}


