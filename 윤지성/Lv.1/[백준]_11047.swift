// https://www.acmicpc.net/problem/11047
import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))}

let num = input[0]
var arr: [Int] = []
var total: Int = input[1]!

var moneyStack = Stack()

var output:Int = 0

for _ in 1...num!{
    moneyStack.push(element: Int(readLine()!)!)
}

for _ in 1...num!{
    let money = moneyStack.pop()
    let count = (total / money)
    if(count >= 1){
        output = output + count
        total = total % money
    }
    if(total == 0){
        break
    }
}
print(output)

struct Stack{
    private var stack: [Int] = []
    private var isEmpty: Bool {
        return stack.count == 0
    }
    public mutating func push(element: Int){
        stack.append(element)
    }
    public mutating func pop() -> Int {
        return stack.removeLast()
    }
}
