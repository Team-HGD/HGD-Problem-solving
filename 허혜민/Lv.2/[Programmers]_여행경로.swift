// https://school.programmers.co.kr/learn/courses/30/lessons/43164

import Foundation

var ans: [String] = []
var adj: [String: [String]] = [:]
var n: Int = 0 

func solution(_ tickets:[[String]]) -> [String] {
    n = tickets.count 
    
    for ticket in tickets {
        adj[ticket[0], default: []].append(ticket[1])
    }
    for key in adj.keys {
        adj[key, default: []] = adj[key, default: []].sorted()
    }
    
    var visited: [String] = ["ICN"] 
    traverse(prev: "ICN", count: 0, visited: &visited)
    
    return ans
}

func traverse(prev: String, count: Int, visited: inout [String]) {
    if count == n {
        if ans.isEmpty {
            ans = visited
        }
        return 
    }
    
    for next in 0..<adj[prev, default: []].count {
        if adj[prev]![next] == "" {
            continue 
        }
        let candidate = adj[prev]![next]
        adj[prev]![next] = ""
        visited.append(candidate)
        traverse(prev: candidate, count: count + 1, visited: &visited)
        adj[prev]![next] = candidate
        visited.popLast()
    }
}
