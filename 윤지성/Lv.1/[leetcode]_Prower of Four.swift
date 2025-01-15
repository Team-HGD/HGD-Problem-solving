// https://leetcode.com/problems/power-of-four/
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        let bit = String(n, radix: 2)
        let zeroCnt = Array(bit).filter {$0 == "0"}.count
        return zeroCnt % 2 == 0 && (bit.count - zeroCnt) == 1
    }
}
