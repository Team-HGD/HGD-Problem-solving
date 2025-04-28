let tw = readLine()!.split(separator: " ").compactMap { Int($0) }
let (t, w) = (tw[0], tw[1])
var schedule = [Int](repeating: 0, count: t)
schedule.indices.forEach { idx in
    schedule[idx] = Int(readLine()!)!
}
var currentLocation = 1
// dp[i][j]: order i, count j
var dp = [[Int]](repeating: [Int](repeating: 0, count: w + 1), count: t)
// odd -> location 2
// even -> location 1
dp[0][0] = schedule[0] == 1 ? 1 : 0
dp[0][1] = schedule[0] == 1 ? 0 : 1

for idx in 1..<schedule.count {
    for moveCount in 0...w {
        if moveCount > 0 {
            dp[idx][moveCount] = max(dp[idx - 1][moveCount - 1], dp[idx - 1][moveCount])
        } else {
            dp[idx][moveCount] = dp[idx - 1][moveCount]
        }
        if moveCount % 2 + 1 == schedule[idx] { 
            dp[idx][moveCount] += 1
        }
    }
}

print(dp.flatMap{ $0 }.max()!)