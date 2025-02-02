// https://school.programmers.co.kr/learn/courses/30/lessons/42579

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let n: Int = plays.count 
    var genresCount: [String: Int] = [:]
    var genresIndex: [String: [Int]] = [:]
    for i in 0..<n {
        genresCount[genres[i], default: 0] += plays[i]
        genresIndex[genres[i], default: []].append(i)
    }
    
    return genresCount.keys
    .sorted{ genresCount[$0, default: 0] > genresCount[$1, default: 0] }
    .flatMap {
        genresIndex[$0, default: []]
        .sorted{ plays[$0] > plays[$1] }
        .prefix(2)
    } 
}
