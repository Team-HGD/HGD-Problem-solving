// https://school.programmers.co.kr/learn/courses/30/lessons/12949

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = [] 
    var n = arr1.count 
    var m = arr1[0].count 
    
    for i in 0..<n {
        var row: [Int] = []
        for k in 0..<arr2[0].count {
            var sum = 0 
            for j in 0..<m {
                sum += arr1[i][j] * arr2[j][k]
            }
            row.append(sum)
        }
        result.append(row)
    }
    return result 
}
