func trackPath(_ startNode: Int) {
    var current = startNode
    print(current)
    while current != 1 {
        current = parent[current]
        print(current)
    }
}

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: max(4, n + 1))
var parent = [Int](repeating: 0, count: max(4, n + 1))
dp[2] = 1
dp[3] = 1
parent[1] = 0
parent[2] = 1
parent[3] = 1
if n >= 4 {
    for i in 4...n {
        dp[i] = dp[i - 1]
        parent[i] = i - 1
        if i % 2 == 0 && dp[i / 2] < dp[i] { 
            dp[i] = dp[i / 2]
            parent[i] = i / 2
        }
        if i % 3 == 0 && dp[i / 3] < dp[i] { 
            dp[i] = dp[i / 3]
            parent[i] = i / 3
        }
        dp[i] += 1
    }
}
print(dp[n])
trackPath(n)
