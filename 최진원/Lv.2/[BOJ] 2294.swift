import Foundation

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])
var coins = Set<Int>()
var dpTable = [Int](repeating: Int.max - 1, count: k + 1)

for _ in 0..<n {
    let coin = Int(readLine()!)!
    guard coin <= k else { continue }
    coins.insert(coin)
    dpTable[coin] = 1
}

for coin in coins {
    for cost in 1...k {
        guard cost - coin > 0 else { continue }
        dpTable[cost] = min(dpTable[cost - coin] + 1, dpTable[cost])
    }
}

print(dpTable[k] == Int.max - 1 ? -1 : dpTable[k])
