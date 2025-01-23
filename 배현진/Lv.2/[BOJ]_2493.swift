// https://www.acmicpc.net/problem/2493

let n = Int(readLine()!)!
let tops = readLine()!.split(separator: " ").map { Int($0)! }
var stack = [(Int, Int)]()
var result = [Int]()

for (i, height) in tops.enumerated() {
    while !stack.isEmpty && stack.last!.0 <= height {
        stack.removeLast()
    }
    if stack.isEmpty {
        result.append(0)
    } else {
        result.append(stack.last!.1 + 1)
    }
    stack.append((tops[i], i))
}

print(result.map { String($0)}.joined(separator: " "))

// 배열을 한줄로 출력할 수 있도록 변환하는 부분 외워두자!!
