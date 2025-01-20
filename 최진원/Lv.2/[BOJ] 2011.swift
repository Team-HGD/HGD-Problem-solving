// https://www.acmicpc.net/problem/2011

import Foundation

let cipher = readLine()!.compactMap { Int(String($0)) }
var dpTable = [Int](repeating: 1, count: cipher.count + 1)
let MOD = 1000000

guard cipher.first != 0 else {
    print(0)
    exit(0)
}
guard cipher.count > 1 else { 
    print(1)
    exit(0)
}

for idx in 1..<cipher.count {
    let numberPair = cipher[idx - 1] * 10 + cipher[idx]
    if cipher[idx] == 0 && ![1, 2].contains(cipher[idx - 1]) {
        print(0)
        exit(0)
    }
    if numberPair < 26 {
        if cipher[idx] == 0 {
            dpTable[idx + 1] = dpTable[idx - 1] % MOD
        } else if cipher[idx - 1] == 0 {
            dpTable[idx + 1] = dpTable[idx] % MOD
        } else {
            dpTable[idx + 1] = (dpTable[idx] + dpTable[idx - 1]) % MOD
        }
    } else {
        dpTable[idx + 1] = dpTable[idx] % MOD
    }
}

print(dpTable[cipher.count])
