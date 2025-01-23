// https://school.programmers.co.kr/learn/courses/30/lessons/17682
import Foundation

func solution(_ dartResult:String) -> Int {
    let dartArr = Array(dartResult).map{ String($0) }
    var numArr: [Int] = []
    var idx = 0
    while idx < dartArr.count {
        var str = dartArr[idx]
        if var num = Int(str) {
            if let num1 = Int(dartArr[idx + 1] ) {
                num = 10
                idx += 1
            }
            var multiplier: Double = 0
            switch dartArr[idx + 1] {
                case "S":
                multiplier = 1.0
                case "D":
                multiplier = 2.0
                case "T":
                multiplier = 3.0
                default:
                break
            }
            numArr.append( Int(pow(Double(num), multiplier)) )
            idx += 2
        } else {
            switch str {
                case "*":
                var tempArr: [Int] = []
                (0 ..< 2).forEach { _ in
                    if var num = numArr.popLast() {
                        num *= 2
                        tempArr.append(num)
                    }
                }
                while !tempArr.isEmpty {
                   let num = tempArr.removeLast()
                    numArr.append(num)
                }
                
                case "#":
                if var num = numArr.popLast() {
                    num *= -1
                    numArr.append(num)
                }
                default:
                break
            }
         idx += 1
        }
    }

    return numArr.reduce(0, +)
}
