// https://www.acmicpc.net/problem/2623

import Foundation

func dfs(_ node: Int, _ cycleCheck: inout Set<Int>) {
    isVisited[node] = true
    cycleCheck.insert(node)
    for nextNode in graph[node, default: []] {
        if cycleCheck.contains(nextNode) {
            print(0)
            exit(0)
        }
        if isVisited[nextNode] {
            continue
        }
        dfs(nextNode, &cycleCheck)
    }
    cycleCheck.remove(node)
    answer.append(node)
}

let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])
var graph = [Int: [Int]]()
var isVisited = [Bool](repeating: false, count: n + 1)
var answer = [Int]()

for _ in 0..<m {
    let edges = readLine()!.split(separator: " ").dropFirst().compactMap { Int($0) }
    for idx in 1..<edges.count {
        if !graph[edges[idx - 1], default: []].contains(edges[idx]) {
            graph[edges[idx - 1], default: []].append(edges[idx])
        }
    }
}

for node in 1...n {
    if isVisited[node] {
        continue
    }
    var cycleCheck = Set<Int>()
    dfs(node, &cycleCheck)
}

answer.reversed().forEach { print($0) }
