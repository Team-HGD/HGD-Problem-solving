let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, k) = (nk[0], nk[1])

var dpTable = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: k + 1)

for i in 0...n {
    dpTable[1][i] = 1
}

if k > 1 {
    for count in 2...k {
        for idx1 in 0...n {
            for idx2 in 0...idx1 {
                dpTable[count][idx1] += dpTable[count - 1][idx1 - idx2]
                dpTable[count][idx1] %= 1_000_000_000
            }
        }
    }
    print(dpTable[k][n])
} else {
    print(1)
}
