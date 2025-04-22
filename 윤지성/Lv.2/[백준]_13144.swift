// https://www.acmicpc.net/problem/13144
import Foundation

let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
var left = 0
var right = 0
var numDict: [Int : Bool] = [sequence[0]: true]
var answer = 1

while right < (n - 1) {
    if let isExisted = numDict[sequence[right + 1]] { // 수가 겹치는 경우
        if left == right {
            numDict[sequence[left]] = nil
            left += 1
            right += 1
            numDict[sequence[right]] = true
            answer += 1
        } else {
            while let _ = numDict[sequence[right + 1]] {
                numDict[sequence[left]] = nil
                left += 1
            }
            right += 1
            numDict[sequence[right]] = true
            answer += 1
        }
    } else { // 겹치는 수가 없는 경우
        right += 1
        numDict[sequence[right]] = true
        answer += 1
    }
    answer += (right - left)
}
print(answer)
