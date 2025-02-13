// https://www.acmicpc.net/problem/1009
import Foundation

let n = Int(readLine()!)!
let arr: [[Int]] = [[10], [1], [2, 4, 8, 6], [3, 9, 7, 1], [4, 6], [5], [6], [7, 9, 3, 1], [8, 4, 2, 6], [9, 1]]
(1...n).forEach {
    _ in
    let input = readLine()!.split(separator: " ").map{String($0)}
    let last = Int(Array(input[0]).map{String($0)}.last!)!
    let idx = (Int(input[1])! - 1) % arr[last].count
    print(arr[last][idx])
}
