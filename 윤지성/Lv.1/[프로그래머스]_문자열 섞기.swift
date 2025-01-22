// https://school.programmers.co.kr/learn/courses/30/lessons/181942

import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    let str1 = Array(str1)
    let str2 = Array(str2)
    var answer: String = ""
    for (idx, str) in str1.enumerated() {
        answer += String(str)
        answer += String(str2[idx])
    }
    return answer
}
