//https://leetcode.com/problems/decode-string/

class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [String] = []
        var subStr: String = ""
        for s in Array(s).map{ String($0)} {
            guard s == "]" else {
                stack.append(s)
                continue
            }
           
            while let str = stack.popLast() {
                print(stack)
                if str == "[" {
                    var repeatingNumStr: String = ""
                    while let str = stack.popLast() {
                        if let num = Int(str) {
                            repeatingNumStr = str + repeatingNumStr
                        } else {
                            stack.append(str)
                            break
                         }
                    }
                    guard let repeatingNum = Int(repeatingNumStr) else { continue }
                    var output: String = ""
                    for _ in 0..<repeatingNum {
                        output += subStr
                    }
                   
                    stack.append(output)
                    subStr = ""
                    break
                }
                subStr = str + subStr
            }
        }
        return stack.joined(separator: "")
    }
}
