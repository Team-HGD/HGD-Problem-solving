// https://www.acmicpc.net/problem/1911
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let n = input[0]
let length = input[1]
var ponds: [[Int]] = []
(1...n).forEach { _ in
    let posistions = readLine()!.split(separator: " ").map{ Int(String($0))!}
    ponds.append(posistions)
}
ponds = ponds.sorted(by: { $0.first! < $1.first!})
var answer: Int = 0
var startPosistion: Int = 0
for pond in ponds {
    let last = pond[1]
    startPosistion = max(pond[0], startPosistion)
    let pondLength = last - startPosistion
    var count = pondLength / length
    
    if pondLength % length > 0 { count += 1}
    answer += count
    startPosistion += count * length
}
print(answer)
