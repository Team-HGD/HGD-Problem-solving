// https://www.acmicpc.net/problem/1466
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let n = input[0]
let d = input[1]
var map: [Int] = (0...d).map{ $0 }
var routes: [(Int, Int, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    let start = input[0]
    let end = input[1]
    let cost = input[2]
    routes.append((start, end, cost))
}
routes.sort{ $0.0 < $1.1 }

for (start, end, cost) in routes {
    if end > d { continue }
    map[end] = min(map[end], map[start] + cost)
    for i in end...d {
        map[i] = min(map[i], map[end] + ( i - end ) )
    }
}

print(map[d])

