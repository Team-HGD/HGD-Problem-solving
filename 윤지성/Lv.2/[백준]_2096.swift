// https://www.acmicpc.net/problem/2096
import Foundation

let n = Int(readLine()!)!
var maxArr: [Int] = Array(repeating: 0, count: 3)
var minArr: [Int] = Array(repeating: 0, count: 3)

(1...n).forEach {
    let arr = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
    if $0 == 1 {
        maxArr = arr
        minArr = arr
    } else {
            // 1번째 원소
            let firstMax = max(maxArr[0], maxArr[1]) + arr[0]
            let firstMin = min(minArr[0], minArr[1]) + arr[0]
             // 2번째 원소
            let secondMax = max(max(maxArr[0], maxArr[1]), maxArr[2]) + arr[1]
            let secondMin = min(min(minArr[0], minArr[1]), minArr[2]) + arr[1]

            // 3번째 원소
            let thirdMax = max(maxArr[1], maxArr[2]) + arr[2]
            let thridMin = min(minArr[1], minArr[2]) + arr[2]
        
            maxArr = [firstMax, secondMax, thirdMax]
            minArr = [firstMin, secondMin, thridMin]
    }
}

let maximum = maxArr.max()!
let minimum = minArr.min()!
print(maximum, minimum)
