// https://school.programmers.co.kr/learn/courses/30/lessons/150368?language=swift
import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let disCountArr: [Int] = users.map{ $0[0] }
    var answerArr: [(Int, Int)] = []
    
    var emoticonsDiscounArr = combination(emoticons.count)
    for emoticonDiscount in emoticonsDiscounArr {
        var buyingCount = 0
        var totalPrice = 0
        for user in users {
            let percent = user[0]
            let limit = user[1]
            var price = 0
            for (idx, emoticon) in emoticons.enumerated() {
                if emoticonDiscount[idx] >= percent {
                    price += emoticon * ( 100 - emoticonDiscount[idx]) / 100
                }
            }
            if price >= limit { buyingCount += 1}
            else { totalPrice += price }
     }
    answerArr.append((buyingCount, totalPrice))
    }
    let answer = answerArr.sorted{ $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0}.last!
    
    return [answer.0, answer.1]
}

func combination(_ emoticonCount: Int) -> [[Int]] {
    var numbers = [10, 20, 30, 40]
    var result: [[Int]] = []
    func backTrack(_ current: [Int]) {
        if current.count == emoticonCount {
            result.append(current)
            return
        }
        for number in numbers {
            backTrack(current + [number])
        }
        
    }
    backTrack([])
    return result
}
