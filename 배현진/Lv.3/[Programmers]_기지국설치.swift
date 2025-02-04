// https://school.programmers.co.kr/learn/courses/30/lessons/12979

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var firstAPT = 1
    var reachable = Double(2 * w + 1)
    var unReachable: Double

    for station in stations {
        unReachable = Double(station - w - firstAPT)
        answer += Int(ceil((unReachable / reachable)))
        firstAPT = station + w + 1
    }

    if firstAPT <= n {
        answer += Int(ceil((Double(n - firstAPT + 1) / reachable)))
    }

    return answer
}
