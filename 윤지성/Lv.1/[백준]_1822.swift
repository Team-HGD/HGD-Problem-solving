// https://www.acmicpc.net/problem/1822
import Foundation

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0))}
let numOfA = input[0]
let numOfB = input[1]

let aArr = readLine()!.split(separator: " ").compactMap{ Int(String($0))}.sorted()
let bArr = readLine()!.split(separator: " ").compactMap{ Int(String($0))}.sorted()
var answer: [Int] = []
for element in aArr {
    var lt = 0
    var rt = (numOfB - 1)
    var exists: Bool = false
    while lt <= rt {
        let mid = (lt + rt) / 2
        let aElement = bArr[mid]
        
        if aElement == element { exists = true; break }
        else if aElement > element { rt = mid - 1}
        else if aElement < element { lt = mid + 1}
    }
    if !exists { answer.append(element) }
}

print(answer.count)
print(answer.map{String($0)}.joined(separator: " "))
