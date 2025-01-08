// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit: Int = 0
        var minPrice = Int.max
        for price in prices {
           if price < minPrice {
            minPrice = price
           }
           if price - minPrice > maxProfit {
            maxProfit = price - minPrice
           }
        }
        return maxProfit
    }
}

// 개선 전 문제 풀이
//class Solution {
//    func maxProfit(_ prices: [Int]) -> Int {
//        var priceStack: [Int] = []
//        var maxProfit: Int = 0
//        for price in prices {
//            while true {
//                if let last = priceStack.last {
//                    if price < last {
//                      priceStack.popLast()
//                    } else {
//                        if priceStack.count == 2  {
//                            priceStack.popLast()
//                            priceStack.append(price)
//                            break
//                        } else {
//                            priceStack.append(price)
//                        }
//                    }
//                } else {
//                    priceStack.append(price)
//                    break
//                }
//            }
//            if priceStack.count == 2 {
//                maxProfit = max(maxProfit, priceStack[1] - priceStack[0])
//            }
//        }
//        return maxProfit
//    }
//}
