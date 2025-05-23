// https://www.acmicpc.net/problem/11501

import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
    let _ = Int(readLine()!)!
    let prices = readLine()!.split(separator: " ").map { Int($0)! }
    print(maxProfit(prices: prices))
}

func maxProfit(prices: [Int]) -> Int64 {
    var profit: Int64 = 0
    var maxPrice = 0

    for price in prices.reversed() {
        if price > maxPrice {
            maxPrice = price
        } else {
            profit += Int64(maxPrice - price)
        }
    }

    return profit
}
