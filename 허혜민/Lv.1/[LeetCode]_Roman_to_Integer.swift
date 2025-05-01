// https://leetcode.com/problems/roman-to-integer/

class Solution {
     // IV 4 
        // IX 9 
        // XL 50 
        // XC 90
        // CD 400 500 - 100
        // CM 900 1000 - 100
        // MCMXCIV = 1000 + ()
    func romanToInt(_ s: String) -> Int { // stack 
        let romanIntegers: [Character: Int] = [
            "I" : 1, 
            "V" : 5, 
            "X" : 10, 
            "L" : 50, 
            "C" : 100,
            "D" : 500, 
            "M" : 1000
        ]

        var stack: [Character] = []
        var ans: Int = 0 
        for char in s {
            if let lastElement = stack.last {
                if romanIntegers[char]! > romanIntegers[lastElement]! {
                    ans += romanIntegers[char]! - romanIntegers[lastElement]!
                    stack.popLast()
                    continue 
                } 
            }
            stack.append(char)
        }

        for element in stack {
            ans += romanIntegers[element]!
        }
        return ans 
    }

    func romanToInWithDict(s: String) -> Int { // replace string 
        var s = s 
        let romanIntegers: [String: Int] = [
            "I" : 1, 
            "V" : 5, 
            "X" : 10, 
            "L" : 50, 
            "C" : 100,
            "D" : 500, 
            "M" : 1000,
            "a" : 4, 
            "b" : 9, 
            "c" : 40, 
            "d" : 90, 
            "e" : 400, 
            "f" : 900, 
        ]

        let subtitutions: [String: String] = [
            "IV" : "a",
            "IX" : "b",
            "XL" : "c",
            "XC" : "d",
            "CD" : "e",
            "CM" : "f"
        ]

        subtitutions.forEach {
            s = s.replacingOccurrences(of: $0, with: $1)
        }
        
        var ans = 0 
        s.forEach {
            ans += romanIntegers[String($0)]!
        }

        return ans 
    }
}
