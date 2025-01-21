// https://school.programmers.co.kr/learn/courses/30/lessons/118667

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let sum = (queue1.reduce(0, +) + queue2.reduce(0, +) )
    let count = queue1.count + queue2.count
    let halfSum = sum / 2
    if sum % 2 == 1 { return -1 }
    let queue = queue1 + queue2
    var subSum = 0
    if queue.filter({ $0 > halfSum }).isEmpty == false { return -1 }
    var answer = Int.max
    var rightPnt = 0
    
    for leftPnt in 0 ..< count {
        if leftPnt > 0 {
            subSum -= queue[leftPnt - 1]
        } else { rightPnt = leftPnt }
        while subSum < halfSum && rightPnt < count {
            subSum += queue[rightPnt]
            rightPnt += 1
        }
        if subSum == halfSum {
           if rightPnt < queue1.count  {
               answer = min(answer, leftPnt + rightPnt + count - queue1.count)
            } else {
              answer = min(answer, leftPnt + rightPnt - queue1.count )
           }
        }
    }
    if answer == Int.max { return -1 }
    else {return answer }
}
