// https://leetcode.com/problems/maximum-subarray/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var processedArr: [Int] = []
        var addent: Int = 0
        for num in nums {
            // 그 전의 수 값과 현재의 수가 부호가 다르면 배열에 전 수를 추가하고 새로운 수를 보관한다.
            if hasDifferentSign(addent, num) { // 음수, 양수인 경우
                processedArr.append(addent)
                addent = num
            } else { // 같은 부호를 가지고 있는 수인 경우
                addent += num
            }
        }
        processedArr.append(addent)

        if processedArr.count == 1 {
            if let last = processedArr.last {
                if last < 0 {
                    return nums.max()!
                }
            }
        }

        var maxOutput: Int = Int.min
        var subArrSum: Int = 0
        for (idx, num) in processedArr.enumerated() {
            subArrSum += num
            if subArrSum > 0 {
                maxOutput = max(subArrSum, maxOutput)
            } else {
                if idx == processedArr.count - 1 {
                    subArrSum == num
                    maxOutput = max(subArrSum, maxOutput)
                }
                else {
                    subArrSum = 0
                }
            }
        }
        return maxOutput
    } // 음, 양, 음 양 음 양
    // 음일 때 마이너스가 되더라도 그 뒤에 값으로 인해서 플러스가 될 것인가
    func hasDifferentSign(_ num1: Int, _ num2: Int) -> Bool {
        return (num1 < 0 && 0 < num2) || (num2 < 0 && 0 < num1)
    }
}
