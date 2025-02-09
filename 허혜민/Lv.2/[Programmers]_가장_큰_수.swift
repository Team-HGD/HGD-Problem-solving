// https://school.programmers.co.kr/learn/courses/30/lessons/42746

import Foundation

func solution(_ numbers:[Int]) -> String {
    let result = numbers
    .map{ String($0) }
    .sorted{ $0 + $1 > $1 + $0 }
    .joined(separator: "")
    return Int(result) == 0 ? "0" : result
}
