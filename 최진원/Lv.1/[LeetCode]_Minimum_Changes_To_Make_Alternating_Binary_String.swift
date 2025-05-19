// https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string

class Solution {
    func minOperations(_ s: String) -> Int {
        var startZeroCount = 0
        var startOneCount = 0
        s.enumerated().forEach { (idx, char) in
            if idx % 2 == Int(String(char))! {
                startOneCount += 1
            } else {
                startZeroCount += 1
            }
        }
        return min(startZeroCount, startOneCount)
    }
}
