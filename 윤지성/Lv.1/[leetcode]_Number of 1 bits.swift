// https://leetcode.com/problems/number-of-1-bits/
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var binaryString: String = String(n, radix: 2)
        var answer: Int = 0
        for n in binaryString {
            if n == "1" {
                answer += 1
            }
        }
        return answer
    }
}
// decimal에서 binary로 바꾸는 함수는 String(n, radix: 2)를 사용하면 되는구나!
