// https://leetcode.com/problems/contains-duplicate/
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numsDict = [Int : Int]()
        for num in nums {
            if let addent = numsDict[num] {
                return true
            } else {
                numsDict[num] = 0
            }
        }
        return false
    }
}
