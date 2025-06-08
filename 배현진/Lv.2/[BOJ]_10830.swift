// https://www.acmicpc.net/problem/10830

import Foundation

let mod = 1000
let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let b = Int64(input[1])!

var matrix = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append(row)
}

func multiply(_ a: [[Int]], _ b: [[Int]], _ mod: Int) -> [[Int]] {
    let n = a.count
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                result[i][j] += a[i][k] * b[k][j]
                result[i][j] %= mod
            }
        }
    }
    return result
}

func power(_ matrix: [[Int]], _ exponent: Int64, _ mod: Int) -> [[Int]] {
    let n = matrix.count
    
    if exponent == 1 {
        return matrix.map { row in row.map { $0 % mod } }
    }
    
    var half = power(matrix, exponent / 2, mod)
    half = multiply(half, half, mod)
    
    if exponent % 2 == 1 {
        half = multiply(half, matrix, mod)
    }
    
    return half
}

let result = power(matrix, b, mod)

for row in result {
    print(row.map { String($0) }.joined(separator: " "))
}
