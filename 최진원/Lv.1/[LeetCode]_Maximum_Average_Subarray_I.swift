// https://leetcode.com/problems/maximum-average-subarray-i

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = nums[0..<k].reduce(0) { $0 + $1 }
        var answer = Double(sum) / Double(k)
        for idx in k..<nums.count {
            sum += (nums[idx] - nums[idx - k])
            answer = max(answer, Double(sum) / Double(k))
        }
        return answer
    }
}
