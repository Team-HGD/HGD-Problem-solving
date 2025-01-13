// https://school.programmers.co.kr/learn/courses/30/lessons/154538

import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    let inf: Int = 1000001
    var dp: [Int] = Array(repeating: inf, count: y+1)
    dp[x] = 0
    
    for i in x..<y {
        if i+n < y+1 {
            dp[i+n] = min(dp[i+n], dp[i]+1)
        }
        
        if 2*i < y+1 {
            dp[2*i] = min(dp[2*i], dp[i]+1)
        }
        
        if 3*i < y+1 {
            dp[3*i] = min(dp[3*i], dp[i]+1)
        }
    }
    
    return dp[y] == inf ? -1 : dp[y]
}
