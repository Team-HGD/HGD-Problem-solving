// https://www.acmicpc.net/problem/14940
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let n = input[0]
let m = input[1]
var answers: [[Int]] = Array(repeating: Array(repeating: -1, count: m), count: n)
var goal: (Int, Int) = (0, 0)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var maps: [[Int]] = []
struct Coordinate {
    init(_ x: Int, _ y: Int, _ distance: Int) {
        self.x = x
        self.y = y
        self.distance = distance
    }
    let x: Int
    let y: Int
    let distance: Int
}
struct Queue<Element> {
    private var queue: [Element] = []
    var isEmpty: Bool {
        return queue.isEmpty
    }
    var count: Int {
        queue.count
    }
    mutating func enqueue(_ newElement: Element) {
        queue.append(newElement)
    }
    mutating func dequeue() -> Element? {
        isEmpty == true ? nil : queue.removeFirst()
    }
}

(0...(n - 1)).forEach {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    maps.append(line)
    if let index = line.firstIndex(of: 2) {
        goal = ($0, index)
    }
    for (idx, value) in line.enumerated() {
        if value == 0 { answers[$0][idx] = value }
    }
}
var queue = Queue<Coordinate>()
queue.enqueue(Coordinate(goal.0, goal.1, 0))
visited[goal.0][goal.1] = true

while !queue.isEmpty {
    let element = queue.dequeue()!
    if maps[element.x][element.y] != 0 {
        answers[element.x][element.y] = element.distance
    }
    for i in adjacentElement(from: element) {
        queue.enqueue(i)
        visited[i.x][i.y] = true
    }
}

func adjacentElement(from element: Coordinate) -> [Coordinate] {
    var coordinates: [(Int, Int)] = []
    if maps[element.x][element.y] == 0 { return []}
    if element.x > 0 {
        coordinates.append((element.x - 1, element.y))
    }
    if element.x < n - 1 {
        coordinates.append((element.x + 1, element.y))
    }
    if element.y > 0 {
        coordinates.append((element.x, element.y - 1))
    }
    if element.y < m - 1 {
        coordinates.append((element.x, element.y + 1))
    }
    return coordinates.filter { (x, y) in
        return !visited[x][y]
    }.map{ (x, y) in
        return Coordinate(x, y, element.distance + 1 ) }
}
answers.forEach {
    print($0.map{ String($0)}.joined(separator: " "))
}


