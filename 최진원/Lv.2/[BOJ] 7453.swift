let n = Int(readLine()!)!
var integerArray = [[Int]](repeating: [Int](repeating: 0, count: n), count: 4)
for idx1 in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for idx2 in 0..<4 {
        integerArray[idx2][idx1] = input[idx2]
    }   
}
var abSumTable = [Int: Int]()
var cdSumTable = [Int: Int]()
var answer = 0

for idx1 in 0..<n {
    for idx2 in 0..<n {
        abSumTable[integerArray[0][idx1] + integerArray[1][idx2], default: 0] += 1
        cdSumTable[integerArray[2][idx1] + integerArray[3][idx2], default: 0] += 1
    }
}

for (key, abCount) in abSumTable {
    if let cdCount = cdSumTable[-1 * key] {
        answer += (cdCount * abCount)
    }
}

print(answer)
