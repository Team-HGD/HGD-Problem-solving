// https://www.acmicpc.net/problem/1463
import Foundation

let n = Int(readLine()!)!
var arr: [Int] = Array(repeating: 1000000, count: 1000000 + 1)

arr[1] = 0
func getCount(_ n: Int ) -> Int {
    guard n != 1 else { return 0 }
    for i in 2...n {
        if i % 3 == 0 {
            arr[i] = min(1 + arr[i / 3], arr[i])
        }
        if i % 2 == 0 {
             arr[i] = min(1 + arr[i / 2], arr[i])
        }
        arr[i] = min(1 + arr[i - 1], arr[i])
    }
    return arr[n]
}
print(getCount(n))
