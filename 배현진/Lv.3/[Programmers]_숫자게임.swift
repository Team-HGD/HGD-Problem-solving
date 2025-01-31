// https://school.programmers.co.kr/learn/courses/30/lessons/12987

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var score = 0
    let a = a.sorted()
    let b = b.sorted()

    for i in b {
        if a[score] < i {
            score += 1
        }
    }

    return score
}
