// https://leetcode.com/problems/move-zeroes

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count >= 2 else { return }
        var start = 0
        var end = 1
        while start <= end && end < nums.count {
            if nums[start] == 0 && nums[end] != 0 {
                nums.swapAt(start, end)
            }
            if end == start {
                end += 1
            } else if nums[end] == 0 {
                end += 1
            } else {
                start += 1
            }
        }
    }
}
