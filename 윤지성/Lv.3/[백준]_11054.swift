//https://www.acmicpc.net/problem/11054
import Foundation

let t = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}

func getLISCount(_ arr: [Int]) -> [Int] {
    var dp: [Int] = [arr[0]]
    var lengthArr: [Int] = [1]
    guard t > 1  else { return lengthArr }
    for idx in 1...(arr.count - 1) {
        let length = dp.count
        let number = arr[idx]
        for i in 0...(length - 1) {
           let lastNumber = dp[i]
            if lastNumber < number {
                if (length - 1) > i { dp[i + 1] = min(dp[i + 1], number)}
                else { dp.append(number)}
            } else if number < lastNumber {
                dp[i] = number
                break
            } else { break }
        }
        lengthArr.append(dp.count)
    }
    return lengthArr
}

let leftCount = getLISCount(arr)
var rightCount = getLISCount(Array(arr.reversed()))
rightCount = Array(rightCount.reversed())
let sum: [Int] = (0...(t - 1)).map { leftCount[$0] + rightCount[$0] - 1}
print(sum.max()!)
