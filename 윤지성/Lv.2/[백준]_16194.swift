// https://www.acmicpc.net/problem/16194
import Foundation

let n = Int(readLine()!)!
let prices: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))!}
var minPrices: [Int] = Array(repeating: Int.max, count: 1000 + 1)
minPrices[0] = 0
minPrices[1] = prices[0]

for i in 1...n {
   for idx in 0...(n - 1) {
       let cardCnt = idx + 1
       let price = prices[idx]
       if cardCnt > i { break }
       minPrices[i] = min(minPrices[i], minPrices[i - cardCnt] + price)
   }
}
print(minPrices[n])
