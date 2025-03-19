// https://www.acmicpc.net/problem/12919
import Foundation

let s = readLine()!
let t = readLine()!

print(canChanged(from: s, into: t))

func canChanged(from a: String, into b: String) -> Int {
    var dp: [String] = [b]
    var temp: [String] = []
    while !dp.isEmpty {
        temp = []
        for str in dp {
            let newValues = changedStr(str)
            if newValues.contains(s) { return 1 }
            temp += newValues
        }
        dp = temp
    }
    return 0
}

func changedStr(_ str: String) -> [String] {
    guard str.count > 1 else { return [] }
    var arr: [String] = Array(str).map{ String($0)}
    var values: [String] = []
    if arr.last! == "A" {
        values.append(arr[...(str.count - 2)].joined(separator: ""))
    }
    if arr.first! == "B" {
        arr.reverse()
        values.append(arr[...(str.count - 2)].joined(separator: ""))
    }
    return values
}
