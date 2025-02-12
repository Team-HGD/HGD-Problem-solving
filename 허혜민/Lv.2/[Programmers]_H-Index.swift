// https://school.programmers.co.kr/learn/courses/30/lessons/42747#

import Foundation

func solution(_ citations:[Int]) -> Int {
    var n = citations.count
    let maxIndex = citations.max()!
    var hIndex: Int = 0 
    for key in 0..<maxIndex+1 {
        let count = citations.filter({ $0 >= key }).count
        if count >= key { 
            hIndex = max(key, hIndex)
        }
    }
    return hIndex
}
