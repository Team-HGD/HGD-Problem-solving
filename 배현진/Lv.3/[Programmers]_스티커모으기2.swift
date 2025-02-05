// https://school.programmers.co.kr/learn/courses/30/lessons/12971

import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0

    if sticker.count < 3 {
        return sticker.max()!
    }

    var dp1 = Array(repeating: 0, count: sticker.count)
    var dp2 = Array(repeating: 0, count: sticker.count)

    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    dp2[0] = 0
    dp2[1] = sticker[1]

    for i in 2..<sticker.count {
        dp1[i] = (max(dp1[i-2] + sticker[i], dp1[i-1]))
        dp2[i] = (max(dp2[i-2] + sticker[i], dp2[i-1]))
    }
    dp1.removeLast()
    answer = max(dp1.max()!, dp2.max()!)

    return answer
}
