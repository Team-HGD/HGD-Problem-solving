// https://www.acmicpc.net/problem/17281
import Foundation

let inningCnt = Int(readLine()!)!
var hittingList: [[Int]] = []
for _ in 0..<inningCnt {
    hittingList.append(readLine()!.split(separator: " ").compactMap{ Int(String($0)) })
}
func permute(_ num: Int) -> [[Int]] {
    var result: [[Int]] = []
    var visited = Array(repeating: false, count: num)
    
    func backtrack(_ path: [Int]) {
        if path.count == (num - 1) {
            result.append(path)
            return
        }
        for i in 1..<num {
            if visited[i] { continue }
            visited[i] = true
            backtrack(path + [i])
            visited[i] = false
        }
    }
    backtrack([])
    return result
}
var answer: Int = 0
let hitterList: [[Int]] = permute(9)

hitterList.forEach {
    let hitters = $0[0...2] + [0] + $0[3...7]
    var inning: Int = 0
    var score: Int = 0
    var idx = 0
    
    while inning < inningCnt {
        var outCnt = 0
        var base1 = false
        var base2 = false
        var base3 = false
        while outCnt < 3 {
            let hitter = hitters[idx]
            let hitting = hittingList[inning][hitter]
            switch hitting {
            case 1, 2, 3, 4:
                let result = hit(base1, base2, base3, hitting)
                 score += result.0
                 base1 = result.1
                 base2 = result.2
                 base3 = result.3
            case 0:
                outCnt += 1
            default:
                break
            }
            idx += 1
            idx = idx > 8 ? idx % 9 : idx
        }
        inning += 1
    }
    answer = max(answer, score)
}
print(answer)

func hit(_ base1: Bool, _ base2: Bool, _ base3: Bool, _ hit: Int) -> (Int, Bool, Bool, Bool) {
    var point: Int = 0
    var newBase1 = false
    var newBase2 = false
    var newBase3 = false
    switch hit {
        case 1:
            if base3 { point += 1 }
            newBase3 = base2 ? true : false
            newBase2 = base1 ? true : false
            newBase1 = true
        case 2:
            if base3 { point += 1 }
            if base2 { point += 1 }
            newBase3 = base1 ? true : false
            newBase2 = true
        case 3:
            if base3 { point += 1 }
            if base2 { point += 1 }
            if base1 { point += 1 }
            newBase3 = true
        case 4:
            if base3 { point += 1 }
            if base2 { point += 1 }
            if base1 { point += 1 }
            point += 1
        default:
            break
    }
    return (point, newBase1, newBase2, newBase3)
}

