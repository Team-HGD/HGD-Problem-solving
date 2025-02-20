// https://www.acmicpc.net/problem/5719

typealias HeapNode = (destination: Int, cost: Int)

struct Heap {
    private var heap = [HeapNode]()
    var isEmpty: Bool { heap.isEmpty }
    mutating func push(_ node: HeapNode) {
        var currentIdx = heap.count
        heap.append(node)
        while currentIdx > 0 && heap[currentIdx].cost < heap[(currentIdx - 1) / 2].cost {
            heap.swapAt(currentIdx, (currentIdx - 1) / 2)
            currentIdx = (currentIdx - 1) / 2
        }
    }
    mutating func pop() -> HeapNode {
        var currentIdx = 0
        heap.swapAt(0, heap.count - 1)
        let minValue = heap.removeLast()
        while currentIdx * 2 + 1 < heap.count {
            let leftChildIdx = currentIdx * 2 + 1
            let rightChildIdx = leftChildIdx + 1
            var minChildIdx = leftChildIdx
            if rightChildIdx < heap.count && heap[rightChildIdx].cost < heap[minChildIdx].cost {
                minChildIdx = rightChildIdx
            }
            guard heap[minChildIdx].cost >= heap[currentIdx].cost else { break }
            heap.swapAt(currentIdx, minChildIdx)
            currentIdx = minChildIdx
        }
        return minValue
    }
}

func dijkstra(start: Int, destination: Int, n: Int, graph: inout [Int: [Int: Int]]) -> ([Int], [Int: [Int]]) {
    var costs = [Int](repeating: Int.max, count: n)
    var heap = Heap()
    heap.push((start, 0))
    costs[start] = 0
    var route = [Int: [Int]]()
    while !heap.isEmpty {
        let (dest, cost) = heap.pop()
        guard costs[dest] >= cost,
              let neighbors = graph[dest] else { continue }
        for (nextDest, nextCost) in neighbors {
            let newCost = cost + nextCost
            if newCost < costs[nextDest] {
                costs[nextDest] = newCost
                heap.push((nextDest, newCost))
                route[nextDest] = [dest]
            } else if newCost == costs[nextDest] {
                route[nextDest, default: []].append(dest)
            }
        }
    }
    return (costs, route)
}


func removeAllShortestRoutes(route: [Int: [Int]], start: Int, destination: Int, graph: inout [Int: [Int: Int]]) {
    var queue = [destination]
    var visited = Set<Int>()
    
    while !queue.isEmpty {
        let node = queue.removeLast()
        if node == start { continue }
        
        if let parents = route[node] {
            for parent in parents {
                graph[parent]?[node] = nil
                if !visited.contains(parent) {
                    queue.append(parent)
                    visited.insert(parent)
                }
            }
        }
    }
}

var graph = [Int: [Int: Int]]()

while true {
    let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (n, m) = (nm[0], nm[1])
    guard n != 0 || m != 0 else { break }
    let sd = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (s, d) = (sd[0], sd[1])
    graph = [:]
    for _ in 0..<m {
        let uvp = readLine()!.split(separator: " ").compactMap { Int($0) }
        let (u, v, p) = (uvp[0], uvp[1], uvp[2])
        graph[u, default: [:]][v] = p
    }
    let (shortestCosts, shortestRoutes) = dijkstra(start: s, destination: d, n: n, graph: &graph)
    let shortestCost = shortestCosts[d]

    if shortestCost != Int.max {
        removeAllShortestRoutes(route: shortestRoutes, start: s, destination: d, graph: &graph)
    }

    var answer = shortestCost
    while answer == shortestCost {
        let (newCosts, _) = dijkstra(start: s, destination: d, n: n, graph: &graph)
        answer = newCosts[d]
    }
    
    print(answer == Int.max ? -1 : answer)
}
