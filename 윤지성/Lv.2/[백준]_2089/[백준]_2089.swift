// https://www.acmicpc.net/problem/2089
import Foundation

var n = Int(readLine()!)!
// 이진수로 표현해야 하니까 나머지가 1 또는 0이어야 함.
var answer = ""
while true {
    if n == 1 || n == 0 { answer = String(n) + answer; break}
    if n < 0 {
        if n % -2 == -1 { n = n / -2 + 1; answer = "1" + answer}
        else { n = n / -2; answer = "0" + answer}
    } else {
        if n % -2 == 1 { n = n / -2; answer = "1" + answer}
        else { n = n / -2; answer = "0" + answer}
    }
}
print(answer)
