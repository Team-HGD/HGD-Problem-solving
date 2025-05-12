// https://www.acmicpc.net/problem/15486

typealias Counseling = (start: Int, cost: Int)

let n = Int(readLine()!)!
var schedule = [[Counseling]](repeating: [], count: n)
var dp = [Int](repeating: 0, count: n)
for idx in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    guard idx + input[0] - 1 < n else { continue }
    schedule[idx + input[0] - 1].append((start: idx, cost: input[1]))
}

for i in 0..<n {
    dp[i] = i > 0 ? dp[i - 1] : 0
    var max = dp[i]
    for s in schedule[i] {
        if s.start - 1 < 0 {
            if s.cost > max {
                max = s.cost
            }
        } else if dp[s.start - 1] + s.cost > max {
            max = dp[s.start - 1] + s.cost
        }
    }
    dp[i] = max
}
print(dp[n - 1])
