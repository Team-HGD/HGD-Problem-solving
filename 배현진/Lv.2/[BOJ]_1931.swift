// https://www.acmicpc.net/problem/1931

import Foundation

let n = Int(readLine()!)!
var meetings = [[Int]]()
var count = 0
var endTime = 0

for _ in 0..<n {
    meetings.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

meetings.sort{ return $0[0] < $1[0] }
meetings.sort{ return $0[1] < $1[1] }

for meeting in meetings {
    if count == 0 || meeting[0] >= endTime {
        endTime = meeting[1]
        count += 1
    }
}

print(count)
