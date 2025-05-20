// https://school.programmers.co.kr/learn/courses/30/lessons/150369

import Foundation

func solution(_ cap: Int, _ n: Int, _ deliveries: [Int], _ pickups: [Int]) -> Int64 {
    var totalDistance = 0
    var carriedDeliveries = 0
    var carriedPickups = 0
    for townIndex in stride(from: n - 1, through: 0, by: -1) {
        carriedDeliveries += deliveries[townIndex]
        carriedPickups += pickups[townIndex]
        while carriedDeliveries > 0 || carriedPickups > 0 {
            totalDistance += (townIndex + 1) * 2
            carriedDeliveries -= cap
            carriedPickups -= cap
        }
    }
    return Int64(totalDistance)
}
