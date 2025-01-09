import Foundation

let n = Int(readLine()!)!
var stack = [Int]()
var answer = 0

for _ in 0..<n {
    let newBuilding = Int(readLine()!)!
    
    if stack.isEmpty {
        stack.append(newBuilding)
        continue
    }
    
    while !stack.isEmpty,
          let lastBuilding = stack.last,
          lastBuilding <= newBuilding {
        stack.removeLast()
    }
    answer += stack.count
    stack.append(newBuilding)
}

print(answer)
