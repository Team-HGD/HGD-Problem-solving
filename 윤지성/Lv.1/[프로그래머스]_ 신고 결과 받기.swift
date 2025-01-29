// https://school.programmers.co.kr/learn/courses/30/lessons/92334
import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 신고 횟수 제한 없고 한번에 한명 - 중복 처리
    var reportDict: [String: [String]] = [:]
    var answerDict: [String: Int] = [:]
    for id in id_list {
        reportDict[id] = []
        answerDict[id] = 0
    }
    
    for element in report {
        let inputArr = element.split(separator: " ").map{ String($0) }
        let reportingPerson = inputArr[0]
        let reportedPerson = inputArr[1]
        if var reportArr = reportDict[reportedPerson] {
            reportArr.append(reportingPerson)
            reportArr = Array(Set(reportArr))
            reportDict[reportedPerson] = reportArr
        }
    }

    id_list.forEach {
        if let reportArr = reportDict[$0] {
            if reportArr.count >= k {
                for person in reportArr {
                    if let cnt = answerDict[person] {
                        answerDict[person] = cnt + 1
                    }
                }
            }
        }
    }
    var answer: [Int] = []
    id_list.forEach {
        if let count = answerDict[$0] {
            answer.append(count)
        }
    }
    return answer
}
