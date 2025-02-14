// https://www.acmicpc.net/problem/17103
import Foundation

let n = Int(readLine()!)!
var arr: [Bool] = Array(repeating: true, count: 1000000 + 1)
arr[1] = false
arr[0] = false
for i in 2...1000000  {
    if arr[i] {
        var n = 2
        while i * n <= 1000000 {
            arr[i * n] = false
            n += 1
        }
    }
}
(1...n).forEach {
    _ in
    let input = Int(readLine()!)!
    var answer = 0
    for i in stride(from: 3, through: input / 2, by: 2) {
       if arr[i] && arr[input - i]  { answer += 1 }
    }
    if arr[2] && arr[input - 2] { answer += 1}
    print(answer)
}

// 에라토스테네스의 체 알고리즘을 사용하며 풀었다. 질문게시판에 해당 알고리즘에 대해서 설명해주신 좋은 글이 있어서 가져왔다.
// 에라토스테네스의 체는 매 쿼리마다 전체를 한 번씩 계산하라고 있는 알고리즘이 아니고, 전체적으로 한 번 계산한 뒤에 여러 번 재사용하는 알고리즘입니다. 다만, 소수의 개수는 O(n)보다 작은 O(n / logn)이
// 에라토스테네스의 체 시간복잡도는 O(nloglogn)입니다. 따라서 n이 10^7이 되더라도 100~200ms 내에 잘 돌아가는 알고리즘이다. 이 문제의 n은 10^6이니까 사용하기에 적합하다.


