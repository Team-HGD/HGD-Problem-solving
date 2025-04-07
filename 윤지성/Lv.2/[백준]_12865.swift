// https://www.acmicpc.net/problem/12865
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let n = input[0]
let k = input[1]

var elements: [Int] = Array(repeating: 0, count: k + 1)
var maximum: Int = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    let w = input[0]
    let v = input[1]
    var tempArr: [Int] = elements
    var temp: Int = maximum
    
    for i in 0...maximum {
        guard i + w <= k else {
            continue
        }
        if i == 0  {
            tempArr[w] = max(elements[w], v)
            temp = max(maximum, w)
        } else {
            if elements[i] != 0 {
                tempArr[i + w] = max(elements[i + w], v + elements[i])
                temp = max(maximum, i + w)
            }
        }
    }
    elements = tempArr
    maximum = temp
}

print(elements.max()!)

