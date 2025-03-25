// https://www.acmicpc.net/problem/20437
import Foundation

let t = Int(readLine()!)!

(1...t).forEach { _ in
    var alphabetIndexs: [[Int]] = Array(repeating: [], count: 26)
    let str = readLine()!
    let num = Int(readLine()!)!
    var minimumLen: Int = 10000 + 1
    var maximumLen: Int = 0
    for (idx, char) in str.enumerated() {
        if num == 1 {
            minimumLen = 1
            maximumLen = 1
            break
        }
        let order = Int(char.asciiValue! - Character("a").asciiValue!)
        let charIdxs = alphabetIndexs[order]
        if charIdxs.count >= (num - 1) {
            let startIdx = charIdxs[charIdxs.count - (num - 1)]
            let length = idx - startIdx + 1
            if length < minimumLen {
                minimumLen = length
            }
            if length > maximumLen {
                maximumLen = length
            }
        }
        alphabetIndexs[order].append(idx)
    }
    if maximumLen == 0 {
        print(-1)
    } else {
        print("\(minimumLen) \(maximumLen)")
    }
}
