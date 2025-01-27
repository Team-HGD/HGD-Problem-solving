// https://school.programmers.co.kr/learn/courses/30/lessons/118666
import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var scores: [String: Int] = [:]
    var typeCategory: [[String]] = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    typeCategory = typeCategory.map{ $0.sorted() }
    ["R", "T", "C", "F", "J", "M", "A", "N"].forEach {
        scores[$0] = 0
    }
    var answer: String = ""
    for (idx, types) in survey.enumerated() {
        var typeArr = Array(types).map{String($0)}
        let disAgreeType = typeArr[0]
        let agreeType = typeArr[1]
        switch choices[idx] {
            case 1, 2, 3:
            if let score = scores[disAgreeType] {
                scores[disAgreeType] = score + 4 - choices[idx]
            }
            case 4:
            break
            case 5, 6, 7:
            if let score = scores[agreeType] {
                scores[agreeType] = score + choices[idx] - 4
            }
            default:
            break
        }
    }
    for types in typeCategory {
        if let firstCnt = scores[types[0]],
        let secondCnt = scores[types[1]] {
            if firstCnt >= secondCnt {
                answer += types[0]
            } else {
                answer += types[1]
            }
        }
    }
    return answer
}
