// https://www.acmicpc.net/problem/2212

import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!

let sensors = readLine()!.split(separator: " ").map { Int($0)! }

if N <= K {
    print(0)
} else {
    let sortedSensors = sensors.sorted()

    var distances: [Int] = []
    for i in 1..<N {
        distances.append(sortedSensors[i] - sortedSensors[i - 1])
    }

    distances.sort(by: >)

    let minLength = distances.dropFirst(K - 1).reduce(0, +)
    print(minLength)
}

