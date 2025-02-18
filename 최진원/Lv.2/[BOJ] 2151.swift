// https://www.acmicpc.net/problem/2151

typealias Location = (row: Int, column: Int)
enum Direction: Int, CaseIterable { 
    case up = 0, right, down, left 
    var move: Location {
        switch self {
        case .up: return (-1 ,0)
        case .right: return (0, 1)
        case .down: return (1, 0)
        case .left: return (0, -1)
        }
    }
}
typealias HeapNode = (location: Location, direction: Direction, cost: Int)
struct Heap {
    private var heap = [HeapNode]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ node: HeapNode) {
        heap.append(node)
        var currentIdx = heap.count - 1
        while currentIdx > 0 && heap[(currentIdx - 1) / 2].cost > heap[currentIdx].cost {
            heap.swapAt(currentIdx, (currentIdx - 1) / 2)
            currentIdx = (currentIdx - 1) / 2
        }
    }
    mutating func pop() -> HeapNode {
        var currentIdx = 0
        heap.swapAt(0, heap.count - 1)
        let poppedValue = heap.removeLast()
        while currentIdx * 2 + 1 < heap.count {
            let leftChildIdx = currentIdx * 2 + 1
            let rightChildIdx = leftChildIdx + 1
            var minChildIdx = leftChildIdx
            if rightChildIdx < heap.count,
               heap[minChildIdx].cost > heap[rightChildIdx].cost {
                minChildIdx = rightChildIdx
            }
            if heap[minChildIdx].cost < heap[currentIdx].cost {
                heap.swapAt(currentIdx, minChildIdx)
                currentIdx = minChildIdx
            } else {
                break
            }
        }
        return poppedValue
    }
}

func dijkstra(_ start: Location, _ direction: Direction) -> [[[Int]]] {
    var costs = [[[Int]]](
        repeating: [[Int]](
            repeating: [Int](repeating: Int.max, count: 4),
            count: n
        ),
        count: n
    )
    
    var heap = Heap()
    heap.push((location: start, direction: direction, cost: 0))
    costs[start.row][start.column] = [0, 0, 0, 0]

    while !heap.isEmpty {
        let (currentLocation, currentDirection, currentCost) = heap.pop()
        guard costs[currentLocation.row][currentLocation.column][currentDirection.rawValue] >= currentCost else {
            continue
        } 
        guard ["!", ".", "#"].contains(graph[currentLocation.row][currentLocation.column]) else {
            continue
        }
        var directions = [currentDirection]
        if graph[currentLocation.row][currentLocation.column] == "!" {
            switch currentDirection {
            case .up, .down: directions += [Direction.right, Direction.left]
            case .right, .left: directions += [Direction.up, Direction.down]
            }
        }
        for direction in directions {
            let nextLocation = (
                row: currentLocation.row + direction.move.row,
                column: currentLocation.column + direction.move.column
            )
            guard 0..<n ~= nextLocation.row && 0..<n ~= nextLocation.column else {
                continue
            }
            guard graph[nextLocation.row][nextLocation.column] != "*" else {
                continue
            }
            let newCost = direction == currentDirection ? currentCost : currentCost + 1
            if costs[nextLocation.row][nextLocation.column][direction.rawValue] > newCost {
                costs[nextLocation.row][nextLocation.column][direction.rawValue] = newCost
                heap.push((location: nextLocation, direction: direction, cost: newCost))
            }
        }
    }
    return costs
}

let n = Int(readLine()!)!
var graph = [[Character]]()
for _ in 0..<n {
    graph.append(Array(readLine()!))
}
var mirrors = [Location]()
for row in graph.indices {
    for column in graph[row].indices {
        if graph[row][column] == "#" {
            mirrors.append((row: row, column: column))
        }
    }
}
let startMirror = mirrors[0]
let destinationMirror = mirrors[1]
var answer = Int.max
for dir in Direction.allCases {
    guard 0..<n ~= startMirror.row + dir.move.row && 0..<n ~= startMirror.column + dir.move.column else {
         continue 
    } 
    if graph[startMirror.row + dir.move.row][startMirror.column + dir.move.column] != "*" {
        answer = min(
            dijkstra(startMirror, dir)[destinationMirror.row][destinationMirror.column].min()!,
            answer
        )
    }
}

print(answer)
