// https://www.acmicpc.net/problem/2004
import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let n = get2N5Cnt(input[0])
let m = get2N5Cnt(input[1])
let o = get2N5Cnt(input[0] - input[1])

let num = min(n.0 - m.0 - o.0, n.1 - m.1 - o.1)
print(max(0, num))

func get2N5Cnt(_ num: Int) -> (Int, Int) {
    var n = num
    var twoCnt = 0
    var fiveCnt = 0
    while n / 2 > 0 {
        twoCnt += n / 2
        n /= 2
    }
    n = num
    while n / 5  > 0{
        fiveCnt += n / 5
        n /= 5
    }
    return (twoCnt, fiveCnt)
}
