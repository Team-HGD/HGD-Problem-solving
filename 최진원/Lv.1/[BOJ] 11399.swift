// https://www.acmicpc.net/problem/11399

var n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").compactMap { Int($0) }
p.sort { $0 < $1 }
var answer = 0
p.forEach {
    answer += $0 * n
    n -= 1
}
print(answer)
