// https://leetcode.com/problems/maximum-subarray/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var subArrSum: Int = nums[0]
        var maxSum: Int = nums[0]

        for idx in 1..<nums.count {
            if subArrSum + nums[idx] < nums[idx] {
                subArrSum = nums[idx]
            } else {
                subArrSum += nums[idx]
            }
            maxSum = max(maxSum, subArrSum)
        }
        return maxSum
    }
}
