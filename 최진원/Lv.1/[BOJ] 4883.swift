// https://www.acmicpc.net/problem/4883

var testcaseNum = 1
while let n = Int(readLine()!), n != 0 {
    var graph = [[Int]]()
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").compactMap { Int($0) })
    }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
    dp[0] = graph[0]
    dp[1][0] = graph[0][1] + graph[1][0]
    dp[1][1] = min(graph[0][1], graph[0][1] + graph[0][2], dp[1][0]) + graph[1][1]
    dp[1][2] = min(graph[0][1], graph[0][1] + graph[0][2], dp[1][1]) + graph[1][2]
    for i in 2..<n {
        dp[i][0] = min(dp[i - 1][0], dp[i - 1][1]) + graph[i][0]
        dp[i][1] = min(dp[i - 1][0], dp[i - 1][1], dp[i - 1][2], dp[i][0]) + graph[i][1]
        dp[i][2] = min(dp[i - 1][1], dp[i - 1][2], dp[i][1]) + graph[i][2]
    }
    print("\(testcaseNum). \(dp[n - 1][1])")
    testcaseNum += 1
}
