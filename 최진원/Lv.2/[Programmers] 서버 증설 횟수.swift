// https://school.programmers.co.kr/learn/courses/30/lessons/389479

import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var answer = 0
    var currentServersCount = [Int](repeating: 0, count: players.count)
    players.enumerated().forEach { (idx, playerCount) in
        var serversNeededCount = playerCount / m
        if serversNeededCount > currentServersCount[idx] {
            let additionalServers = serversNeededCount - currentServersCount[idx]
            answer += additionalServers
            for n in 0..<k {
                guard idx + n < players.count else { continue }
                currentServersCount[idx + n] += additionalServers
            }
        }
    }
    return answer
}
