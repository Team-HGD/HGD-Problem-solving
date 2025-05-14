class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        func gcd(_ a: Int, _ b: Int) -> Int {
            var a = a
            var b = b
            while b != 0 {
                let remainder = a % b
                a = b
                b = remainder
            }
            return a
        }
        let stringGCD = gcd(str1.count, str2.count)
        var answer = String(str1.prefix(stringGCD))
        guard str1.split(separator: answer) == [] && str2.split(separator: answer) == [] else {
            return ""
        }
        return answer
    }
}
