// https://leetcode.com/problems/maximum-product-subarray/
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var answer: Int = nums.max()!
        var maxValue: Int = nums[0]
        var minValue: Int = nums[0]
        for idx in 1 ..< nums.count {
            let num = nums[idx]
            let tmpMax = max(num, max(maxValue * num , minValue * num)) // (-4, 12, 12 ) (-2, -24, 6)
            minValue = min(num, min(maxValue * num, minValue * num)) // (-3, 12, 12), (-2, 6, )
            maxValue = tmpMax
            answer = max(answer, maxValue)
        }
        return answer
    }
}
