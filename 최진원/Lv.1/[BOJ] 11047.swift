// https://www.acmicpc.net/problem/11047

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
var k = nk[1]
var a = [Int]()
for _ in 0..<n {
    a.append(Int(readLine()!)!)
}
var answer = 0
for coin in a.reversed() where k > 0 {
    guard coin <= k else { continue }
    answer += k / coin
    k %= coin
}
print(answer)
