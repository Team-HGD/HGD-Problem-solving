// https://school.programmers.co.kr/learn/courses/30/lessons/64061#
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var eachBoards: [[Int]] = []
    var basket: [Int] = []
    var answer: Int = 0
    (0 ..< board.count).forEach { _ in
        eachBoards.append([])
    }
    board.forEach { row in
        row.enumerated().forEach { (idx, element) in
            if element  != 0 {
                eachBoards[idx].append(element)
            }
        }
    }
    eachBoards = eachBoards.map { $0.reversed() }
    // 세팅 완료
    moves.forEach { move in
       if let newElement = eachBoards[move - 1].popLast() {
               if basket.isEmpty {
                   basket.append(newElement)
               } else {
                  let topOfBasket = basket.removeLast()
                  if topOfBasket == newElement {
                      answer += 2
                  } else {
                      basket.append(topOfBasket)
                      basket.append(newElement)
                  }
               }
       }
    }
    return answer
}
