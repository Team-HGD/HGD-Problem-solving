// https://www.acmicpc.net/problem/1373
import Foundation

var input = Array(readLine()!).map{String($0)}
if input.count % 3 == 2 { input = ["0"] + input }
else if input.count % 3 == 1 { input = ["0", "0"] + input }

var answer = ""
for i in stride(from: 0, through: input.count - 1, by: 3) {
    let str = input[i] + input[i + 1] + input[i + 2]
    answer += String(Int(str, radix:2)!, radix: 8)
}
print(answer)
