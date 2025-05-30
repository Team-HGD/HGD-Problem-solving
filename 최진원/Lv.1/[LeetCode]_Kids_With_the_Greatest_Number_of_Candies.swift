// https://leetcode.com/problems/kids-with-the-greatest-number-of-candies

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let currentMax = candies.max()!
        return candies.map { $0 + extraCandies >= currentMax }
    }
}
