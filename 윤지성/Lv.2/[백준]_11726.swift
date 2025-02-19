// https://www.acmicpc.net/problem/11726
import Foundation

let n = Int(readLine()!)!
var rectCnt: [Int] = Array(repeating: 0, count: 1000 + 1)
rectCnt[1] = 1
rectCnt[2] = 2
if n >= 3 {
    for i in 3...n {
        rectCnt[i] = (rectCnt[i - 2] + rectCnt[i - 1]) % 10007
    }
}
print(rectCnt[n])

/*
진짜 dp는 너무 어렵다.....
먼저 규칙을 파악할 필요가 있다. 사각형을 구성하는 경우는 2가지로 나눌 수 있을 것이다.
 앞이 세로 사각형으로 시작하는지 가로 사각형으로 시작하는 2가지 경우로 말이다.
 
 여기서 새로 사각형으로 시작되면 채워야하는 남은 사각형은 n-1 길이의 사각형이다.
 그렇다면 가로 사각형은 어떨까? 가로 사각형으로 시작하면 길이 2가 채워지고 채워야 하는 남은 사각형은 N-2 길이의 사각형이다.
 
 여기까지 읽으면 이제 알 것이다. 피보나치이다! (충격)
 무조건 새로 아님 가로로 시작하니 각 경우에 대해서 그 전에 구했던 n-2, n-1 사각형의 경우의 수를 더하는 것이다.
 */
