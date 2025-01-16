// https://school.programmers.co.kr/learn/courses/30/lessons/42747?language=swift

import Foundation

func solution(_ citations:[Int]) -> Int {
    var sortedCitations = citations.sorted(by: >)
    var result = 0

    for i in 0..<sortedCitations.count {
        if sortedCitations[h] >= i+1 {
            result += 1
        } else {
            break
        }
    }
    return result
}
