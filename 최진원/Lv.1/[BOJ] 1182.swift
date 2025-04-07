// https://www.acmicpc.net/problem/1182

func dfs(sum: Int, current: Int) {
    guard current < n else { return }
    var newSum = sum
    newSum += sequence[current]
    if newSum == s { answer += 1 }
    dfs(sum: newSum, current: current + 1)
    dfs(sum: newSum - sequence[current], current: current + 1)
}

let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, s) = (ns[0], ns[1])
let sequence = readLine()!.split(separator: " ").compactMap { Int($0) }
var answer = 0
dfs(sum: 0, current: 0)
print(answer)
