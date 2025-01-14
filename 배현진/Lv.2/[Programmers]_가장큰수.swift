// https://school.programmers.co.kr/learn/courses/30/lessons/42746?language=swift

import Foundation

func solution(_ numbers:[Int]) -> String {
    var arr = numbers.map{ String($0) }
    arr.sort{ $0+$1 > $1+$0 }

    if arr[0] == "0" {
        return "0"
    } else {
        return arr.joined(separator: "")
    }
}
