// https://www.acmicpc.net/problem/11052
import Foundation

let cardCnt = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map{ Int(String($0))!}
var maxPrices: [Int] = Array(repeating: 0, count: 1000 + 1)
maxPrices[1] = prices[0]
for i in 1...cardCnt {
    for idx in 0...(cardCnt - 1) {
        let number = idx + 1
        let price = prices[idx]
        if number > i { break }
        maxPrices[i] = max(maxPrices[i], price + maxPrices[i - number])
    }
}
print(maxPrices[cardCnt])
