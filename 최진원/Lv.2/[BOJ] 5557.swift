// https://www.acmicpc.net/problem/5557

import Foundation

let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int($0) }
var dpTable = [[Int]](repeating: [Int](repeating: 0, count: 21), count: n - 1)
// dp[i][j] = i번째 수 일때 결과가 j인 개수

dpTable[0][seq[0]] = 1
var temp = 0

for idx1 in 1..<n - 1 {
    for idx2 in 0...20 {
        if 0...20 ~= idx2 + seq[idx1] {
            dpTable[idx1][idx2] += dpTable[idx1 - 1][idx2 + seq[idx1]]
        }
        if 0...20 ~= idx2 - seq[idx1] {
            dpTable[idx1][idx2] += dpTable[idx1 - 1][idx2 - seq[idx1]]
        }
    }
}

print(dpTable[n - 2][seq.last!])
