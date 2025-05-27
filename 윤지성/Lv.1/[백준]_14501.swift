// https://www.acmicpc.net/problem/14501

import Foundation

let t = Int(readLine()!)!
var schedule = Array(repeating: 0, count: t + 1)

for day in 0..<t {
    let counsel = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    let duration = counsel[0]
    let price = counsel[1]
    
    guard day + duration <= t else { continue }
    schedule[day + duration] = max(schedule[...day].max()! + price, schedule[day + duration])
}
print(schedule.max()!)
