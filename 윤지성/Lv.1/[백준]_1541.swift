// https://www.acmicpc.net/problem/1541
import Foundation

let input = Array(readLine()!).map{ String($0) }

var str: String = ""
var answer: Int = 0
var minusStack: [Int] = []
var plus: Bool = true

for s in input {
    if s == "+" || s == "-" { // 숫자라면
        if plus == false {
            minusStack.append(Int(str)!)
        } else {
            answer += Int(str)!
        }
        if s == "-" {
            answer -= minusStack.reduce(0, +)
            minusStack = []
            plus = false
        }
        str = ""
    } else {
        str += s
    }
}

if plus { answer += Int(str)! }
else {
    minusStack.append(Int(str)!)
    answer -= minusStack.reduce(0, +)
}
print(answer)
