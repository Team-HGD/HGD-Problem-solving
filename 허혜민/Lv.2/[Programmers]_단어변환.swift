// https://school.programmers.co.kr/learn/courses/30/lessons/43163#

import Foundation

var adj: [String: [String]] = [:]
var target: String = ""
var ans: Int = Int.max

func solution(
    _ begin:String,
    _ t:String,
    _ words:[String]
) -> Int {
    adj[begin] = [] 
    target = t 
    var visited: Set<String> = [begin] 
    for word in words {
        for key in adj.keys {
            if isAdj(key, word) {
                adj[key, default: []].append(word)
                adj[word, default: []].append(key)
            } else {
                adj[word, default: []] = adj[word, default: []]
            }
        }    
    }
    back(prev: begin, count: 0, visited: &visited)
    return ans == Int.max ? 0 : ans
}

func isAdj(_ a: String, _ b: String) -> Bool {
    var diff: Bool = false 
    for (charA, charB) in zip(a, b) {
        if charA != charB {
            if diff {
                return false 
            }
            diff = true 
        }
    }
    return diff
}

func back(prev: String, count: Int, visited: inout Set<String>) {
    if prev == target {
        ans = min(ans, count)
        return 
    }
    
    for next in adj[prev, default: []] {
        if visited.contains(next) {
            continue 
        }
        visited.insert(next)
        back(prev: next, count: count + 1, visited: &visited)
        visited.remove(next)
    }
}
