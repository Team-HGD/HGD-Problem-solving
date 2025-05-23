// https://www.acmicpc.net/problem/1052

import Foundation

if let input = readLine() {
    let parts = input.split(separator: " ").compactMap { Int($0) }
    if parts.count == 2 {
        let N = parts[0]
        let K = parts[1]
        print(bottleResult(N, K))
    }
}

func bottleResult(_ N: Int, _ K: Int) -> Int {
    if N <= K {
        return 0
    }

    var current = N
    while countBottle(current) > K {
        current += 1
    }

    return current - N
}

func countBottle(_ num: Int) -> Int {
    var n = num
    var count = 0
    while n > 0 {
        count += n % 2
        n /= 2
    }
    return count
}
