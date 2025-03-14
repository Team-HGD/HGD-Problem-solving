// https://www.acmicpc.net/problem/19637
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = input[0]
let m: Int = input[1]
var titleDict: [Int: String] = [:]
var maximums: [Int] = []
(1...n).forEach { _ in
    let input = readLine()!.split(separator: " ").map{ String($0)}
    let title = input[0]
    let maximum = Int(input[1])!
    if titleDict[maximum] == nil {
        titleDict[maximum] = title
        maximums.append(maximum)
    }
}
var answers: [String] = Array(repeating: "", count: m )
var hps: [(Int, Int)] = []
var idx: Int = 0

(1...m).forEach {
    let hp = Int(readLine()!)!
    hps.append(($0 - 1, hp))
}
hps.sort{ $0.1 < $1.1 }

hps.forEach {(i, hp) in
     while true {
        if hp <= maximums[idx] { break }
        idx += 1
    }
    answers[i] = titleDict[maximums[idx]]!
}

answers.forEach { print($0) }
