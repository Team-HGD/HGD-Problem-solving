// https://www.acmicpc.net/problem/1965
import Foundation

let n = Int(readLine()!)!
let boxes = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
var dp: [Int] = Array(repeating: 1001, count: 1000 + 1)
var answer: Int = 1
dp[1] = boxes[0]
for i in 1..<n {
    let box = boxes[i]

    var length = 0
    for i in 1...answer {
        let lastBox = dp[i]
        if box > lastBox {
            dp[i + 1] = min(dp[i + 1], box)
            length = i + 1
            
        }
        else { dp[i] = min(box, lastBox); break  }
    }
    answer = max(answer, length)
}

print(answer)
