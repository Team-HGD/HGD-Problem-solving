// https://leetcode.com/problems/product-of-array-except-self/description/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftNumArr: [Int] = []
        var rightNumArr: [Int] = []
        var output: [Int] = []
        var leftNum = 1
        var rightNum = 1
        for (idx, num) in nums.enumerated() {
            leftNumArr.append(leftNum)
            leftNum *= num

            rightNumArr.append(rightNum)
            rightNum *= nums[nums.count - 1 - idx]
        }

        for idx in 0..<nums.count {
            output.append(leftNumArr[idx] * rightNumArr[nums.count - 1 - idx])
        }
        return output
    }
}
