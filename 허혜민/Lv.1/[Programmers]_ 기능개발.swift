// https://school.programmers.co.kr/learn/courses/30/lessons/42586

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var ans: [Int] = []
    var mark: [Int] = []
    let days: [Int] = zip(progresses, speeds).map {
        var day = (100-$0) / $1 
        if (100-$0) % $1 != 0 {
            day += 1
        }
        return day
    }
    
    mark.append(days[0])
    var count = 1
    for i in 1..<progresses.count {
        if mark.last! < days[i] {
            mark.append(days[i])
            ans.append(count)
            count = 1
            continue
        }
        count += 1
    }
 
    if mark.count != ans.count {
        ans.append(count)
    }
    return ans
}
