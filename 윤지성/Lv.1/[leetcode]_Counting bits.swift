// https://leetcode.com/problems/counting-bits/
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var answer: [Int] = []
        for num in 0...n {
            let arr = Array(String(num, radix: 2))
            answer.append(arr.filter{ $0 == "1"}.count )
        }
        return answer
    }
}
