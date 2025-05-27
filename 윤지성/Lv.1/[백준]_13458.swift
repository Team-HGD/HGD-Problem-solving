// https://www.acmicpc.net/problem/13458

import Foundation

let t = Int(readLine()!)!
let classes = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let director1 = input[0]
let director2 = input[1]
var answer = 0

for studentCnt in classes {
    var remain = studentCnt - director1 >= 0 ? studentCnt - director1 : 0
    answer += 1
    answer += remain % director2 > 0 ? remain / director2 + 1 : remain / director2
}
print(answer)
