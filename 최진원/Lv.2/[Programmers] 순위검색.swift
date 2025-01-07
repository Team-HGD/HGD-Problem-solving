// https://school.programmers.co.kr/learn/courses/30/lessons/72412

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {    
    func lowerBound(_ target: Int, _ scores: [Int]) -> Int {
        var low = 0
        var high = scores.count
        
        while low < high {
            let mid = low + (high - low) / 2
            if target <= scores[mid] {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return high
    }
    
    let infoArray = info.map { $0.split(separator: " ").map { String($0) } }
    let queryArray = query.map { $0.split(separator: " ").map { String($0) }.filter { $0 != "and" } }
    var tree = [String: [Int]]()
    var answer = [Int]()
    
    for person in infoArray {
        let score = Int(person.last!)!
        for lang in ["-", person[0]] {
            for group in ["-", person[1]] {
                for career in ["-", person[2]] {
                    for food in ["-", person[3]] {
                        tree[lang + group + career + food, default: []].append(score)
                    }
                }
            }
        }
    }
    
    for (key, value) in tree {
        tree[key] = value.sorted { $0 < $1 }
    }
    
    for q in queryArray {
        let key = q[0] + q[1] + q[2] + q[3]
        let target = Int(q.last!)!
        answer.append(tree[key, default: []].count - lowerBound(target, tree[key, default: []]))
    }

    return answer
}
