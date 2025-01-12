// https://leetcode.com/problems/single-number/
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for num in nums {
            if let containing = dict[num] {
                dict[num] = containing + 1
            } else {
                dict[num] = 1
            }
        }
        for num in nums {
            if dict[num] == 1 {
                return num
            }
        }
        return 0
    }
}
