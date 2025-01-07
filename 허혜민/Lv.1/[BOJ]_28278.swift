// https://www.acmicpc.net/problem/28278
import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<n {
    let commandLine = readLine()!.split(separator: " ").map{ Int($0)! } // components(separatedBy:)를 쓰면 시간초과 
    switch commandLine.first! {
    case 1:
        stack.append(commandLine.last!)
    case 2:
        print(stack.popLast() ?? -1)
    case 3:
        print(stack.count)
    case 4:
        print(stack.isEmpty ? 1 : 0)
    case 5:
        print(stack.last ?? -1)
    default:
        continue
    }
}
