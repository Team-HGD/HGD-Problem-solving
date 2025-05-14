// https://school.programmers.co.kr/learn/courses/30/lessons/388352

import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    func checkCondition() -> Bool {
        for (idx, query) in setQ.enumerated() {
            guard query.intersection(secretCodeCandidate).count == ans[idx] else { 
                return false 
            }
        }
        return true
    }
    func dfs(currentIdx: Int, startNum: Int) {
        if secretCodeCandidate.count == 5 {
            if checkCondition() { answer += 1 }
            return
        }
        guard n - startNum + 1 >= 5 - secretCodeCandidate.count else { return }
        for i in startNum...n {
            secretCodeCandidate.insert(i)
            dfs(currentIdx: currentIdx + 1, startNum: i + 1)
            secretCodeCandidate.remove(i)
        }
    }
    let setQ = q.map { Set($0) }
    var secretCodeCandidate = Set<Int>()
    var answer = 0
    dfs(currentIdx: 0, startNum: 1)
    return answer
}
