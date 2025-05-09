// https://school.programmers.co.kr/learn/courses/30/lessons/389480

import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    var newInfo = info
    newInfo.sort {
        ($0[0] - $0[1], $0[0]) > ($1[0] - $1[1], $1[0])
    }
    var iClawCount = 0
    var jClawCount = 0
    for loot in newInfo {
        if jClawCount + loot[1] < m {
            jClawCount += loot[1]
        } else {
            guard iClawCount + loot[0] < n else { return -1 }
            iClawCount += loot[0]
        }
    }
    return iClawCount
}
