// https://www.acmicpc.net/problem/6588
import Foundation

var dict: [Int: Bool] = [:] // 캐싱을 위한 빈 딕셔너리

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    if num == 2 || num == 3 || num == 5 || num == 7 || num == 11 { return true } // 기본 소수 처리
    if num % 2 == 0 { return false } // 짝수 빠르게 거름
    if let cached = dict[num] { return cached } // 캐싱된 값이 있으면 반환
    for i in stride(from: 3, through: Int(sqrt(Double(num))), by: 2) {
        if num % i == 0 {
            dict[num] = false
            return false
        }
    }
    dict[num] = true
    return true
}
var arr = Array(repeating: true, count: 1000000 + 1)
arr[1] = false

for i in 2...Int(sqrt(1000000)) + 1 {
    if !isPrime(i) { continue }
    var j = 2
    while i * j <= 1000000 {
        arr[i * j] = false
        j += 1
    }
}
while true {
    guard let input = readLine(), let n = Int(input) else { break }
    if n == 0 { break }
    var diff: Int = 0
    for i in stride(from: 3, through: n / 2, by: 2) {
        if n - i > 0 && arr[n - i] && arr[i] { // 음수 방지
            diff = i
            break
        }
    }
    if diff != 0 {
        print("\(n) = \(diff) + \(n - diff)")
    } else {
        print("Goldbach's conjecture is wrong.")
    }
}
