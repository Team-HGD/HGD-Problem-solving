// https://www.acmicpc.net/problem/9613
import Foundation

let n = Int(readLine()!)!
var answer = 0
(1...n).forEach {
    _ in
    answer = 0
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
    for i in 1 ..< (arr.count - 1) {
        for j in (i + 1) ..< arr.count {
            answer += gcd(arr[j], arr[i])
        }
    }
    print(answer)
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    if num2 == 0 {
        return num1
    }
    return gcd(num2, num1 % num2)
}

// 유클리드 호재법은 제일 빠르게 gcd를 구할 수 있는 알고리즘이다.
// 서로의 수를 계속 나누고 나머지와도 계속해서 반복한다. 나머지가 0일 때까지 나머지가 0이면 다른 수가 gcd인것!
