// https://www.acmicpc.net/problem/1138
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var occupied: [Bool] = Array(repeating: false, count: 10 )
var posistions: [Int] = Array(repeating: 0, count: 10 )
for (idx, count) in arr.enumerated() {
    var empty: Int = -1
    var i: Int = 0
    while true {
        if occupied[i] == false { empty += 1 }
        if empty == count { break }
        i += 1
    }
    posistions[i] = idx + 1
    occupied[i] = true
}
print(posistions[..<n].map{String($0)}.joined(separator: " "))
