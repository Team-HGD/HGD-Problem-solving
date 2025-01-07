// https://school.programmers.co.kr/learn/courses/30/lessons/340212

import Foundation

func solution(_ diffs: [Int], _ times: [Int], _ limit: Int64) -> Int {
    let limit = Int(limit)
    
    func solvePuzzle(_ level: Int) -> Bool {
        var timeSum = 0
        var timePrev = 0
        for (diff, time) in zip(diffs, times) {
            if level >= diff {
                timeSum += time
                if timeSum > limit { return false }
            } else {
                timeSum += (timePrev + time) * (diff - level) + time
                if timeSum > limit { return false }
            }
            timePrev = time
        }
        return true
    }
    
    var low = 1
    var high = 100_001
        
    while low < high {
        let mid = low + (high - low) / 2
        if solvePuzzle(mid) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    return high
}