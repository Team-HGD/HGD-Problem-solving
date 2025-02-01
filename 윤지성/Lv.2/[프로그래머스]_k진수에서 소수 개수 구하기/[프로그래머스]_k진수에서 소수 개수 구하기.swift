// https://school.programmers.co.kr/learn/courses/30/lessons/92335#
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var answer: Int = 0
    let numberArr = String(n, radix: k).split(separator: "0").map{ Int(String($0))! }
    for number in numberArr {
       if isPrime(number) { answer += 1}
    }
    return answer
}
func isPrime(_ num: Int) -> Bool {
    if num == 1 { return false }
    else if num == 2 || num == 3 { return true}
    else if num % 2 == 0 || num % 3 == 0 { return false }
    
    for factor in stride(from: 5, through: Int(sqrt(Double(num))), by: 2) {
        if num % factor == 0 { return false}
    }
    return true
}
