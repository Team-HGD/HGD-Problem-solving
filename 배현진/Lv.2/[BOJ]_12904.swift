// https://www.acmicpc.net/problem/12904

import Foundation

let S = readLine()!
let T = readLine()!

func convert(_ S: String, _ T: String) -> Int {
    var current = Array(T)

    while current.count > S.count {
        if current.last == "A" {
            current.removeLast()
        } else if current.last == "B" {
            current.removeLast()
            current.reverse()
        } else {
            break
        }
    }

    return String(current) == S ? 1 : 0
}

print(convert(S, T))
