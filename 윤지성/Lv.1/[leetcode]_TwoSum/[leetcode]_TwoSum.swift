// https://leetcode.com/problems/two-sum/
import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numDict = [Int : Int]()
        for (index, num) in nums.enumerated() {
            if let addent = numDict[num] {
                return [addent, index]
            }
            numDict[target-num] = index
        }
        return []
    }
}
