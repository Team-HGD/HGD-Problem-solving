// https://www.acmicpc.net/problem/15990
import Foundation

let t = Int(readLine()!)!
var dp_1: [Int] = Array(repeating:0, count:100000 + 1)
var dp_2: [Int] = Array(repeating:0, count:100000 + 1)
var dp_3: [Int] = Array(repeating:0, count:100000 + 1)
dp_1[1] = 1
dp_2[2] = 1
dp_1[3] = 1
dp_2[3] = 1
dp_3[3] = 1
var max = 3
(1...t).forEach {_ in
    let n = Int(readLine()!)!
    if n > max {
        for i in max + 1 ... n {
            for diff in 1...3 {
                getSum(i, diff)
            }
        }
        max = n
    }
    print((dp_1[n] + dp_2[n] + dp_3[n]) % 1000000009)
}

func getSum(_ num: Int, _ diff: Int) {
    switch diff {
        case 1:
        dp_1[num] = (dp_2[num - diff] + dp_3[num - diff]) % 1000000009
        case 2:
        dp_2[num] = (dp_1[num - diff] + dp_3[num - diff]) % 1000000009
        case 3:
        dp_3[num] = (dp_1[num - diff] + dp_2[num - diff]) % 1000000009
        default:
        break
    }
}
